require 'coffee-script/register'
_ = require 'lodash'
minimist = require 'minimist'
path = require 'path'
fs = require 'fs-extra'
glob = (require 'glob').sync
hound = require 'hound'
coffee = require 'coffee-script'
jade = require 'jade'
stylus = require 'stylus'
nib = require 'nib'
yaml = require 'js-yaml'
marked = require 'marked'
highlight = require 'highlight.js'
esprima = require 'esprima'
escodegen = require 'escodegen'
Uglify = require 'uglify-js'
desugar = require 'desugar'

EOL = "\n"
words = (str) -> str.split /\s+/g
trimArray = (lines) -> lines.join(EOL).trim().split(EOL)
locate = (names...) -> path.join.apply null, [ __dirname ].concat names
read = (src) ->
  console.log "Reading #{src}"
  fs.readFileSync src, encoding: 'utf8'
write = (src, data) ->
  console.log "Writing #{src}"
  fs.outputFileSync src, data
rm = (src) -> 
  console.log "Removing #{src}"
  fs.removeSync src
cp = (src, dest) -> 
  console.log "Copying #{src} #{dest}"
  fs.copySync src, dest
cpn = (src, dest) ->
  cp src, dest unless fs.existsSync dest

desugarSymbols = yaml.safeLoad read 'desugar.yml'
compileCoffee = (script) ->
  desugar desugarSymbols, coffee.compile script

node_header_js = """
var _ = require('lodash');
var d3 = require('d3');
var chroma = require('chroma-js');
"""
node_test_header_js = """
var test = require('tape');
var _ = require('lodash');
var d3 = require('d3');
var chroma = require('chroma-js');
"""

blockCommentPattern = /^\s*\#\#\#\s*$/
headerPattern = /^(plot)\s+([\w-]+)\s*$/
defaultArticleData = width: 640, height: 240
requiredFrontMatter = [ 'data' ]

defaultSettings = '''
plot.settings.axisLabelFont = '11px Lekton, monospace';
plot.settings.axisTitleFont = 'bold 11px Lekton, monospace';

'''

parseArticles = (compileScript, lines) ->
  # group into comment / code blocks
  blocks = []
  block = null
  code = yes
  for line in lines
    if blockCommentPattern.test line
      code = not code 
      blocks.push block if block
      block = 
        type: if code then 'code' else null
        lines: []
    else
      block.lines.push line.trimRight()

  # last block
  blocks.push block

  # parse comments and nest code
  articles = []
  articleSymbols = {}
  for block in blocks
    if block.type isnt 'code'
      # trim off empty top/bottom lines
      lines = trimArray block.lines

      # parse descriptor
      descriptor = lines.shift()
      if matches = headerPattern.exec descriptor
        block.type = matches[1]
        block.symbol = matches[2]
      else
        throw new Error "Invalid descriptor '#{descriptor}'"

      block.title = lines.shift()

      if block.type is 'plot'
        [ description, frontmatter ] = (lines.join EOL).split /[-]{3,}/

        # parse front matter
        block.data = if frontmatter then yaml.safeLoad frontmatter else {}
        _.defaults block.data, defaultArticleData

        # check required attrs
        for attr in requiredFrontMatter
          console.warn "Article '#{block.symbol}' is missing attribute '#{attr}'." unless block.data[attr]

        # parse description
        block.description = if description then marked description

        console.warn "Article '#{block.symbol}' is missing a description." unless block.description

      # clean up
      delete block.lines

      if articleSymbols[block.symbol]
        throw new Error "Duplicate Article '#{block.symbol}'."
      else
        articleSymbols[block.symbol] = yes
        articles.push block
    else
      article = articles[articles.length - 1]

      article.coffeescript = coffeescript = (trimArray block.lines).join EOL
      article.coffeescriptListing = (highlight.highlightAuto coffeescript, [ 'coffeescript' ]).value
      article.javascript = javascript = coffee.compile coffeescript, bare: yes
      article.javascriptListing = (highlight.highlightAuto javascript, [ 'javascript' ]).value

      article.script = defaultSettings + compileScript javascript.trim().substr(0, javascript.length - 2) + "(document.getElementById('example'));"

      article.scriptListing = (highlight.highlightAuto article.script, [ 'javascript' ]).value

  articles

