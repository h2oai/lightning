#
# Vortex
#

# TODO fix mmin, mmax, vvalues in shorthand

operation = (f, args...) -> -> apply f, null, args

arrayElementsAreEqual = (xs, ys) ->
  if xs and ys and xs.length is ys.length
    return no for x, i in xs when x isnt ys[i]
    yes
  else
    no

#
# Pseudo-types
#

TUndefined = 'undefined'
TNull = 'null'
TBoolean = 'Boolean'
TString = 'String'
TNumber = 'Number'
TFunction = 'Function'
TObject = 'Object'
TArray = 'Array'
TArguments = 'Arguments'
TDate = 'Date'
TRegExp = 'RegExp'
TError = 'Error'

#
# Type detection
#

typeOf = (a) ->
  type = Object::toString.call a
  if a is null
    TNull
  else if a is undefined
    TUndefined
  else if a is yes or a is no or type is '[object Boolean]'
    TBoolean
  else
    switch type
      when '[object String]'
        TString
      when '[object Number]'
        TNumber
      when '[object Function]'
        TFunction
      when '[object Object]'
        TObject
      when '[object Array]'
        TArray
      when '[object Arguments]'
        TArguments
      when '[object Date]'
        TDate
      when '[object RegExp]'
        TRegExp
      when '[object Error]'
        TError
      else
        type

#
# Dispatching / Pattern Matching
#

dispatch = do ->
  matchPattern_ = (pattern) ->
    type = typeOf pattern
    switch type
      when TUndefined
        (a) -> a is undefined
      when TNull
        (a) -> a is null
      when TBoolean
        (a) -> pattern is Boolean or a is pattern
      when TString
        (a) -> pattern is String or a is pattern
      when TNumber
        (a) -> 
          pattern is Number or 
            a is pattern or 
            ((isNaN a) and (isNaN pattern))
      when TRegExp
        (a) -> pattern is RegExp
      when Error
        (a) -> pattern is Error
      when TDate
        (a) -> pattern is Date or a is pattern
      when TArray
        (a) -> pattern is Array or arrayElementsAreEqual pattern, a
      when TFunction
        (a) ->
          return yes if a instanceof pattern
          return yes if a and a.constructor is pattern

          # instanceof doesn't work for bools/strings/numbers, so
          #  check explicitly
          t = typeOf a
          pattern is Boolean and t is TBoolean or
            pattern is String and t is TString or
            pattern is Number and t is TNumber

      when TObject
        (a) ->
          return no for k, v of pattern when a[k] isnt v
          yes
      else
        (a) -> no

  matchPatterns_ = (patterns) ->
    matchers = map patterns, matchPattern_ 

    (args) ->
      return no if args.length is 0
      return no if args.length isnt matchers.length
      return no for check, i in matchers when not check args[i]
      yes


  (exprs...) ->
    matchers = map exprs, ( [patterns..., func] ) ->
      new Matcher (matchPatterns_ patterns), func

    (args...) ->
      for matcher in matchers when matcher.match args
        return apply matcher.func, null, args
        
      throw new Error "Pattern match failure for args [ #{join (map args, (arg) -> '' + arg + ':' + typeOf arg), ', '} ]" #TODO improve message

#
# Data
#

#
# Insane hack to compress large 2D data tables.
# The basis for doing this is described here:
# http://www.html5rocks.com/en/tutorials/speed/v8/
# See Tip #1 "Hidden Classes"
#
# Applies to IE as well:
# http://msdn.microsoft.com/en-us/library/windows/apps/hh781219.aspx#optimize_property_access
#
# http://jsperf.com/big-data-matrix/3
# As of 31 Oct 2014, for a 10000 row, 100 column table in Chrome,
#   retained memory sizes:
# raw json: 31,165 KB
# array of objects: 41,840 KB
# array of arrays: 14,960 KB
# array of prototyped instances: 14,840 KB
#
# Usage:
# Record = plot.compile [ 'bar', 'baz', 'qux', ... ]
# record = new Record args...
#

_prototypeId = 0
nextPrototypeName = -> "Map#{++_prototypeId}"
_prototypeCache = {}
createCompiledPrototype = (attrs) ->
  # Since the prototype depends only on attribute names,
  #  return a cached prototype, if any.
  cacheKey = join attrs, '\0'
  return proto if proto = _prototypeCache[cacheKey]

  params = ( "a#{i}" for i in [0 ... attrs.length] )
  inits = ( "this[#{JSON.stringify attr}]=a#{i};" for attr, i in attrs )

  prototypeName = nextPrototypeName()
  _prototypeCache[cacheKey] = (new Function "function #{prototypeName}(#{params.join ','}){#{inits.join ''}} return #{prototypeName};")()

