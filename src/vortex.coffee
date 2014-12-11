#
# Vortex
#

# TODO fix mmin, mmax, vvalues in shorthand
# Tooltips
# Variable encoding:
#   fill color
#   fill opacity
#   stroke color
#   stroke opacity
#   linewidth
#   size
#   shape
# Stack
# Jitter
# Events (selection, hover)


π = Math.PI
τ = 2 * π
Halfπ = π / 2
ε = 1e-6
EpsilonSquare = ε * ε
Radians = π / 180
Degrees = 180 / π
Tan30 = tan 30 * Radians
Sqrt3 = sqrt 3
ColorLimit = 255 * 255 * 255

defaultSize = 8

#
# Chroma wrappers
#
createColor = chroma

cloneColor = (color) ->
  [ r, g, b ] = color.rgb()
  createColor.rgb r, g, b

colorToStyle = (color) -> color.css()

colorToStyleA = (color, alpha) ->
  cloneColor color
    .alpha alpha
    .css()


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

class Matcher
  constructor: (@match, @func) ->

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


byteToHex = (b) ->
  hex = b.toString 16
  if hex.length is 1 then "0#{hex}" else hex

createExtent = (a, b) ->
  if a < b
    new SequentialRange a, b
  else
    new SequentialRange b, a

class Clip
  constructor: (@put, @test) ->

createClip = (canvas) ->
  { context, ratio } = canvas
  put = (index) -> "#fff"
  test = (x, y) ->
    [ r, g, b, a ] = context.getImageData x * ratio, y * ratio, 1, 1
      .data
    r is 255 and g is 255 and b is 255 and a is 255

  new Clip put, test

class Mask
  constructor: (@put, @test) ->

createMask = (canvas) ->
  { context, ratio } = canvas
  _color = 0
  dict = {}

  put = (index) ->
    color = _color++
    _color = 0 if _color >= ColorLimit
    dict[color] = index
    r = (color >> 16) & 255
    g = (color >> 8) & 255
    b = color & 255
    "##{byteToHex r}#{byteToHex g}#{byteToHex b}"

  test = (x, y) ->
    [ r, g, b, a ] = context.getImageData x * ratio, y * ratio, 1, 1
      .data
    if a is 255
      color = (r << 16) + (g << 8) + b
      dict[color]
    else
      undefined

  new Mask put, test

class Size
  constructor: (@width, @height) ->

class Rect
  constructor: (@left, @top, @width, @height) ->

class Encoder
  constructor: (@label, @encode) ->

class ConstantEncoder extends Encoder
  constructor: (@value) ->
    super 'Constant', always value

class VariableEncoder extends Encoder
  constructor: (label, encode) ->
    super label, encode

class LinearAxis extends VariableEncoder
  constructor: (label, encode, @domain, @range, @guide) ->
    super label, encode

createNicedLinearScale = (domain, range) ->
  scale = d3.scale.linear()
    .domain [ domain.min, domain.max ]
    .range [ range.min, range.max ]
    .nice()

createLinearAxis = (label, domain, range) ->
  scale = d3.scale.linear()
    .domain [ domain.min, domain.max ]
    .range [ range.min, range.max ]
    .nice()

  guide = (count) ->
    format = scale.tickFormat count
    scale.ticks count

  new LinearAxis label, scale, domain, range, guide

createLinearColorScale = (label, domain, range) ->

createCategoricalColorScale = (label, domain, range) ->

createCategoricalScale = (domain, range) ->
  _rangeValues = range.values
  _rangeCount = _rangeValues.length
  (category) -> _rangeValues[ category.index % _rangeCount ]

createSequentialLinearScale = (label, domain, range) ->
  d3.scale.linear()
    .domain [ domain.min, domain.max ]
    .range [ range.min, range.max ]

createDivergingLinearScale = (label, domain, range) ->
  d3.scale.linear()
    .domain [ domain.min, domain.mid, domain.max ]
    .range [ range.min, range.mid, range.max ]

