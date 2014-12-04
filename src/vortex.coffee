#
# Vortex
#

operation = (f, args...) -> -> apply f, null, args

arrayElementsAreEqual = (xs, ys) ->
  if xs and ys and xs.length is ys.length
    return no for x, i in xs when x isnt ys[i]
    yes
  else
    no

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

      throw new Error 'Pattern match failure' #TODO improve message

# TODO fix mmin, mmax, vvalues in shorthand

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

plot = (args...) ->
  (table, domElement, refill) ->

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

if module?.exports? then module.exports = plot else window.plot = plot
