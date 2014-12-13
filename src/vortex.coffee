#
# Vortex
#

# TODO fix mmin, mmax, vvalues in shorthand
# Tooltips
# Vector encoding:
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
sq = (x) -> x * x
clamp_ = (min, max) -> (value) ->
  if value < min
    min
  else if value > max
    max
  else
    value
clampOpacity = clamp_ 0, 1

defaultSize = 8

#
# Chroma wrappers
#

cloneColor = (color) ->
  [ r, g, b ] = color.rgb()
  chroma.rgb r, g, b

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

class Clip
  constructor: (@put, @test) ->

class Mask
  constructor: (@put, @test) ->

class Size
  constructor: (@width, @height) ->

class Rect
  constructor: (@left, @top, @width, @height) ->

class Vector
  constructor: (@name, @label, @type, @data, @domain, @format, @read) ->

class Factor extends Vector
  constructor: (name, label, type, data, domain, format, read) ->
    super name, label, type, data, domain, format, read

class Frame
  constructor: (@label, @vectors, @rowCount, @schema, @indices, @get, @put) ->

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

class Geometry

class PointGeometry extends Geometry
  constructor: (@positionX, @positionY, @shape, @size, @fillColor, @fillOpacity, @strokeColor, @strokeOpacity, @lineWidth) ->

class TextGeometry extends Geometry
  constructor: (@position, @text, @size, @fillColor, @fillOpacity) ->

class PointEncoding
  constructor: (@positionX, @positionY, @shape, @size, @fillColor, @fillOpacity, @strokeColor, @strokeOpacity, @lineWidth) ->

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

class ColorEncoder extends VariableEncoder
  constructor: (label, encode, @domain, @range, @guide) ->
    super label, encode

class OpacityEncoder extends VariableEncoder
  constructor: (label, encode, @domain, @range, @guide) ->
    super label, encode

class SizeEncoder extends VariableEncoder
  constructor: (label, encode, @domain, @range, @guide) ->
    super label, encode

class ShapeEncoder extends VariableEncoder
  constructor: (label, encode, @domain, @range, @guide) ->
    super label, encode

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

class ConstantFillColorChannel extends FillColorChannel
  constructor: (@value) ->

class VariableFillColorChannel extends FillColorChannel
  constructor: (@field, @range) ->

class ConstantFillOpacityChannel extends FillOpacityChannel
  constructor: (@value) ->

class VariableFillOpacityChannel extends FillOpacityChannel
  constructor: (@field, @range) ->

class ConstantStrokeColorChannel extends StrokeColorChannel
  constructor: (@value) ->

class VariableStrokeColorChannel extends StrokeColorChannel
  constructor: (@field, @range) ->

class ConstantStrokeOpacityChannel extends StrokeOpacityChannel
  constructor: (@value) ->

class VariableStrokeOpacityChannel extends StrokeOpacityChannel
  constructor: (@field, @range) ->

class ConstantSizeChannel extends SizeChannel
  constructor: (@value) ->

class VariableSizeChannel extends SizeChannel
  constructor: (@field, @range) ->

class ConstantLineWidthChannel extends LineWidthChannel
  constructor: (@value) ->

class VariableLineWidthChannel extends LineWidthChannel
  constructor: (@field, @range) ->

class ConstantShapeChannel extends ShapeChannel
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

class Canvas
  constructor: (@element, @context, @bounds, @ratio) ->

class Viewport
  constructor: (@bounds, @container, @baseCanvas, @highlightCanvas, @hoverCanvas, @maskCanvas, @clipCanvas, @marquee, @mask, @clip) ->

class Visualization
  constructor: (@viewport, @frame, @test, @highlight, @hover, @selectAt, @selectWithin, @render) ->

class Bounds
  constructor: (@width, @height) ->

class Category
  constructor: (@index, @value) ->

class Factoring
  constructor: (@data, @domain, @format, @read) ->

byteToHex = (b) ->
  hex = b.toString 16
  if hex.length is 1 then "0#{hex}" else hex

createExtent = (a, b) ->
  if a < b
    new Extent a, b
  else
    new Extent b, a

createClip = (canvas) ->
  { context, ratio } = canvas
  put = (index) -> "#fff"
  test = (x, y) ->
    [ r, g, b, a ] = context.getImageData x * ratio, y * ratio, 1, 1
      .data
    r is 255 and g is 255 and b is 255 and a is 255

  new Clip put, test


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

