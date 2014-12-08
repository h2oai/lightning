#
# Vortex
#

# TODO fix mmin, mmax, vvalues in shorthand


Pi = Math.PI
TwoPi = 2 * Pi
HalfPi = Pi / 2
Epsilon = 1e-6
EpsilonSquare = Epsilon * Epsilon
Radians = Pi / 180
Degrees = 180 / Pi
Tan30 = tan 30 * Radians
Sqrt3 = sqrt 3

operation = (f, args...) -> -> apply f, null, args

always = (value) -> -> value

arrayElementsAreEqual = (xs, ys) ->
  if xs and ys and xs.length is ys.length
    return no for x, i in xs when x isnt ys[i]
    yes
  else
    no

filterByType = (args, types...) ->
  filtered = []
  for arg in args
    filtered.push arg for type in types when arg instanceof type
  filtered

findByType = (args, types...) ->
  for arg in args
    return arg for type in types when arg instanceof type
  return


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
nextPrototypeName = -> "Rec#{++_prototypeId}"
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

class Layout

class RectangularLayout extends Layout
  constructor: (@axisX, @axisY) ->

class Axis

class LinearAxis extends Axis
  constructor: (@label, @domain, @range, @scale, @computeTicks) ->

createLinearAxis = (label, domain, range) ->
  scale = d3.scale.linear()
    .domain [ domain.min, domain.max ]
    .range [ range.min, range.max ]
    .nice()

  computeTicks = (count) ->
    format = scale.tickFormat count
    scale.ticks count

  new LinearAxis label, domain, range, scale, computeTicks

class Variable
  constructor: (@label, @type, @domain, @format, @read) ->

class Table
  constructor: (@label, @variables, @records) ->
    @schema = indexBy variables, (variable) -> variable.label

class Value
  constructor: (@value) ->

class Color
  constructor: (@color) ->

class Geometry

class PointGeometry extends Geometry
  constructor: (@positionX, @positionY, @shape, @size, @fillColor, @fillOpacity, @strokeColor, @strokeOpacity, @lineWidth) ->

class TextGeometry extends Geometry
  constructor: (@position, @text, @size, @fillColor, @fillOpacity) ->

class Encoding

class PointEncoding extends Encoding
  constructor: (@positionX, @positionY, @shape, @size, @fillColor, @fillOpacity, @strokeColor, @strokeOpacity, @lineWidth) ->

drawCircle = (g, x, y, area) ->
  r = sqrt area/Pi
  g.beginPath()
  g.arc x, y, r, 0, TwoPi, no
  g.closePath()

drawSquare = (g, x, y, area) -> #TODO replace with a single rect() call
  r = 0.5 * sqrt area
  g.save()
  g.translate x, y
  g.beginPath()
  g.moveTo r, r
  g.lineTo -r, r
  g.lineTo -r, -r
  g.lineTo r, -r
  g.closePath()
  g.restore()

drawCross = (g, x, y, area) ->
  r = 0.5 * sqrt area / 5
  r3 = r * 3
  g.save()
  g.translate x, y
  g.beginPath()
  g.moveTo r3, r
  g.lineTo r, r
  g.lineTo r, r3
  g.lineTo -r, r3
  g.lineTo -r, r
  g.lineTo -r3, r
  g.lineTo -r3, -r
  g.lineTo -r, -r
  g.lineTo -r, -r3
  g.lineTo r, -r3
  g.lineTo r, -r
  g.lineTo r3, -r
  g.closePath()
  g.restore()

drawDiamond = (g, x, y, area) ->
  ry = sqrt area / (2 * Tan30)
  rx = ry * Tan30
  g.save()
  g.translate x, y
  g.beginPath()
  g.moveTo rx, 0
  g.lineTo 0, ry
  g.lineTo -rx, 0
  g.lineTo 0, -ry
  g.closePath()
  g.restore()


drawTriangleUp = (g, x, y, area) ->
  rx = Math.sqrt area / Sqrt3
  ry = rx * Sqrt3 / 2
  g.save()
  g.translate x, y
  g.beginPath()
  g.moveTo 0, -ry
  g.lineTo rx, ry
  g.lineTo -rx, ry
  g.closePath()
  g.restore()