createLinearScale = dispatch(
  [ String, SequentialRange, SequentialRange, createSequentialLinearScale ]
  [ String, DivergingRange, DivergingRange, createDivergingLinearScale ]
)

class Variable
  constructor: (@name, @label, @type, @data, @domain, @format, @read) ->

class Factor extends Variable
  constructor: (name, label, type, data, domain, format, read) ->
    super name, label, type, data, domain, format, read

class Table
  constructor: (@label, @variables, @rowCount, @schema, @indices, @get, @put) ->

createTable = (label, variables, rowCount) ->
  schema = indexBy variables, (variable) -> variable.name
  indices = sequence rowCount

  table = new Table label, variables, rowCount, schema, indices, null, null

  table.get = (field) ->
    if field instanceof ComputedField
      table.get field.evaluate table
    else
      schema[field.name]

  table.put = (variable) ->
    variables.push variable
    schema[ variable.name ] = variable
    variable

  table

class Value
  constructor: (@value) ->

class NumberValue extends Value
  constructor: (value) -> super value

class StringValue extends Value
  constructor: (value) -> super value

class DateValue extends Value
  constructor: (value) -> super value

class BooleanValue extends Value
  constructor: (value) -> super value

class Field
  constructor: (@name) ->

class ComputedField extends Field
  constructor: (@evaluate) ->

resolveChannels = (geom) ->
  debug geom
  geom

class Geometry

class PointGeometry extends Geometry
  constructor: (@positionX, @positionY, @shape, @size, @fillColor, @fillOpacity, @strokeColor, @strokeOpacity, @lineWidth) ->

class TextGeometry extends Geometry
  constructor: (@position, @text, @size, @fillColor, @fillOpacity) ->

class PointEncoding
  constructor: (@positionX, @positionY, @shape, @size, @fill, @stroke, @lineWidth) ->

drawCircle = (g, x, y, area) ->
  r = sqrt area/π
  g.beginPath()
  g.arc x, y, r, 0, τ, no
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

ShapePalettes =
  c8: [  
    'circle', 'square', 'cross', 'diamond'
    'triangleUp', 'triangleDown', 'triangleLeft', 'triangleRight'
  ] 

pickCategoricalColorPalette = (cardinality) ->
  if cardinality > 10
    ColorPalettes.c20
  else
    ColorPalettes.c10

pickCategoricalShapePalette = (cardinality) -> ShapePalettes.c8

class VariableShapeEncoder extends VariableEncoder
  constructor: (label, encode, @domain, @range, @guide) ->
    super label, encode

encodeShape = (table, channel) ->
  if channel instanceof VariableShapeChannel
    variable = table.get channel.field
    unless variable instanceof Factor
      throw new Error "Could not encode shape. Variable '#{variable.label}' is not a Factor." 
    unless channel.range
      channel.range = new CategoricalRange pickCategoricalShapePalette variable.domain.length 
    scale = createCategoricalScale variable.domain, channel.range
    read = variable.read
    encode = (i) -> Shapes[ scale read i ]
    new VariableShapeEncoder variable.label, encode, variable.domain, channel.range, null #XXX
  else
    new ConstantEncoder Shapes[channel.value] or Shapes.circle

encodeSize = (table, sizeChannel) ->
  if sizeChannel instanceof VariableSizeChannel
    throw new Error 'ni'
  else
    new ConstantEncoder sizeChannel.value

encodeLineWidth = (table, lineWidthChannel) ->
  if lineWidthChannel instanceof VariableLineWidthChannel
    throw new Error 'ni'
  else
    new ConstantEncoder lineWidthChannel.value