createSequentialLinearScale = (domain, range) ->
  d3.scale.linear()
    .domain [ domain.min, domain.max ]
    .range [ range.min, range.max ]

createDivergingLinearScale = (domain, range) ->
  d3.scale.linear()
    .domain [ domain.min, domain.mid, domain.max ]
    .range [ range.min, range.mid, range.max ]

createSequentialColorScale = (domain, range) ->
  chroma
    .scale [ range.min, range.max ]
    .domain [ domain.min, domain.max ]
    .mode 'lch'

createDivergingColorScale = (domain, range) ->
  left = chroma
    .scale [ range.min, range.mid ]
    .domain [ domain.min, domain.mid ]
    .mode 'lch'

  right = chroma
    .scale [ range.mid, range.max ]
    .domain [ domain.mid, domain.max ]
    .mode 'lch'

  (value) ->
    if value < domain.mid
      left value
    else
      right value

createColorScale = dispatch(
  [ SequentialRange, ColorRange, createSequentialColorScale ]
  [ DivergingRange, ColorRange, createDivergingColorScale ]
)

createLinearScale = dispatch(
  [ SequentialRange, SequentialRange, createSequentialLinearScale ]
  [ DivergingRange, DivergingRange, createDivergingLinearScale ]
)

createFrame = (label, vectors, rowCount) ->
  schema = indexBy vectors, (vector) -> vector.name
  indices = sequence rowCount

  frame = new Frame label, vectors, rowCount, schema, indices, null, null

  frame.get = (field) ->
    if field instanceof ComputedField
      frame.get field.evaluate frame
    else
      schema[field.name]

  frame.put = (vector) ->
    vectors.push vector
    schema[ vector.name ] = vector
    vector

  frame

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

encodeColor = (frame, channel) ->
  if channel instanceof VariableFillColorChannel or channel instanceof VariableStrokeColorChannel
    vector = frame.get channel.field
    if vector instanceof Factor
      unless channel.range
        channel.range = new CategoricalRange pickCategoricalColorPalette vector.domain.length
      scale = createCategoricalScale vector.domain, channel.range
      read = vector.read
      encode = (i) -> chroma scale read i
      new ColorEncoder vector.label, encode, vector.domain, channel.range, null #XXX
    else
      domain = switch computeSkew0 vector.domain
        when 1
          new SequentialRange vector.domain.min, vector.domain.max
        when -1
          new SequentialRange vector.domain.min, vector.domain.max
        else
          #TODO origin should be a parameter
          new DivergingRange vector.domain.min, 0, vector.domain.max

      skew = computeSkew0 domain
      range = if channel.range
        if channel.range instanceof DivergingColorRange
          if domain instanceof SequentialRange
            # Caller specified a diverging color range, but the domain is skewed, so treat the domain as sequential
            if skew is 1
              new SequentialColorRange channel.range.mid, channel.range.max

            else
              new SequentialColorRange channel.range.min, channel.range.mid

          else # DivergingRange
            channel.range
        else # SequentialColorRange
          if domain instanceof DivergingRange
            # Caller specified a sequential color range, but the domain is diverging, so treat the domain as sequential
            domain = new SequentialRange domain.min, domain.max
          channel.range
      else
        if domain instanceof SequentialRange
          if skew is 1
            # REVIEW
            # Color brewer, 3-class blues
            new SequentialColorRange '#deebf7', '#3182bd'   
          else
            # REVIEW
            # Color brewer, 3-class oranges
            new SequentialColorRange '#e6550d', '#fee6ce'
        else # DivergingRange
          # REVIEW
          # Color brewer, 3-class spectral
          new DivergingColorRange '#fc8d59', '#ffffbf'

      scale = createColorScale domain, range
      read = vector.read
      encode = (i) -> scale read i
      new ColorEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder channel.value

encodeOpacity = (frame, channel) ->
  if channel instanceof VariableFillOpacityChannel or channel instanceof VariableStrokeOpacityChannel
    vector = frame.get channel.field
    if vector instanceof Factor
      throw new Error "Could not encode opacity. Vector '#{vector.label}' is a Factor."
    domain = new SequentialRange vector.domain.min, vector.domain.max
    range = if channel.range
      new SequentialRange (clampOpacity channel.range.min), (clampOpacity channel.range.max)
    else
      channel.range = new SequentialRange 0.05, 1
    scale = createLinearScale domain, range
    read = vector.read
    encode = (i) -> scale read i
    new OpacityEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder clampOpacity channel.value