plot_compile = (variables) ->
  createCompiledPrototype (variable.label for variable in variables)

class Variable
  constructor: (@label, @type, @domain, @format, @read) ->

class Table
  constructor: (@label, @variables, @records) ->
    @schema = indexBy variables, (variable) -> variable.label

class Value
  constructor: (@value) ->

class Color
  constructor: (@color) ->

class Mark

class PointMark
  constructor: (@position, @shape, @size, @fillColor, @fillOpacity, @strokeColor, @strokeOpacity, @lineWidth) ->

class TextMark
  constructor: (@position, @text, @size, @fillColor, @fillOpacity) ->

class Channel

class ColorChannel extends Channel

class PositionChannel extends Channel
  constructor: (@fieldX, @fieldY) ->

class FillColor extends ColorChannel
  constructor: (@color) ->

class FillColorChannel extends ColorChannel
  constructor: (@field, @range) ->

class Range

class CategoricalRange extends Range
  constructor: (@values) ->

class QuantitativeRange extends Range

class SequentialRange extends QuantitativeRange
  constructor: (@min, @max) ->

class DivergingRange extends QuantitativeRange
  constructor: (@min, @mid, @max) ->

class ColorRange extends Range

class SequentialColorRange extends ColorRange
  constructor: (@min, @max) ->

class DivergingColorRange extends ColorRange
  constructor: (@min, @mid, @max) ->

class Matcher
  constructor: (@match, @func) ->

class Datasource
  constructor: (@read) ->

plot_data = dispatch(
  [ Table, identity ]
  [ Function, (read) -> new Datasource read ]
)
plot_rectangular = (scaleX, scaleY) ->

plot_polar = (scaleR, scaleA) ->

plot_parallel = (scales...) ->

plot_point = (channels...) ->

plot_value = (value) -> new Value value

plot_color = (color) -> new Color color

plot_domain = (values...) ->

plot_range = dispatch(
  [ Array, (a) -> new CategoricalRange a]
  [ 
    Number, (a) -> 
      if a > 0
        new SequentialRange 0, a
      else if a < 0
        new SequentialRange a, 0
      else
        new DivergingRange -1, 0, 1
  ]
  [ String, (a) -> new SequentialColorRange a, 'black' ]
  [ 
    Number, Number, (a, b) -> 
      if a <= b
        new SequentialRange a, b
      else
        new SequentialRange b, a
  ]
  [ String, String, (a, b) -> new SequentialColorRange a, b ]
  [ 
    Number, Number, Number, (a, b, c) -> 
      [ p, q, r ] = sortBy [ a, b, c ], identity
      new DivergingRange p, q, r
  ]
  [ String, String, String, (a, b, c) -> new DivergingColorRange a, b, c ]
)

plot_position = dispatch(
  [ String, String, (fieldX, fieldY) -> new PositionChannel fieldX, fieldY ]
)

plot_fillColor = dispatch(
  [ Color, (color) -> new FillColor color ]
  [ String, (field) -> new FillColorChannel field ]
  [ String, ColorRange, (field, range) -> new FillColorChannel field, range ]
)

plot_strokeColor = (field, args...) ->

plot_parse = (esprima, escodegen) ->
  walkAst = (node, f) ->
    f node
    for own key, child of node
      if isObject child
        if isArray child
          for childNode in child
            walkAst childNode, f
        else
          walkAst child, f
    return

  (js) ->
    ast = esprima.parse js
    walkAst ast, (node) ->
      if node.type is 'CallExpression' and node.callee.type is 'Identifier'
        if isFunction plot[name = node.callee.name]
          node.callee =
            type: 'MemberExpression'
            computed: no
            object:
              type: 'Identifier'
              name: 'plot'
            property:
              type: 'Identifier'
              name: name
      return
    escodegen.generate ast

render = dispatch(
  [ 
    Datasource, Array, (ds, args) -> 
      ds.read (error, table) -> 
        if error
          throw error
        else
          render table, args
  ] 
  [ 
    Table, Array, (table, args) ->
      console.log table
  ]
)

plot = (args...) ->
  if datasource = (find args, (arg) -> arg instanceof Datasource or arg instanceof Table)
    render datasource, without args, datasource 
  else
    (more...) -> apply plot, null, concat args, more


plot.data = plot_data
plot.rectangular = plot_rectangular
plot.polar = plot_polar
plot.parallel = plot_parallel
plot.point = plot_point
plot.value = plot_value
plot.color = plot_color
plot.domain = plot_domain
plot.range = plot_range
plot.position = plot_position
plot.fillColor = plot_fillColor
plot.strokeColor = plot_strokeColor
plot.parse = plot_parse
plot.compile = plot_compile
plot.Table = Table
plot.Variable = Variable


if module?.exports? then module.exports = plot else window.plot = plot