encodeColor = (table, colorChannel, opacityChannel) ->
  isVariableColor = colorChannel instanceof VariableFillColorChannel or colorChannel instanceof VariableStrokeColorChannel
  isVariableOpacity = opacityChannel instanceof VariableFillOpacityChannel or opacityChannel instanceof VariableStrokeOpacityChannel

  if isVariableColor
    colorField = colorChannel.field
    scaleColor = null #XXX
    if isVariableOpacity
      opacityField = opacityChannel.field
      scaleOpacity = null #XXX
      (d) ->
        color = scaleColor d[colorField]
        opacity = scaleOpacity d[opacityField]
        colorToStyleA color, opacity
    else
      opacity = opacityChannel.value
      if 0 <= opacity < 1
        (d) ->
          color = scaleColor d[colorField]
          colorToStyleA color, opacity
      else
        (d) ->
          colorToStyle scaleColor d[colorField]
  else
    color = colorChannel.value
    if isVariableOpacity
      opacityField = opacityChannel.field
      scaleOpacity = null #XXX
      (d) -> colorToStyleA color, scaleOpacity d[opacityField]
    else
      opacity = opacityChannel.value
      if 0 <= opacity < 1
        new ConstantEncoder colorToStyleA color, opacity
      else
        new ConstantEncoder colorToStyle color

ColorPalettes =
  c10: [
    '#1f77b4', '#ff7f0e', '#2ca02c', '#d62728', '#9467bd'
    '#8c564b', '#e377c2', '#7f7f7f', '#bcbd22', '#17becf'
  ]
  c20: [
    '#1f77b4', '#aec7e8', '#ff7f0e', '#ffbb78', '#2ca02c'
    '#98df8a', '#d62728', '#ff9896', '#9467bd', '#c5b0d5'
    '#8c564b', '#c49c94', '#e377c2', '#f7b6d2', '#7f7f7f'
    '#c7c7c7', '#bcbd22', '#dbdb8d', '#17becf', '#9edae5'
  ]
  c20b: [
    '#393b79', '#5254a3', '#6b6ecf', '#9c9ede', '#637939'
    '#8ca252', '#b5cf6b', '#cedb9c', '#8c6d31', '#bd9e39'
    '#e7ba52', '#e7cb94', '#843c39', '#ad494a', '#d6616b'
    '#e7969c', '#7b4173', '#a55194', '#ce6dbd', '#de9ed6'
  ]
  c20c: [
    '#3182bd', '#6baed6', '#9ecae1', '#c6dbef', '#e6550d'
    '#fd8d3c', '#fdae6b', '#fdd0a2', '#31a354', '#74c476'
    '#a1d99b', '#c7e9c0', '#756bb1', '#9e9ac8', '#bcbddc'
    '#dadaeb', '#636363', '#969696', '#bdbdbd', '#d9d9d9'
  ]

defaultPoint = (geom) ->

  geom.shape = new FixedShapeChannel 'circle' unless geom.shape
  geom.size = new FixedSizeChannel defaultSize * defaultSize unless geom.size

  hasFill = geom.fillColor or geom.fillOpacity
  hasStroke = geom.strokeColor or geom.strokeOpacity or geom.lineWidth
  hasStroke = yes unless hasFill or hasStroke

  if hasFill
    geom.fillColor = new FixedFillColorChannel createColor head ColorPalettes.c10 unless geom.fillColor
    geom.fillOpacity = new FixedFillOpacityChannel 1 unless geom.fillOpacity

  if hasStroke
    geom.strokeColor = new FixedStrokeColorChannel createColor head ColorPalettes.c10 unless geom.strokeColor
    geom.strokeOpacity = new FixedStrokeOpacityChannel 1 unless geom.strokeOpacity
    geom.lineWidth = new FixedLineWidthChannel 1.5 unless geom.lineWidth

  geom

encodePosition = (table, channel, range) ->
  field = channel.field
  variable = table.get field
  { domain } = variable

  switch variable.type
    when TNumber
      scale = createNicedLinearScale domain, range
      read = variable.read
      encode = (i) -> scale read i
      guide = (count) ->
        format = scale.tickFormat count
        scale.ticks count

      new LinearAxis variable.label, encode, domain, range, guide
    else
      throw new Error 'ni'