encodeSize = (frame, channel) ->
  if channel instanceof VariableSizeChannel
    vector = frame.get channel.field
    if vector instanceof Factor
      throw new Error "Could not encode size. Vector '#{vector.label}' is a Factor."
    domain = new SequentialRange vector.domain.min, vector.domain.max
    range = if channel.range
      new SequentialRange (sq channel.range.min), (sq channel.range.max)
    else
      channel.range = new SequentialRange (sq defaultSize), (sq 30)
    scale = createLinearScale domain, range 
    read = vector.read
    encode = (i) -> scale read i
    new SizeEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder sq channel.value

encodeLineWidth = (frame, channel) ->
  if channel instanceof VariableLineWidthChannel
    vector = frame.get channel.field
    if vector instanceof Factor
      throw new Error "Could not encode lineWidth. Vector '#{vector.label}' is a Factor."
    domain = new SequentialRange vector.domain.min, vector.domain.max
    range = if channel.range
      new SequentialRange channel.range.min, channel.range.max
    else
      channel.range = new SequentialRange 1.5, 15
    scale = createLinearScale domain, range 
    read = vector.read
    encode = (i) -> scale read i
    new SizeEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder channel.value

encodeShape = (frame, channel) ->
  if channel instanceof VariableShapeChannel
    vector = frame.get channel.field
    unless vector instanceof Factor
      throw new Error "Could not encode shape. Vector '#{vector.label}' is not a Factor." 
    unless channel.range
      channel.range = new CategoricalRange pickCategoricalShapePalette vector.domain.length 
    scale = createCategoricalScale vector.domain, channel.range
    read = vector.read
    encode = (i) -> Shapes[ scale read i ]
    new ShapeEncoder vector.label, encode, vector.domain, channel.range, null #XXX
  else
    #REVIEW: throw error or switch to circle?
    new ConstantEncoder Shapes[channel.value] or Shapes.circle


defaultPoint = (geom) ->
  geom.shape = new ConstantShapeChannel 'circle' unless geom.shape
  geom.size = new ConstantSizeChannel defaultSize unless geom.size

  hasFill = geom.fillColor or geom.fillOpacity
  hasStroke = geom.strokeColor or geom.strokeOpacity or geom.lineWidth
  hasStroke = yes unless hasFill or hasStroke

  if hasFill
    geom.fillColor = new ConstantFillColorChannel chroma head ColorPalettes.c10 unless geom.fillColor
    geom.fillOpacity = new ConstantFillOpacityChannel 1 unless geom.fillOpacity

  if hasStroke
    geom.strokeColor = new ConstantStrokeColorChannel chroma head ColorPalettes.c10 unless geom.strokeColor
    geom.strokeOpacity = new ConstantStrokeOpacityChannel 1 unless geom.strokeOpacity
    geom.lineWidth = new ConstantLineWidthChannel 1.5 unless geom.lineWidth

  geom

encodePosition = (frame, channel, range) ->
  field = channel.field
  vector = frame.get field
  { domain } = vector

  switch vector.type
    when TNumber
      scale = createNicedLinearScale domain, range
      read = vector.read
      encode = (i) -> scale read i
      guide = (count) ->
        format = scale.tickFormat count
        scale.ticks count

      new LinearAxis vector.label, encode, domain, range, guide
    else
      throw new Error 'ni'

encodePoint = (frame, geom, bounds) ->
  positionX = encodePosition frame, geom.positionX, new SequentialRange 0, bounds.width
  positionY = encodePosition frame, geom.positionY, new SequentialRange bounds.height, 0

  shape = encodeShape frame, geom.shape
  size = encodeSize frame, geom.size

  if geom.fillColor or geom.fillOpacity
    fillColor = encodeColor frame, geom.fillColor
    fillOpacity = encodeOpacity frame, geom.fillOpacity

  if geom.strokeColor or geom.strokeOpacity or geom.lineWidth
    strokeColor = encodeColor frame, geom.strokeColor
    strokeOpacity = encodeOpacity frame, geom.strokeOpacity
    lineWidth = encodeLineWidth frame, geom.lineWidth

  new PointEncoding positionX, positionY, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth


highlightPointMarks = (indices, encoding, g) ->
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


maskPointMarks = (indices, encoding, g, mask) ->
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

renderPointMarks = (indices, encoding, g) ->
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
selectPointMarks = (indices, encoding, xmin, ymin, xmax, ymax) ->
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