buildDoc = ->
  console.log "Building docs..."

  for datapackage_yml in glob 'data/**/datapackage.yml'
    rawSchema = yaml.safeLoad read datapackage_yml

    datapackageFields = for name, descriptor of rawSchema.schema

      if _.isArray descriptor
        type = 'string'
        domain = descriptor
      else
        type = descriptor
        domain = undefined

      field =
        name: name
        type: type

      field.lightningDomain = domain if domain

      field

    datapackage_json =
      name: rawSchema.name
      resources: [
        path: rawSchema.location
        schema: datapackageFields
      ]

    cpn "data/#{rawSchema.name}/#{rawSchema.name}.csv", "build/data/#{rawSchema.name}/#{rawSchema.name}.csv"
    write "build/data/#{rawSchema.name}/datapackage.json", JSON.stringify datapackage_json, null, 2

  cpn 'lib/jquery/dist/jquery.js', 'build/js/jquery.js'

  jsLibs = [
    'lib/lodash/dist/lodash.js'
    'lib/d3/d3.js'
    'lib/chroma-js/chroma.js'
    'lib/papaparse/papaparse.js'
    'lib/diecut/diecut.js'
  ]

  write 'build/js/lightning-lib.js', (read lib for lib in jsLibs).join EOL

  cpn 'node_modules/highlight.js/styles/tomorrow.css', 'build/css/syntax.css'
  cpn 'lib/HTML5-Reset/assets/css/reset.css', 'build/css/reset.css'

  stylus.render (read 'src/doc.styl'), { filename: 'build/doc.css' }, (error, css) ->
    throw error if error
    write 'build/css/doc.css', css
  templatePath = 'src/doc.jade'
  renderPage = jade.compileFile templatePath,
    filename: templatePath
    pretty: yes

  plot_coffee = locate 'build/js/lightning-node.js'
  if key = require.resolve plot_coffee
    delete require.cache[ key ]
  plot = require plot_coffee
  compileScript = plot.parse esprima, escodegen

  articles = parseArticles compileScript, (read 'src/doc.coffee').split EOL

  for article, i in articles
    write "build/#{article.symbol}.html", renderPage
      type: 'article'
      article: article
      previousArticle: if i > 0 then articles[i - 1] else null
      nextArticle: if i < articles.length - 1 then articles[i + 1] else null

  write 'build/index.html', renderPage
    type: 'articles'
    articles: articles

  return


build = (argv) ->
  console.log "Building..."

  lightning_coffee = read 'src/lightning.coffee'
  tests_coffee = read 'src/tests.coffee'
  lightning = compileCoffee lightning_coffee
  write 'build/js/lightning.js', lightning
  write 'build/js/lightning-node.js', node_header_js + EOL + lightning
  #TODO compile lightning only once.
  write 'build/js/tests.js', node_test_header_js + EOL + compileCoffee [ lightning_coffee, tests_coffee ].join(EOL)

  # *** DANGER ***
  # cp 'build/js/lightning.js', 'dist/lightning.js'
  # cp 'dist/lightning.js', '../h2o-flow/vendor/h2oai/lightning.min.js'

  if argv.m
    cp 'build/js/lightning.js', 'dist/lightning.js'
    uglification = Uglify.minify [ 'dist/lightning.js' ], warnings: yes
    write 'dist/lightning.min.js', uglification.code
    cp 'dist/lightning.min.js', '../h2o-flow/vendor/h2oai/lightning.min.js'

  return

test = ->
  console.log 'Testing...'
  testFile = locate 'build/js/tests.js'
  if key = require.resolve testFile
    delete require.cache[ key ]
  require testFile

serve = ->
  port = 8080
  console.log "Starting server at localhost:#{port} ..."
  connect = require 'connect'
  server = require 'serve-static'
  connect()
    .use server locate 'build'
    .listen port

watch = (argv) ->
  console.log 'Watching...'
  hound
    .watch locate 'src'
    .on 'change', (file, stats) ->
      console.log file
      if /\.(coffee)$/.test file
        console.log "#{file} changed..."
        try
          build argv
          test()
        catch error
          console.error error
  serve()

clean = ->
  console.log 'Cleaning...'
  rm 'build'

main = (argv) ->
  clean() if argv.c
  build argv if argv.b or argv.d
  buildDoc() if argv.d
  test() if argv.t
  watch argv if argv.w

main minimist (process.argv.slice 2),
  default:
    env: 'prod'