encodePoint = (table, geom, bounds) ->

  positionX = encodePosition table, geom.positionX, new SequentialRange 0, bounds.width
  positionY = encodePosition table, geom.positionY, new SequentialRange bounds.height, 0

  shape = encodeShape table, geom.shape
  size = encodeSize table, geom.size

  if geom.fillColor or geom.fillOpacity
    fill = encodeColor table, geom.fillColor, geom.fillOpacity

  if geom.strokeColor or geom.strokeOpacity or geom.lineWidth
    stroke = encodeColor table, geom.strokeColor, geom.strokeOpacity
    lineWidth = encodeLineWidth table, geom.lineWidth

  new PointEncoding positionX, positionY, shape, size, fill, stroke, lineWidth


highlightPoint = (indices, encoding, g) ->
  { positionX, positionY, shape, size, fill, stroke, lineWidth } = encoding

  g.save()
  for i in indices
    x = positionX i
    y = positionY i
    if x isnt null and y isnt null
      (shape i) g, x, y, size i

      g.lineWidth = 2 + if stroke then lineWidth i else 1
      g.stroke()
  g.restore()

  g.save()
  g.globalCompositeOperation = 'destination-out'
  g.fillStyle = g.strokeStyle = 'black'
  for i in indices
    x = positionX i
    y = positionY i
    if x isnt null and y isnt null
      (shape i) g, x, y, size i
      if stroke
        g.lineWidth = lineWidth i
        g.stroke()
      if fill
        g.fill()
  g.restore()


maskPoint = (indices, encoding, g, mask) ->
  { positionX, positionY, shape, size, fill, stroke, lineWidth } = encoding

  g.save()
  for i in indices
    x = positionX i
    y = positionY i

    if x isnt null and y isnt null
      maskStyle = mask.put i
      (shape i) g, x, y, size i
      g.fillStyle = maskStyle
      g.fill()
      if stroke
        g.lineWidth = lineWidth i
        g.strokeStyle = maskStyle
        g.stroke()
  g.restore()

renderPoint = (indices, encoding, g) ->
  { positionX, positionY, shape, size, fill, stroke, lineWidth } = encoding

  g.save()
  for i in indices
    x = positionX i
    y = positionY i

    if x isnt null and y isnt null
      (shape i) g, x, y, size i

      if stroke
        g.lineWidth = lineWidth i
        g.strokeStyle = stroke i
        g.stroke()

      if fill
        g.fillStyle = fill i
        g.fill()

  g.restore()

# XXX Naive, need some kind of memoization during rendering.
selectPoint = (indices, encoding, xmin, ymin, xmax, ymax) ->
  { positionX, positionY } = encoding

  selectedIndices = []

  for i in indices
    x = positionX i
    y = positionY i
    if x isnt null and y isnt null and xmin <= x <= xmax and ymin <= y <= ymax
      selectedIndices.push i

  selectedIndices

# XXX disable RMB
# TODO implement additive selections
# TODO remove jquery dependency
captureMouseEvents = (canvasEl, marqueeEl, hover, selectWithin, selectAt) ->

  $document = $ document
  $canvas = $ canvasEl
  marquee = marqueeEl.style

  x = y = x1 = y1 = x2 = y2 = 0
  isDragging = no

  $canvas.on 'mousemove', (e) -> 
    { offsetX:x, offsetY:y }  = e
    if isDragging
      marquee.left = px if x > x1 then x1 else x
      marquee.top = px if y > y1 then y1 else y
      marquee.width = px abs x - x1
      marquee.height = px abs y - y1
    else
      hover x, y

  $canvas.on 'mousedown', (e) ->
    e.preventDefault()
    { offsetX:x1, offsetY:y1 }  = e
    isDragging = yes
    marquee.display = 'block'
    marquee.left = px x1
    marquee.top = px y1
    $document.on 'mouseup', (e) ->
      e.preventDefault()
      { offsetX:x2, offsetY:y2 }  = e
      isDragging = no
      marquee.display = 'none'
      marquee.width = px 0
      marquee.height = px 0
      $document.off 'mouseup'
      if (abs x1 - x2) > 5 or (abs y1 - y2) > 5
        selectWithin x1, y1, x2, y2
      else
        selectAt x1, y1

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
  constructor: (@value) ->