plot_data = dispatch(
  [ Frame, identity ]
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
  [ String, String, (nameX, nameY) -> new PointChannel (new Field nameX), (new Field nameY) ]
  [ String, Field, (nameX, fieldY) -> new PointChannel (new Field nameX), fieldY ]
  [ Field, String, (fieldX, nameY) -> new PointChannel fieldX, (new Field nameY) ]
  [ Field, Field, (fieldX, fieldY) -> new PointChannel fieldX, fieldY ]
)

plot_shape = dispatch(
  [ StringValue, (value) -> new ConstantShapeChannel value.value ]
  [ String, (name) -> new VariableShapeChannel new Field name ]
  [ Field, (field) -> new VariableShapeChannel field ]
  [ String, CategoricalRange, (name, range) -> new VariableShapeChannel (new Field name), range ]
  [ Field, CategoricalRange, (field, range) -> new VariableShapeChannel field, range ]
)

plot_fillColor = dispatch(
  [ StringValue, (value) -> new ConstantFillColorChannel chroma value.value ]
  [ String, (name) -> new VariableFillColorChannel new Field name ]
  [ Field, (field) -> new VariableFillColorChannel field ]
  [ String, ColorRange, (name, range) -> new VariableFillColorChannel (new Field name), range ]
  [ Field, ColorRange, (field, range) -> new VariableFillColorChannel field, range ]
  [ String, CategoricalRange, (name, range) -> new VariableFillColorChannel (new Field name), range ]
  [ Field, CategoricalRange, (field, range) -> new VariableFillColorChannel field, range ]
)

plot_fillOpacity = dispatch(
  [ NumberValue, (value) -> new ConstantFillOpacityChannel value.value ]
  [ String, (name) -> new VariableFillOpacityChannel new Field name ]
  [ Field, (field) -> new VariableFillOpacityChannel field ]
  [ String, SequentialRange, (name, range) -> new VariableFillOpacityChannel (new Field name), range ]
  [ Field, SequentialRange, (field, range) -> new VariableFillOpacityChannel field, range ]
)

plot_strokeColor = dispatch(
  [ StringValue, (value) -> new ConstantStrokeColorChannel chroma value.value ]
  [ String, (name) -> new VariableStrokeColorChannel new Field name ]
  [ Field, (field) -> new VariableStrokeColorChannel field ]
  [ String, ColorRange, (name, range) -> new VariableStrokeColorChannel (new Field name), range ]
  [ Field, ColorRange, (field, range) -> new VariableStrokeColorChannel field, range ]
  [ String, CategoricalRange, (name, range) -> new VariableStrokeColorChannel (new Field name), range ]
  [ Field, CategoricalRange, (field, range) -> new VariableStrokeColorChannel field, range ]
)

plot_strokeOpacity = dispatch(
  [ NumberValue, (value) -> new ConstantStrokeOpacityChannel value.value ]
  [ String, (name) -> new VariableStrokeOpacityChannel new Field name ]
  [ Field, (field) -> new VariableStrokeOpacityChannel field ]
  [ String, SequentialRange, (name, range) -> new VariableStrokeOpacityChannel (new Field name), range ]
  [ Field, SequentialRange, (field, range) -> new VariableStrokeOpacityChannel field, range ]
)

