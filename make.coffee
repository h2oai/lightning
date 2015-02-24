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
shorthand = require './tools/shorthand/shorthand.coffee'

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

shorthandSymbols = yaml.safeLoad read 'shorthand.yml'
shorthandImplicits = [ 'console', 'Math', '_' ]
compileCoffee = (script) ->
  shorthand shorthandSymbols, (coffee.compile script), 
    implicits: shorthandImplicits

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

      article.script = compileScript 'var f = ' + javascript + EOL + "f(function(error, vis){if(error){document.getElementById('error').innerHTML=error.message;}else{document.getElementById('plot').appendChild(vis.element);}});"

  articles

buildDoc = ->
  console.log "Building docs..."

  for csv in glob 'data/*.csv'
    cpn csv, locate 'build/data', path.basename csv

  for schema_yml in glob 'data/*.yml'
    write "build/data/#{path.basename schema_yml, '.yml'}.json", JSON.stringify (yaml.safeLoad read schema_yml), null, 2

  cpn 'lib/jquery/dist/jquery.js', 'build/js/jquery.js'
  cpn 'lib/lodash/dist/lodash.js', 'build/js/lodash.js'
  cpn 'lib/d3/d3.js', 'build/js/d3.js'
  cpn 'lib/chroma-js/chroma.js', 'build/js/chroma.js'
  cpn 'lib/comma-separated-values/csv.js', 'build/js/csv.js'

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

  cp 'build/js/lightning.js', 'dist/lightning.js'

  # *** DANGER ***
  # cp 'dist/lightning.js', '../h2o-flow/vendor/h2oai/lightning.min.js'

  if argv.m
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