class VariableFillColorChannel extends FillColorChannel
  constructor: (@field, @range) ->

class FixedFillOpacityChannel extends FillOpacityChannel
  constructor: (@value) ->

class VariableFillOpacityChannel extends FillOpacityChannel
  constructor: (@field, @range) ->

class FixedStrokeColorChannel extends StrokeColorChannel
  constructor: (@value) ->

class VariableStrokeColorChannel extends StrokeColorChannel
  constructor: (@field, @range) ->

class FixedStrokeOpacityChannel extends StrokeOpacityChannel
  constructor: (@value) ->

class VariableStrokeOpacityChannel extends StrokeOpacityChannel
  constructor: (@field, @range) ->

class FixedSizeChannel extends SizeChannel
  constructor: (@value) ->

class VariableSizeChannel extends SizeChannel
  constructor: (@field, @range) ->

class FixedLineWidthChannel extends LineWidthChannel
  constructor: (@value) ->

class VariableLineWidthChannel extends LineWidthChannel
  constructor: (@lineWidth, @range) ->

class FixedShapeChannel extends ShapeChannel
  constructor: (@value) ->

class VariableShapeChannel extends ShapeChannel
  constructor: (@field, @range) ->

class Extent
  constructor: (@min, @max) ->

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

plot_value = dispatch(
  [ Number, (value) -> new NumberValue value ]
  [ Boolean, (value) -> new BooleanValue value ]
  [ Date, (value) -> new DateValue value ]
  [ String, (value) -> new StringValue value ]
)

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
  [ String, String, (fieldX, fieldY) -> new PointChannel (new Field fieldX), (new Field fieldY) ]
)

plot_shape = dispatch(
  [ StringValue, (value) -> new FixedShapeChannel value.value ]
  [ String, (field) -> new VariableShapeChannel field ]
  [ Field, (field) -> new VariableShapeChannel field ]
  [ String, CategoricalRange, (field, range) -> new VariableShapeChannel field, range ]
)

plot_fillColor = dispatch(
  [ StringValue, (value) -> new FixedFillColorChannel createColor value.value ]
  [ String, (field) -> new VariableFillColorChannel field ]
  [ String, ColorRange, (field, range) -> new VariableFillColorChannel field, range ]
)

plot_fillOpacity = dispatch(
  [ NumberValue, (value) -> new FixedFillOpacityChannel value.value ]
  [ String, (field) -> new VariableFillOpacityChannel field ]
  [ String, SequentialRange, (field, range) -> new VariableFillOpacityChannel field, range ]
)

plot_strokeColor = dispatch(
  [ StringValue, (value) -> new FixedStrokeColorChannel createColor value.value ]
  [ String, (field) -> new VariableStrokeColorChannel field ]
  [ String, ColorRange, (field, range) -> new VariableStrokeColorChannel field, range ]
)

plot_strokeOpacity = dispatch(
  [ NumberValue, (value) -> new FixedStrokeOpacityChannel value.value ]
  [ String, (field) -> new VariableStrokeOpacityChannel field ]
  [ String, SequentialRange, (field, range) -> new VariableStrokeOpacityChannel field, range ]
)