drawTriangleDown = (g, x, y, area) ->
  rx = Math.sqrt area / Sqrt3
  ry = rx * Sqrt3 / 2
  g.save()
  g.translate x, y
  g.beginPath()
  g.moveTo 0, ry
  g.lineTo rx, -ry
  g.lineTo -rx, -ry
  g.closePath()
  g.restore()

drawTriangleRight = (g, x, y, area) ->
  ry = Math.sqrt area / Sqrt3
  rx = ry * Sqrt3 / 2
  g.save()
  g.translate x, y
  g.beginPath()
  g.moveTo rx, 0
  g.lineTo -rx, ry
  g.lineTo -rx, -ry
  g.closePath()
  g.restore()

drawTriangleLeft = (g, x, y, area) ->
  ry = Math.sqrt area / Sqrt3
  rx = ry * Sqrt3 / 2
  g.save()
  g.translate x, y
  g.beginPath()
  g.moveTo -rx, 0 
  g.lineTo rx, -ry
  g.lineTo rx, ry
  g.closePath()
  g.restore()

Shapes =
  circle: drawCircle
  square: drawSquare
  cross: drawCross
  diamond: drawDiamond
  triangleUp: drawTriangleUp
  triangleDown: drawTriangleDown
  triangleLeft: drawTriangleLeft
  triangleRight: drawTriangleRight

encodePoint = (table, geom, layout) ->

  fieldX = geom.positionX.field
  fieldY = geom.positionY.field

  positionX = (rec) -> layout.axisX.scale rec[fieldX]
  positionY = (rec) -> layout.axisY.scale rec[fieldY]

  if geom.shape
    if geom.shape instanceof VariableShapeChannel
      throw new Error 'ni'
    else
      shape = always Shapes[geom.shape.shape] or Shapes.circle
  else
    shape = always Shapes.circle

  size = null
  fillColor = null
  fillOpacity = null
  strokeColor = null
  strokeOpacity = null
  lineWidth = null

  new PointEncoding positionX, positionY, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth

renderPoint = (table, geom, canvas) ->
  g = canvas.context

  { positionX, positionY, shape } = geom

  for rec in table.records
    x = positionX rec
    y = positionY rec

    if x isnt null and y isnt null
      (shape rec) g, x, y, Pi * 5 * 5
      #(shape rec) g, x, y, (size rec)
      g.fillStyle = 'green'
      g.fill()

  return


class Channel

class ColorChannel extends Channel

class PointChannel extends Channel
  constructor: (@fieldX, @fieldY) ->

class PositionChannel extends Channel
  constructor: (@field) ->

class FillColorChannel extends Channel
class FillOpacityChannel extends Channel
class StrokeColorChannel extends Channel
class StrokeOpacityChannel extends Channel
class SizeChannel extends Channel
class LineWidthChannel extends Channel
class ShapeChannel extends Channel

class FixedFillColorChannel extends FillColorChannel
  constructor: (@color) ->

class VariableFillColorChannel extends FillColorChannel
  constructor: (@field, @range) ->

class FixedFillOpacityChannel extends FillOpacityChannel
  constructor: (@opacity) ->

class VariableFillOpacityChannel extends FillOpacityChannel
  constructor: (@field, @range) ->

class FixedStrokeColorChannel extends StrokeColorChannel
  constructor: (@color) ->

class VariableStrokeColorChannel extends StrokeColorChannel
  constructor: (@field, @range) ->

class FixedStrokeOpacityChannel extends StrokeOpacityChannel
  constructor: (@opacity) ->

class VariableStrokeOpacityChannel extends StrokeOpacityChannel
  constructor: (@field, @range) ->

class FixedSizeChannel extends SizeChannel
  constructor: (@size) ->

class VariableSizeChannel extends SizeChannel
  constructor: (@field, @range) ->

class FixedLineWidthChannel extends LineWidthChannel
  constructor: (@color) ->

class VariableLineWidthChannel extends LineWidthChannel
  constructor: (@lineWidth, @range) ->

class FixedShapeChannel extends ShapeChannel
  constructor: (@shape) ->