plot_size = dispatch(
  [ NumberValue, (value) -> new ConstantSizeChannel value.value ]
  [ String, (name) -> new VariableSizeChannel new Field name ]
  [ Field, (field) -> new VariableSizeChannel field ]
  [ String, SequentialRange, (name, range) -> new VariableSizeChannel (new Field name), range ]
  [ Field, SequentialRange, (field, range) -> new VariableSizeChannel field, range ]
)
plot_lineWidth = dispatch(
  [ NumberValue, (value) -> new ConstantLineWidthChannel value.value ]
  [ String, (name) -> new VariableLineWidthChannel new Field name ]
  [ Field, (field) -> new VariableLineWidthChannel field ]
  [ String, SequentialRange, (name, range) -> new VariableLineWidthChannel (new Field name), range ]
  [ Field, SequentialRange, (field, range) -> new VariableLineWidthChannel field, range ]
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

composeStyle = (encodeColor, encodeOpacity) ->
  if encodeColor and encodeOpacity
    (i) ->
      color = encodeColor i
      opacity = encodeOpacity i
      if 0 <= opacity < 1
        colorToStyleA color, opacity
      else
        colorToStyle color
  else
    undefined

extractEncodings = (encoding) ->
  encodings = {}
  for own attr, encoder of encoding
    encodings[attr] = if encoder then encoder.encode else undefined

  { fillColor, fillOpacity, strokeColor, strokeOpacity } = encodings

  encodings.fill = composeStyle fillColor, fillOpacity
  encodings.stroke = composeStyle strokeColor, strokeOpacity

  encodings

createVisualization = (bounds, frame, encoding, maskMarks, highlightMarks, renderMarks, selectMarks) ->

  viewport = createViewport bounds

  { bounds, baseCanvas, highlightCanvas, hoverCanvas, clipCanvas, maskCanvas, marquee, mask, clip } = viewport
  { indices } = frame
  encodings = extractEncodings encoding

  _index = undefined

  test = (x, y) ->
    i = mask.test x, y
    if i isnt undefined
      # Anti-aliasing artifacts on the mask canvas can cause false positives. Redraw this single mark and check if it ends up at the same (x, y) position.
      clipCanvas.context.clearRect 0, 0, bounds.width, bounds.height
      maskMarks [ i ], encodings, clipCanvas.context, clip
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
        for vector in frame.vectors
          tooltip[vector.name] = vector.format i
        debug tooltip
        highlightMarks [ i ], encodings, hoverCanvas.context
    return

  highlight = (indices) ->
    highlightCanvas.context.clearRect 0, 0, bounds.width, bounds.height
    if indices.length
      baseCanvas.element.style.opacity = 0.5
      highlightMarks indices, encodings, highlightCanvas.context
      renderMarks indices, encodings, highlightCanvas.context
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
    highlight selectMarks indices, encodings, xmin, ymin, xmax, ymax

  render = ->
    renderMarks indices, encodings, baseCanvas.context
    maskMarks indices, encodings, maskCanvas.context, mask

  captureMouseEvents hoverCanvas.element, marquee, hover, selectWithin, selectAt

  new Visualization viewport, frame, test, highlight, hover, selectAt, selectWithin, render

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


plot_defaults =
  bounds: new Bounds 400, 400

factor = (field) ->
  new ComputedField (frame) ->
    vector = frame.get field
    if vector instanceof Factor
      field        
    else
      data = new Array vector.data.length
      for value, i in vector.data
        data[i] = '' + value #XXX handle undefined

      frame.put computedVector = createFactor "FACTOR(#{vector.label})", TString, data
      new Field computedVector.name

plot_factor = dispatch(
  [ String, (name) -> factor new Field name ]
  [ Field, (field) -> factor field ]
)

getOp = (ops, type, def) ->
  if op = findByType ops, type
    op
  else
    def

arePositionVectorsCompatible = (vectors) ->
  top = head vectors

  for vector in rest vectors
    if (top.type isnt vector.type) or (top.type is TString and top.label isnt vector.label)
      throw new Error "Vector '#{vector.label}' of type '#{vector.type}' cannot be plotted on the same axis as vector '#{top.label}' of type '#{top.type}'" 

  return yes

render = (frame, ops) ->
  bounds = getOp ops, Bounds, plot_defaults.bounds
  geoms = filterByType ops, Geometry

  #TODO handle layers

  geom = head geoms

  encoding = encodePoint frame, (defaultPoint geom), bounds

  visualization = createVisualization bounds, frame, encoding, maskPointMarks, highlightPointMarks, renderPointMarks, selectPointMarks

  visualization.render()
  
  visualization.viewport.container

_plot = dispatch(
  [ 
    Datasource, Array, Function, (ds, ops, go) -> 
      ds.read (error, frame) -> 
        if error
          go error
        else
          _plot frame, ops, go
  ] 
  [
    Frame, Array, Function, (frame, ops, go) ->
      try
        go null, render frame, ops
      catch error
        go error
  ]
)

plot = (ops...) ->
  if datasource = findByType ops, Datasource, Frame
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

computeSkew_ = (origin) -> (extent) ->
  if extent.min >= origin and extent.max > origin
    1
  else if extent.min < origin and extent.max <= origin
    -1
  else
    0

computeSkew0 = computeSkew_ 0

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

createVector = (label, type, data, format) ->
  domain = computeExtent data
  read = (i) -> data[i]
  _format = (i) -> format data[i]
  new Vector label, label, type, data, domain, _format, read

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
plot.createFrame = createFrame
plot.createVector = createVector
plot.createFactor = createFactor


if module?.exports? then module.exports = plot else window.plot = plot