plot_size = dispatch(
  [ NumberValue, (value) -> new FixedSizeChannel defaultSize * value.value * defaultSize * value.value ]
  [ String, (field) -> new VariableSizeChannel field ]
  [ String, SequentialRange, (field, range) -> new VariableSizeChannel field, range ]
)
plot_lineWidth = dispatch(
  [ NumberValue, (value) -> new FixedLineWidthChannel value.value ]
  [ String, (field) -> new VariableLineWidthChannel field ]
  [ String, SequentialRange, (field, range) -> new VariableLineWidthChannel field, range ]
)

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

  element.style.position = 'absolute'

  if dpr isnt bspr
    element.width = width * ratio
    element.height = height * ratio
    context.scale ratio, ratio
    element.style.width = px width
    element.style.height = px height
  else
    element.width = width
    element.height = height

  new Canvas element, context, bounds, ratio

px = (pixels) -> "#{round pixels}px"

class Viewport
  constructor: (@bounds, @container, @baseCanvas, @highlightCanvas, @hoverCanvas, @maskCanvas, @clipCanvas, @marquee, @mask, @clip) ->


extractEncodings = (encoding) ->
  encodings = {}
  for own attr, encoder of encoding
    encodings[attr] = if encoder then encoder.encode else undefined
  encodings

createVisualization = (bounds, table, encoding, maskPoint, highlightPoint, renderPoint, selectPoint) ->

  viewport = createViewport bounds

  { bounds, baseCanvas, highlightCanvas, hoverCanvas, clipCanvas, maskCanvas, marquee, mask, clip } = viewport
  { indices } = table
  encodings = extractEncodings encoding

  _index = undefined

  test = (x, y) ->
    i = mask.test x, y
    if i isnt undefined
      # Anti-aliasing artifacts on the mask canvas can cause false positives. Redraw this single mark and check if it ends up at the same (x, y) position.
      clipCanvas.context.clearRect 0, 0, bounds.width, bounds.height
      maskPoint [ i ], encodings, clipCanvas.context, clip
      return i if clip.test x, y
    return

  hover = (x, y) ->
    debug x, y
    i = test x, y
    if i isnt _index
      _index = i
      hoverCanvas.context.clearRect 0, 0, bounds.width, bounds.height
      if i isnt undefined
        tooltip = {}
        for variable in table.variables
          tooltip[variable.name] = variable.format i
        debug tooltip
        highlightPoint [ i ], encodings, hoverCanvas.context
    return

  highlight = (indices) ->
    highlightCanvas.context.clearRect 0, 0, bounds.width, bounds.height
    if indices.length
      baseCanvas.element.style.opacity = 0.5
      highlightPoint indices, encodings, highlightCanvas.context
      renderPoint indices, encodings, highlightCanvas.context
    else
      baseCanvas.element.style.opacity = 1

  selectAt = (x, y) ->
    i = test x, y
    debug 'selectAt', x, y
    highlight if i isnt undefined then [ i ] else []

  selectWithin = (x1, y1, x2, y2) ->
    xmin = if x1 > x2 then x2 else x1
    xmax = if x1 > x2 then x1 else x2
    ymin = if y1 > y2 then y2 else y1
    ymax = if y1 > y2 then y1 else y2
    debug 'selectWithin', xmin, ymin, xmax, ymax
    highlight selectPoint indices, encodings, xmin, ymin, xmax, ymax

  render = ->
    renderPoint indices, encodings, baseCanvas.context
    maskPoint indices, encodings, maskCanvas.context, mask

  captureMouseEvents hoverCanvas.element, marquee, hover, selectWithin, selectAt

  new Visualization viewport, table, test, highlight, hover, selectAt, selectWithin, render

class Visualization
  constructor: (@viewport, @table, @test, @highlight, @hover, @selectAt, @selectWithin, @render) ->

