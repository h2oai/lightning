require 'coffee-script/register'
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
shorthand = require './tools/shorthand/shorthand.coffee'

words = (str) -> str.split /\s+/g
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
shorthandImplicits = [ 'console', 'Math', 'lodash' ]
compileCoffee = (script) ->
  shorthand shorthandSymbols, (coffee.compile script), 
    implicits: shorthandImplicits

header_js = """
var test = require('tape');
var lodash = require('lodash');
var d3 = require('d3');
"""

build = ->
  console.log "Building..."
  cpn 'lib/lodash/dist/lodash.js', 'build/js/lodash.js'
  cpn 'lib/d3/d3.js', 'build/js/d3.js'
  cpn 'lib/comma-separated-values/csv.js', 'build/js/csv.js'

  vortex_coffee = read 'src/vortex.coffee'
  tests_coffee = read 'src/tests.coffee'
  write 'build/js/vortex.js', compileCoffee vortex_coffee
  write 'build/js/tests.js', header_js + compileCoffee [ vortex_coffee, tests_coffee ].join("\n")

  for csv in glob 'data/*.csv'
    cpn csv, locate 'build/data', path.basename csv

  cp 'build/js/vortex.js', 'dist/vortex.js'

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

watch = ->
  console.log 'Watching...'
  hound
    .watch locate 'src'
    .on 'change', (file, stats) ->
      if /\.(coffee)$/.test file
        console.log "#{file} changed. Rebuilding..."
        try
          build()
          test()
        catch error
          console.error error
  serve()

clean = ->
  console.log 'Cleaning...'
  rm 'build'

main = (argv) ->
  do clean if argv.c
  do build if argv.b
  do test if argv.t
  do watch if argv.w

main minimist (process.argv.slice 2),
  default:
    env: 'prod'