class VariableShapeChannel extends ShapeChannel
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

plot_point = (ops...) ->
  point = getOp ops, PointChannel
  positionX = new PositionChannel point.fieldX
  positionY = new PositionChannel point.fieldY
  shape = getOp ops, ShapeChannel
  size = getOp ops, SizeChannel
  fillColor = getOp ops, FillColorChannel
  fillOpacity = getOp ops, FillOpacityChannel
  strokeColor = getOp ops, StrokeColorChannel
  strokeOpacity = getOp ops, StrokeOpacityChannel
  lineWidth = getOp ops, LineWidthChannel

  new PointGeometry positionX, positionY, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth

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
  [ String, String, (fieldX, fieldY) -> new PointChannel fieldX, fieldY ]
)

plot_fillColor = dispatch(
  [ Color, (color) -> new FixedFillColorChannel color ]
  [ String, (field) -> new VariableFillColorChannel field ]
  [ String, ColorRange, (field, range) -> new VariableFillColorChannel field, range ]
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


class Canvas
  constructor: (@element, @context, @bounds, @ratio) ->

createCanvas = (bounds) ->
  { width, height } = bounds

  element = document.createElement 'canvas'
  context = element.getContext '2d' 

  dpr = window.devicePixelRatio or 1
  bspr = context.webkitBackingStorePixelRatio or context.mozBackingStorePixelRatio or context.msBackingStorePixelRatio or context.oBackingStorePixelRatio or context.backingStorePixelRatio or 1 

  ratio = dpr / bspr

  if dpr isnt bspr
    element.width = width * ratio
    element.height = height * ratio
    context.scale ratio, ratio
    element.style.width = "#{width}px"
    element.style.height = "#{height}px"
  else
    element.width = width
    element.height = height

  new Canvas element, context, bounds, ratio

class Bounds
  constructor: (@width, @height) ->

plot_defaults =
  bounds: new Bounds 400, 400

getOp = (ops, type, def) ->
  if op = findByType ops, type
    op
  else
    def

arePositionVariablesCompatible = (variables) ->
  top = head variables

  for variable in rest variables
    if (top.type isnt variable.type) or (top.type is TString and top.label isnt variable.label)
      throw new Error "Variable '#{variable.label}' of type '#{variable.type}' cannot be plotted on the same axis as variable '#{top.label}' of type '#{top.type}'" 

  return yes

render = (table, ops) ->
  bounds = getOp ops, Bounds, plot_defaults.bounds
  geoms = filterByType ops, Geometry

  #positions = map geoms, (geom) -> geom.position
  #variablesX = map positions, (position) -> table.schema[position.fieldX]
  #variablesY = map positions, (position) -> table.schema[position.fieldY]

  #TODO handle layers

  geom = head geoms
  variableX = table.schema[geom.positionX.field]
  variableY = table.schema[geom.positionY.field]

  axisX = if variableX.type is TNumber
    createLinearAxis variableX.label, new SequentialRange(variableX.domain[0], variableX.domain[1]), new SequentialRange 0, bounds.width  
  else
    null #XXX

  axisY = if variableY.type is TNumber
    createLinearAxis variableY.label, new SequentialRange(variableY.domain[0], variableY.domain[1]), new SequentialRange bounds.height, 0
  else
    null #XXX

  console.log axisX.computeTicks 10
  console.log axisY.computeTicks 10

  layout = new RectangularLayout axisX, axisY

  canvas = createCanvas bounds

  encoding = encodePoint table, geom, layout
  renderPoint table, encoding, canvas
  
  canvas.element

_plot = dispatch(
  [ 
    Datasource, Array, Function, (ds, ops, go) -> 
      ds.read (error, table) -> 
        if error
          go error
        else
          _plot table, ops, go
  ] 
  [
    Table, Array, Function, (table, ops, go) ->
      try
        go null, render table, ops
      catch error
        go error
  ]
)

plot = (ops...) ->
  if datasource = findByType ops, Datasource, Table
    (go) -> _plot datasource, (without ops, datasource), go
  else
    (more...) -> apply plot, null, concat ops, more


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