createViewport = (bounds) ->
  [ baseCanvas, highlightCanvas, hoverCanvas, maskCanvas, clipCanvas ] = (createCanvas bounds for i in [ 1 .. 5 ])

  container = document.createElement 'div'
  # Set position to 'relative'. This has two effects: 
  #  1. The canvases contained in it (which are set to position: absolute), overlap instead of flowing.
  #  2. Mouse events captured on the top-most canvas get reported with the offset relative to this container instead of the page.
  container.style.position = 'relative'
  container.style.width = px bounds.width
  container.style.height = px bounds.height

  marquee = document.createElement 'div'
  marquee.style.position = 'absolute'
  marquee.style.left = px 0
  marquee.style.top = px 0
  marquee.style.width = px 0
  marquee.style.height = px 0
  marquee.style.display = 'none'
  marquee.style.outline = '1px dotted #999'
  marquee.style.background = 'rgba(0, 0, 0, 0.05)'

  container.appendChild baseCanvas.element
  container.appendChild highlightCanvas.element
  container.appendChild marquee
  container.appendChild hoverCanvas.element

  mask = createMask maskCanvas
  clip = createClip clipCanvas

  new Viewport(
    bounds
    container
    baseCanvas
    highlightCanvas
    hoverCanvas
    maskCanvas
    clipCanvas
    marquee
    mask
    clip
  )

class Bounds
  constructor: (@width, @height) ->

plot_defaults =
  bounds: new Bounds 400, 400

class Category
  constructor: (@index, @value) ->

factor = (field) ->
  new ComputedField (table) ->
    variable = table.get field
    if variable instanceof Factor
      field        
    else
      data = new Array variable.data.length
      for value, i in variable.data
        data[i] = '' + value #XXX handle undefined

      table.put computedVariable = createFactor "FACTOR(#{variable.label})", TString, data
      new Field computedVariable.name

plot_factor = dispatch(
  [ String, (name) -> factor new Field name ]
  [ Field, (field) -> factor field ]
)

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

  #TODO handle layers

  geom = head geoms

  resolvedGeom = resolveChannels defaultPoint geom
  encoding = encodePoint table, resolvedGeom, bounds

  visualization = createVisualization bounds, table, encoding, maskPoint, highlightPoint, renderPoint, selectPoint

  visualization.render()
  
  visualization.viewport.container

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

computeExtent = (array) ->
  min = Number.POSITIVE_INFINITY
  max = Number.NEGATIVE_INFINITY
  for value in array
    if value isnt null
      min = value if value <= min 
      max = value if value >= max
  
  new Extent min, max

class Factoring
  constructor: (@data, @domain, @format, @read) ->

factorize = (array, values) ->
  _id = 0
  _dictionary = {}
  data = new Array array.length

  domain = for value in values
    _dictionary[value] = new Category _id++, value

  for element, index in array
    value = if element is undefined or element is null then '?' else element
    unless category = _dictionary[value]
      domain.push _dictionary[value] = category = new Category _id++, value
    data[index] = category

  format = (i) -> data[i].value
  read = (i) -> data[i]

  new Factoring data, domain, format, read

createFactor = (label, type, data, domain) ->
  factoring = factorize data, domain or []
  new Factor label, label, type, factoring.data, factoring.domain, factoring.format, factoring.read

createVariable = (label, type, data, format) ->
  domain = computeExtent data
  read = (i) -> data[i]
  _format = (i) -> format data[i]
  new Variable label, label, type, data, domain, _format, read

plot.data = plot_data
plot.rectangular = plot_rectangular
plot.polar = plot_polar
plot.parallel = plot_parallel
plot.point = plot_point
plot.value = plot_value
plot.domain = plot_domain
plot.range = plot_range
plot.position = plot_position
plot.fillColor = plot_fillColor
plot.fillOpacity = plot_fillOpacity
plot.strokeColor = plot_strokeColor
plot.strokeOpacity = plot_strokeOpacity
plot.size = plot_size
plot.lineWidth = plot_lineWidth
plot.shape = plot_shape
plot.factor = plot_factor
plot.parse = plot_parse
plot.compile = plot_compile
plot.createTable = createTable
plot.createVariable = createVariable
plot.createFactor = createFactor


if module?.exports? then module.exports = plot else window.plot = plot
