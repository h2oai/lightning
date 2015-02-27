#
# Vortex
# ==============================
#

#
# Constants
# ==============================
#

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
Transparent = 'transparent'

#
# Pseudo-types
# ==============================
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
# Type checking
# ==============================
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
# Dispatching and Pattern Matching
# ==============================
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
        -> pattern is RegExp
      when Error
        -> pattern is Error
      when TDate
        (a) -> pattern is Date or a is pattern
      when TArray
        if pattern.length is 1 and TFunction is (type1 = typeOf pattern[0])
          matchElement = matchPattern_ pattern[0]
          (xs) ->
            return no if TArray isnt typeOf xs 
            for x in xs
              return no unless matchElement x
            return yes
        else
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
        -> no

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
# Types
# ==============================
#

class Clip
  constructor: (@put, @test) ->

class Mask
  constructor: (@put, @test) ->

class Size
  constructor: (@width, @height) ->

class Rect
  constructor: (@left, @top, @width, @height) ->

class Vector
  constructor: (@name, @label, @type, @at, @count, @domain, @format) ->

class Factor extends Vector
  constructor: (name, label, type, at, @valueAt, count, domain, format) ->
    super name, label, type, at, count, domain, format

class List extends Vector
  constructor: (name, label, at, count, domain, format) ->
    super name, label, TObject, at, count, domain, format

class Group

class Frame
  constructor: (@label, @vectors, @schema, @indices, @cube, @at, @evaluate, @attach, @metadata) ->

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

class MappedField extends Field
  constructor: (@evaluate) ->

class ReducedField extends Field
  constructor: (@evaluate) ->

class Fill
  constructor: (
    @color
    @opacity
  ) ->

class Stroke
  constructor: (
    @color
    @opacity
    @size
  ) ->

class TableExpr
  constructor: (@fields) ->

class RecordExpr
  constructor: (@index) ->

class MarkExpr

class PointExpr extends MarkExpr
  constructor: (
    @position
    @shape
    @size
    @fillColor
    @fillOpacity
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->

class PathExpr extends MarkExpr
  constructor: (
    @position
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->

class SchemaExpr extends MarkExpr
  constructor: (
    @position
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->

class RectExpr extends MarkExpr
  constructor: (
    @position
    @width
    @height
    @fillColor
    @fillOpacity
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->

class Mark

class PointMark extends Mark
  constructor: (
    @space
    @positionX
    @positionY
    @shape
    @size
    @fillColor
    @fillOpacity
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->
    @geometry = PointGeometry

class SchemaXMark extends Mark
  constructor: (
    @space
    @q0
    @q1
    @q2
    @q3
    @qn
    @positionY
    @height
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->
    @geometry = SchemaXGeometry

class SchemaYMark extends Mark
  constructor: (
    @space
    @positionX
    @q0
    @q1
    @q2
    @q3
    @qn
    @width
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->
    @geometry = SchemaYGeometry

class ColMark extends Mark
  constructor: (
    @space
    @positionX
    @positionY1
    @positionY2
    @width
    @fillColor
    @fillOpacity
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->
    @geometry = ColGeometry

class BarMark extends Mark
  constructor: (
    @space
    @positionX1
    @positionX2
    @positionY
    @height
    @fillColor
    @fillOpacity
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->
    @geometry = BarGeometry

class PathMark extends Mark
  constructor: (
    @space
    @positionX
    @positionY
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->
    @geometry = PathGeometry

class TextMark extends Mark
  constructor: (
    @space
    @positionX
    @positionY
    @text
    @size
    @fillColor
    @fillOpacity
    @tooltip
  ) ->
    @geometry = TextGeometry

class Encoding

class PointEncoding extends Encoding
  constructor: (
    @positionX
    @positionY
    @shape
    @size
    @fill
    @fillColor
    @fillOpacity
    @stroke
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->

class SchemaXEncoding extends Encoding
  constructor: (
    @q0
    @q1
    @q2
    @q3
    @qn
    @positionY
    @height
    @stroke
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) -> 

class SchemaYEncoding extends Encoding
  constructor: (
    @positionX
    @q0
    @q1
    @q2
    @q3
    @qn
    @width
    @stroke
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) -> 

class ColEncoding extends Encoding
  constructor: (
    @positionX
    @positionY1
    @positionY2
    @width
    @fill
    @fillColor
    @fillOpacity
    @stroke
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) -> 

class BarEncoding extends Encoding
  constructor: (
    @positionX1
    @positionX2
    @positionY
    @height
    @fill
    @fillColor
    @fillOpacity
    @stroke
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) -> 

class PathEncoding extends Encoding
  constructor: (
    @positionX
    @positionY
    @stroke
    @strokeColor
    @strokeOpacity
    @lineWidth
    @tooltip
  ) ->

class Space2D
  constructor: (@x, @y) ->

class Space1D
  constructor: (@type, @vectors, @domain) ->

class Axis

class CategoricalAxis extends Axis
  constructor: (@type, @label, @scale, @domain, @range, @rect, @guide) ->

class LinearAxis extends Axis
  constructor: (@type, @label, @scale, @domain, @range, @rect, @guide) ->

class Tick
  constructor: (@value, @label) ->

class Encoder
  constructor: (@label, @encode) ->

class ConstantEncoder extends Encoder
  constructor: (@value) ->
    super 'Constant', always @value

class VariableEncoder extends Encoder
  constructor: (label, encode, @vector) ->
    super label, encode

class TooltipEncoder extends Encoder
  constructor: (@vectors) ->
    super 'tooltips'

class PositionEncoder extends VariableEncoder
  constructor: (label, encode, vector, @domain, @range, @guide) ->
    super label, encode, vector

class ColorEncoder extends VariableEncoder
  constructor: (label, encode, vector, @domain, @range, @guide) ->
    super label, encode, vector

class OpacityEncoder extends VariableEncoder
  constructor: (label, encode, vector, @domain, @range, @guide) ->
    super label, encode, vector

class SizeEncoder extends VariableEncoder
  constructor: (label, encode, vector, @domain, @range, @guide) ->
    super label, encode, vector

class ShapeEncoder extends VariableEncoder
  constructor: (label, encode, vector, @domain, @range, @guide) ->
    super label, encode, vector

class Channel

class ColorChannel extends Channel

class CoordChannel extends Channel
  constructor: (@field) ->

class PositionChannel extends Channel
  constructor: (@coordinates) ->

class FillColorChannel extends Channel

class FillOpacityChannel extends Channel

class StrokeColorChannel extends Channel

class StrokeOpacityChannel extends Channel

class SizeChannel extends Channel

class WidthChannel extends Channel

class HeightChannel extends Channel

class LineWidthChannel extends Channel

class ShapeChannel extends Channel

class TooltipChannel extends Channel

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

class ConstantWidthChannel extends WidthChannel
  constructor: (@value) ->

class VariableWidthChannel extends WidthChannel
  constructor: (@field, @range) ->

class ConstantHeightChannel extends HeightChannel
  constructor: (@value) ->

class VariableHeightChannel extends HeightChannel
  constructor: (@field, @range) ->

class ConstantLineWidthChannel extends LineWidthChannel
  constructor: (@value) ->

class VariableLineWidthChannel extends LineWidthChannel
  constructor: (@field, @range) ->

class ConstantShapeChannel extends ShapeChannel
  constructor: (@value) ->

class VariableShapeChannel extends ShapeChannel
  constructor: (@field, @range) ->

class VariableTooltipChannel extends TooltipChannel
  constructor: (@fields) ->

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

class Geometry
  constructor: (@encode, @mask, @highlight, @render, @select) ->

class Datasource
  constructor: (@read) ->

class Canvas
  constructor: (@element, @context, @bounds, @ratio) ->

class Viewport
  constructor: (
    @box
    @container
    @baseCanvas
    @highlightCanvas
    @hoverCanvas
    @maskCanvas
    @clipCanvas
    @marquee
    @tooltip
    @mask
    @clip
  ) ->

class Layer
  constructor: (@encodings, @encoders, @mask, @highlight, @render, @select) ->

class Visualization
  constructor: (@viewport, @frame, @test, @highlight, @hover, @selectAt, 
    @selectWithin, @render) ->

class Plot
  constructor: (@element, @subscribe, @unsubscribe) ->

class Bounds
  constructor: (@width, @height) ->

class Regions
  constructor: (
    @center
    @left
    @top
    @right
    @bottom
  ) ->

class Margin
  constructor: (
    @left
    @top
    @right
    @bottom
  ) ->

class Box
  constructor: (
    width
    height
    margin
  ) ->
    @width = width
    @height = height
    @margin = margin
    @regions = new Regions(
      rect = new Rect margin.left, margin.top, width - margin.left - margin.right, height - margin.top - margin.bottom
      new Rect 0, margin.top, margin.left, rect.height
      new Rect margin.left + rect.width, margin.top, margin.right, rect.height
      new Rect margin.left, 0, rect.width, margin.top
      new Rect margin.left, margin.top + rect.height, rect.width, margin.bottom
    )

class Query
  constructor: (@select, @where, @limit, @group, @having) ->

class Category
  constructor: (@key, @value) ->

All = new Category 0, 'All'

#
# A Cube
# ------------------------------
class Cube
  constructor: (
    # `Frame` Source frame.
    @frame
    # `{int categoryKey : Level}` Hierarchy of levels.
    @hierarchy
    # `[Cell]` Cells in this cube.
    @cells
    # `int` Number of levels in this cube's hierarchy.
    @dimension
  ) ->

#
# A level in a Cube's hierarchy.
# ------------------------------
class Level
  constructor: (
    # `Category` Category represented by this level.
    @category
    # `[int]` Indices of rows in the source frame that belong to this level.
    @indices
    # `{int categoryKey : Level}` Sub-levels of this level.
    @children
  ) ->

#
# A cell in a Cube.
# ------------------------------
class Cell
  constructor: (
    # `[Level]` The coordinates of this cell. 
    @levels
    # `[int]`: Indices of rows in the source frame that match the attributes of this cell.
    @indices
  ) ->

class Factoring
  constructor: (@at, @valueAt, @count, @domain, @format) ->

class GroupOp
  constructor: (@fields) ->

class SelectOp
  constructor: (@name, @fields, @func) ->

class WhereOp
  constructor: (@fields, @predicate) ->

class LimitOp
  constructor: (@offset, @length) ->

class HavingOp
  constructor: (@fields, @predicate) ->

class HoverEventArg
  constructor: (@vectors, @index) ->

class SelectEventArg
  constructor: (@vectors, @indices) ->

class DeselectEventArg
  constructor: (@vectors) ->

#
# Utility functions
# ==============================
#

# string -> real
# NaN -> undefined
asReal = (datum) ->
  value = parseFloat datum
  if isNaN value then undefined else value

# string -> int
# NaN -> undefined
asInt = (datum) ->
  value = parseInt datum, 10
  if isNaN value then undefined else value

# string -> string
# null -> undefined
# undefined -> undefined
asString = (datum) ->
  if datum? then datum else undefined

# real -> real
sq = (x) -> x * x

# real, real -> real -> real
clamp_ = (min, max) -> (value) ->
  if value < min
    min
  else if value > max
    max
  else
    value

# real -> real
clampNorm = clamp_ 0, 1

defaultSize = 8

# [a] -> [a]
copy = (a) -> slice a, 0

# [a], (a -> [b]) -> [b]
flatMap = (xs, f) ->
  ys = []
  for x in xs
    for y in f x
      ys.push y
  ys

# ( a* -> b), a* -> -> b
operation = (f, args...) -> -> apply f, null, args

# a -> (->) -> a 
always = (value) -> -> value

# [a], [b] -> bool
arrayElementsAreEqual = (xs, ys) ->
  if xs and ys and xs.length is ys.length
    return no for x, i in xs when x isnt ys[i]
    yes
  else
    no

# [a], T* -> [a]
filterByType = (args, types...) ->
  filtered = []
  for arg in args
    filtered.push arg for type in types when arg instanceof type
  filtered

# [a], T* -> a
findByType = (args, types...) ->
  for arg in args
    return arg for type in types when arg instanceof type
  return

# real, real -> Extent
createExtent = (a, b) ->
  if a < b
    new Extent a, b
  else
    new Extent b, a

# [real] -> Extent
computeExtent = (array) ->
  min = Number.POSITIVE_INFINITY
  max = Number.NEGATIVE_INFINITY
  for value in array
    if value isnt undefined
      min = value if value <= min 
      max = value if value >= max
  
  new Extent min, max

# real -> Extent -> int
computeSkew_ = (origin) -> (extent) ->
  if extent.min >= origin and extent.max > origin
    1
  else if extent.min < origin and extent.max <= origin
    -1
  else
    0

# Extent -> int
computeSkew0 = computeSkew_ 0

combineExtents = (extent1, extent2) ->
  new Extent(
    mmin extent1.min, extent2.min
    mmax extent1.max, extent2.max
  )

includeOrigin_ = (origin) -> (extent) ->
  if extent.min > origin and extent.max > origin
    new Extent origin, extent.max
  else if extent.min < origin and extent.max < origin
    new Extent extent.min, origin
  else
    extent

includeOrigin0 = includeOrigin_ 0

# Requires jQuery
download = (type, url, go) ->
  $.ajax
    dataType: type
    url: url
    success: (data, status, xhr) -> go null, data
    error: (xhr, status, error) -> go error

#
# Vector
# ==============================
#

createList = (label, data, _format) ->
  count = -> data.length
  at = (i) -> data[i]
  format = if _format then (i) -> _format data[i], i else at
  new List label, label, at, count, data, format

# string, type, [a], (int -> string) -> Vector
createVector = (label, type, data, _format) ->
  _createVector label, label, type, data, _format

#TODO HACK - refactor callers to specify name
_createVector = (name, label, type, data, _format) ->
  domain = computeExtent data
  count = -> data.length
  at = (i) -> data[i]
  format = if _format then (i) -> _format data[i], i else at
  new Vector name, label, type, at, count, domain, format

#
# Factor
# ==============================
# 
# (int -> a), (-> int), [a] -> Factoring
factorize = (_read, count, values) ->
  _id = 0
  _dictionary = {}
  length = count()
  data = new Array length

  domain = for value in values
    _dictionary[value] = new Category _id++, value

  for i in [ 0 ... length ]
    element = _read i
    value = if element isnt undefined then element else '?'
    unless category = _dictionary[value]
      domain.push _dictionary[value] = category = new Category _id++, value
    data[i] = category

  at = (i) -> data[i]
  valueAt = (i) -> data[i].value
  format = (i) -> data[i].value

  new Factoring at, valueAt, count, domain, format

# string, type, [a], [a] -> Factor 
createFactor = (label, type, data, domain) ->
  count = -> data.length
  at = (i) -> data[i]
  factoring = factorize at, count, domain or []
  new Factor label, label, type, factoring.at, factoring.valueAt, count, factoring.domain, factoring.format

createAllFactor = (label, length) ->
  categoryValue = 'All'
  category = new Category 0, categoryValue
  valueAt = (i) -> categoryValue
  at = -> category
  count = -> length
  format = -> categoryValue
  
  new Factor label, label, TString, at, valueAt, count, [ category ], format

#
# Frame
# ==============================
#

# string, [Vector], [int], Cube? -> Frame
createFrame = (label, vectors, indices, cube, metadata) ->
  schema = indexBy vectors, (vector) -> vector.name

  frame = new Frame label, vectors, schema, indices, cube, null, null, null, metadata or {}

  frame.evaluate = (arg) ->
    fields = if isArray arg then arg else [ arg ]
    vecs = for field in fields
      if field instanceof MappedField
        frame.evaluate field.evaluate frame
      else if field instanceof ReducedField
        if cube
          frame.evaluate field.evaluate frame, cube
        else
          throw new Error "Cannot compute aggregate [#{field.name}] on an unaggregated frame."
      else if field instanceof Field
        if vector = schema[field.name]
          vector
        else
          throw new Error "Vector [#{field.name}] does not exist in frame [#{label}]."
      else
        throw new Error "Cannot evaluate [#{arg}] on frame [#{label}]."
    flatten vecs

  frame.attach = (vector) ->
    if schema[ vector.name ]
      throw new Error "Cannot attach vector [#{vector.name}]: a vector by that name already exists in frame [#{label}]"
    else
      vectors.push vector
      schema[ vector.name ] = vector
      vector

  frame.exists = (name) ->
    if schema[ name ] then yes else no

  frame

dumpFrame = (frame) ->
  rows = new Array frame.indices.length
  ats = map frame.vectors, (vector) -> if vector instanceof Factor then vector.valueAt else vector.at
  for i in frame.indices
    rows[i] = row = new Array frame.vectors.length
    for at, offset in ats
      row[offset] = at i
  rows

#
# Query operators
# ==============================
#

createQuery = (ops) ->
  new Query(
    filterByType ops, SelectOp
    filterByType ops, WhereOp
    filterByType ops, LimitOp
    filterByType ops, GroupOp
    filterByType ops, HavingOp
  )

createFields = (names) ->
  map names, (name) -> new Field name

# Factored fields
# ------------------------------

createFactorField = (field) ->
  new MappedField (frame) ->
    vector = head frame.evaluate field
    if vector instanceof Factor
      field
    else
      length = vector.count()
      at = vector.at
      data = new Array length
      for i in [ 0 ... length ] #TODO for i in frame.indices?
        if undefined isnt value = at i
          data[i] = '' + value

      frame.attach computedVector = createFactor "factor(#{vector.label})", TString, data
      [ new Field computedVector.name ]

createAllField = (name) ->
  new MappedField (frame) ->
    frame.attach createAllFactor name, frame.indices.length
    [ new Field name ]

plot_factor = dispatch(
  [ String, (name) -> plot_factor new Field name ]
  [ Field, (field) -> createFactorField field ]
  [ StringValue, ({value}) -> createAllField value ]
)

createStackedField = (stackedField, depth) ->
  new MappedField (frame) ->
    vector = head frame.evaluate stackedField

    throw new Error "Cannot stack factor [#{vector.label}]: expecting vector." if vector instanceof Factor

    length = vector.count()
    lows = new Array length
    highs = new Array length
    lowName = "low(#{vector.name}, #{depth})"
    highName = "high(#{vector.name}, #{depth})"

    at = vector.at

    cube = frame.cube
    depth = Math.min depth, cube.dimension
    cells = cube.cells

    lo = hi = 0
    _categories = new Array depth
    for i in frame.indices
      levels = cells[i].levels
      for j in [0 ... depth]
        if _categories[j] isnt levels[j].category
          # Reset
          lo = hi = 0
          for k in [0 ... depth]
            _categories[k] = levels[k].category
          break

      value = at i
      if value < 0
        lows[i] = lo
        highs[i] = lo = lo + value
      else
        lows[i] = hi
        highs[i] = hi = hi + value

    format = (value, i) -> vector.format i

    frame.attach _createVector lowName, vector.name, vector.type, lows, format
    frame.attach _createVector highName, vector.name, vector.type, highs, format

    [
      new Field lowName
      new Field highName
    ]

plot_stack = dispatch(
  [ String, Number, (name, depth) -> plot_stack (new Field name), depth ] 
  [ Field, Number, (field, depth) -> createStackedField field, depth ]
)


  

# Schema computations
# ------------------------------

quantile_ = (values) -> 
  clampIndex = clamp_ 0, values.length - 1
  (percentile) ->
    values[ clampIndex -1 + round percentile * values.length ]

computeSchema = (array) ->
  values = for value in array when value or value is 0
    value
  sort values, (a, b) -> a - b

  minimum = values[0]
  maximum = values[values.length - 1]
  quantile = quantile_ values

  q1 = quantile 0.25
  q2 = quantile 0.5
  q3 = quantile 0.75

  # iqr = q3 - q1
  # lo = q1 - 1.5 * iqr
  # hi = q3 + 1.5 * iqr
  #TODO values < lo and > hi are outliers

  [ minimum, q1, q2, q3, maximum ]
  
  

# Aggregate fields
# ------------------------------

aggregate_avg = (array) ->
  total = 0
  count = 0
  for value in array when value isnt undefined
    total += value
    count++
  total / count

aggregate_count = (array) -> 
  count = 0
  for value in array when value isnt undefined
    count++
  count

aggregate_max = (array) ->
  max = Number.NEGATIVE_INFINITY
  for value in array when value isnt undefined
    max = value if value >= max
  max

aggregate_min = (array) ->
  min = Number.POSITIVE_INFINITY
  for value in array when value isnt undefined
    min = value if value <= min
  min

aggregate_sum = (array) ->
  total = 0
  for value in array when value isnt undefined
    total += value
  total

# aggregate_stddev = (array) -> #TODO
# aggregate_stddevP = (array) -> #TODO
# aggregate_variance = (array) -> #TODO
# aggregate_varianceP = (array) -> #TODO

createAggregateField = (field, symbol, type, format, f) ->
  new ReducedField (frame, cube) ->
    name = "#{symbol}(#{field.name})"
    if frame.exists name
      new Field name
    else
      vector = head cube.frame.evaluate field
      at = vector.at
      data = new Array cube.cells.length
      for cell, j in cube.cells
        values = []
        for i in cell.indices
          values.push value if (value = at i) isnt undefined
        data[j] = f values
      frame.attach computedVector = createVector name, type, data, format
      [ new Field computedVector.name ]

plot_aggregate = (title, type, format, func) ->
  dispatch(
    [ String, (name) -> createAggregateField (new Field name), title, type, format, func ]
    [ Field, (field) -> createAggregateField field, title, type, format, func ]
  )

plot_count = plot_aggregate 'count', TNumber, identity, aggregate_count

plot_avg = plot_aggregate 'avg', TNumber, identity, aggregate_avg

plot_max = plot_aggregate 'max', TNumber, identity, aggregate_max

plot_min = plot_aggregate 'min', TNumber, identity, aggregate_min

plot_sum = plot_aggregate 'sum', TNumber, identity, aggregate_sum

# TODO
#plot_stddev = plot_aggregate 'stddev', TNumber, identity, aggregate_stddev
#plot_stddevP = plot_aggregate 'stddevP', TNumber, identity, aggregate_stddevP
#plot_variance = plot_aggregate 'variance', TNumber, identity, aggregate_variance
#plot_varianceP = plot_aggregate 'varianceP', TNumber, identity, aggregate_varianceP

# GROUP BY clause
# ------------------------------

plot_groupBy = (args...) ->
  fields = for arg in args
    if arg instanceof Field
      arg
    else if isString arg
      new Field arg
    else
      throw new Error "Cannot group by [#{arg}]"
  new GroupOp fields

# SELECT clause
# ------------------------------

plot__select = dispatch(
  [ String, [String], Function, (target, sources, func) -> new SelectOp target, (createFields sources), func ]
)

plot_select = (target, sources..., func) ->
  plot__select target, (if sources.length then sources else [target]), func

# WHERE clause
# ------------------------------

plot__where = dispatch(
  [ [String], Function, (names, func) -> new WhereOp (createFields names), func ]
)

plot_where = (names..., func) -> plot__where names, func

plot_limit = dispatch(
  [ Number, Number, (offset, length) -> new LimitOp offset, length ]
  [ Number, (length) -> new LimitOp 0, length ]
)

# HAVING clause
# ------------------------------

#TODO should work on combos of fields and strings?
#TODO BUG vis needs compute bounds post-HAVING
plot__having = dispatch(
  [ [String], Function, (names, func) -> new HavingOp (createFields names), func ]
  [ [Field], Function, (fields, func) -> new HavingOp fields, func ]
)

plot_having = (names..., func) -> plot__having names, func

# Filter predicates
# ------------------------------

plot_eq = (value) -> (actual) -> actual is value

plot_ne = (value) -> (actual) -> actual isnt value

plot_lt = (value) -> (actual) -> actual < value

plot_gt = (value) -> (actual) -> actual > value

plot_le = (value) -> (actual) -> actual <= value

plot_ge = (value) -> (actual) -> actual >= value

plot_like = (regex) ->
  throw new Error "like [#{regex}]: expecting RegExp" if TRegExp isnt typeOf regex
  (actual) -> regex.test actual

plot_in = (expecteds...) -> (actual) ->
  return yes for expected in expecteds when expected is actual
  no

plot_notIn = (expecteds...) -> (actual) -> 
  return no for expected in expecteds when expected is actual
  yes

#
# Query processing
# ==============================
# 
queryFrame = (frame, query) ->
  filteredFrame = if query.where.length
    createFrame frame.label, frame.vectors, filterFrame frame, query.where
  else
    frame
  
  resultFrame = if query.group.length
    fields = flatMap query.group, (op) -> op.fields
    factors = for field in fields
      vector = head filteredFrame.evaluate field
      if vector instanceof Factor
        vector
      else
        throw new Error "Cannot group by [#{field.name}]: not a Factor."

    hierarchy = 0: new Level All, filteredFrame.indices, {}
    buildHierarchy hierarchy, factors, 0

    cells = []
    collapseHierarchy hierarchy[0].children, fields.length - 1, cells, 0, new Array fields.length

    cube = new Cube filteredFrame, hierarchy, cells, fields.length

    aggregatedFrame = aggregateFrame filteredFrame.label + "'", cube, factors

    if query.having.length
      createFrame aggregatedFrame.label, aggregatedFrame.vectors, (filterFrame aggregatedFrame, query.having), aggregatedFrame.cube
    else
      aggregatedFrame
  else
    filteredFrame

  if query.limit.length
    # Last clause overrides
    limit = query.limit[ query.limit.length - 1 ]
    createFrame resultFrame.label, resultFrame.vectors, slice resultFrame.indices, limit.offset, limit.offset + limit.length
  else
    resultFrame

filterFrame = (frame, ops) ->
  _indices = frame.indices # transient!
  for op in ops
    indices = []
    vectors = for field in op.fields
      head frame.evaluate field
    ats = map vectors, (vector) ->
      if vector instanceof Factor then vector.valueAt else vector.at

    for i in _indices
      args = new Array vectors.length
      for at, j in ats
        args[j] = at i
      if apply op.predicate, null, args #TODO Optimize
        indices.push i

    _indices = indices
  _indices

aggregateFrame = (label, cube, sourceFactors) ->
  indices = sequence cube.cells.length
  targetFactors = for offset in [ 0 ... cube.dimension ]
    extractFactor cube, sourceFactors[offset], offset
  createFrame label, targetFactors, indices, cube

buildHierarchy = (hierarchy, vectors, offset) ->
  at = vectors[offset].at
  for key, level of hierarchy
    children = level.children
    for i in level.indices
      category = at i
      unless child = children[category.key]
        children[category.key] = child = new Level category, [], {}
      child.indices.push i

    if offset < vectors.length - 1
      buildHierarchy children, vectors, offset + 1
  return

collapseHierarchy = (hierarchy, depth, cells, offset, coord) ->
  for key, level of hierarchy
    coord[offset] = level
    if offset is depth
      cells.push new Cell (copy coord), level.indices
    else
      collapseHierarchy level.children, depth, cells, offset + 1, coord
  return

extractFactor = (cube, vector, offset) ->
  data = new Array cube.cells.length
  dictionary = {}
  domain = []
  for cell, i in cube.cells
    data[i] = category = cell.levels[offset].category
    unless dictionary[category.value]
      dictionary[category.value] = category
      domain.push category

  at = (i) -> data[i]
  valueAt = (i) -> data[i].value
  format = (i) -> data[i].value
  count = -> data.length

  new Factor vector.label, vector.label, vector.type, at, valueAt, count, domain, format

#
# Color
# ==============================
#

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

pickCategoricalColorPalette = (cardinality) ->
  if cardinality > 10
    ColorPalettes.c20
  else
    ColorPalettes.c10

cloneColor = (color) ->
  [ r, g, b ] = color.rgb()
  chroma.rgb r, g, b

colorToStyle = (color) -> color.css()

colorToStyleA = (color, alpha) ->
  cloneColor color
    .alpha alpha
    .css()

#
# Shapes
# ==============================
#

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
  rx = sqrt area / Sqrt3
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
  rx = sqrt area / Sqrt3
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
  ry = sqrt area / Sqrt3
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
  ry = sqrt area / Sqrt3
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

pickCategoricalShapePalette = -> ShapePalettes.c8

#
# Scales
# ==============================
#

# (a -> b) -> a -> b
# (a -> b) -> nil -> nil
scaleSafe_ = (scale) -> (value) ->
  if value isnt undefined
    scale value
  else
    undefined

createNicedSequentialLinearScale = (domain, range) ->
  scale = d3.scale.linear()
    .domain [ domain.min, domain.max ]
    .range [ range.min, range.max ]
    .nice()

  [ 
    scaleSafe_ scale
    scale.tickFormat
    scale.ticks
  ]

createOrdinalScale = (domain, range) -> #TODO rename
  _index = 0
  _dictionary = {}
  for category in domain
    _dictionary[category.key] = _index++

  offset = (range.max - range.min) / domain.length / 2
  rangeMin = range.min

  scaleSafe_ (category) -> rangeMin + 2 * _dictionary[category.key] * offset + offset

createCategoricalScale = (domain, range) ->
  _rangeValues = range.values
  _rangeCount = _rangeValues.length
  scaleSafe_ (category) -> _rangeValues[ category.key % _rangeCount ]

# SequentialRange a, SequentialRange real -> (a -> real)
createSequentialLinearScale = (domain, range) ->
  scaleSafe_(
    d3.scale.linear()
      .domain [ domain.min, domain.max ]
      .range [ range.min, range.max ]
  )

# DivergingRange a, DivergingRange real -> (a -> real)
createDivergingLinearScale = (domain, range) ->
  scaleSafe_(
    d3.scale.linear()
      .domain [ domain.min, domain.mid, domain.max ]
      .range [ range.min, range.mid, range.max ]
  )

createSequentialColorScale = (domain, range) ->
  scaleSafe_(
    chroma
      .scale [ range.min, range.max ]
      .domain [ domain.min, domain.max ]
      .mode 'lch'
  )

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
    if value isnt undefined
      if value < domain.mid
        left value
      else
        right value
    else
      undefined

createColorScale = dispatch(
  [ SequentialRange, ColorRange, createSequentialColorScale ]
  [ DivergingRange, ColorRange, createDivergingColorScale ]
)

createLinearScale = dispatch(
  [ SequentialRange, SequentialRange, createSequentialLinearScale ]
  [ DivergingRange, DivergingRange, createDivergingLinearScale ]
)

#
# Hit testing
# ==============================
#

byteToHex = (b) ->
  hex = b.toString 16
  if hex.length is 1 then "0#{hex}" else hex

createClip = (canvas) ->
  { context, ratio } = canvas
  put = -> "#fff"
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

#
# Encoding
# ==============================
#

encodePosition = (axis, vector) ->
  { scale, domain, range, guide } = axis
  { label, at } = vector

  encode = (i) -> scale at i
  new PositionEncoder label, encode, vector, domain, range, guide

encodeConstantPosition = (axis, value) ->
  new ConstantEncoder axis.scale value

encodeColor = (frame, channel) ->
  if channel instanceof VariableFillColorChannel or channel instanceof VariableStrokeColorChannel
    vector = head frame.evaluate channel.field
    if vector instanceof Factor
      unless channel.range
        channel.range = new CategoricalRange pickCategoricalColorPalette vector.domain.length
      scale = createCategoricalScale vector.domain, channel.range
      at = vector.at
      encode = (i) -> chroma scale at i
      new ColorEncoder vector.label, encode, vector, vector.domain, channel.range, null #XXX
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
            # Caller specified a diverging color range, 
            # but the domain is skewed, so treat the domain as sequential
            if skew is 1
              new SequentialColorRange channel.range.mid, channel.range.max

            else
              new SequentialColorRange channel.range.min, channel.range.mid

          else # DivergingRange
            channel.range
        else # SequentialColorRange
          if domain instanceof DivergingRange
            # Caller specified a sequential color range, 
            # but the domain is diverging, so treat the domain as sequential
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
      at = vector.at
      encode = (i) -> scale at i
      new ColorEncoder vector.label, encode, vector, domain, range, null #XXX
  else
    new ConstantEncoder channel.value

#TODO use encode_size()
encodeOpacity = (frame, channel) ->
  if channel instanceof VariableFillOpacityChannel or channel instanceof VariableStrokeOpacityChannel
    vector = head frame.evaluate channel.field
    if vector instanceof Factor
      throw new Error "Could not encode opacity. Vector [#{vector.label}] is a Factor."
    domain = new SequentialRange vector.domain.min, vector.domain.max
    range = if channel.range
      new SequentialRange (clampNorm channel.range.min), (clampNorm channel.range.max)
    else
      channel.range = new SequentialRange 0.05, 1
    scale = createLinearScale domain, range
    at = vector.at
    encode = (i) -> scale at i
    new OpacityEncoder vector.label, encode, vector, domain, range, null #XXX
  else
    new ConstantEncoder clampNorm channel.value

encodeStyle = (colorEncoder, opacityEncoder) ->
  if colorEncoder and opacityEncoder
    colorAt = colorEncoder.encode
    opacityAt = opacityEncoder.encode
    new VariableEncoder "(#{colorEncoder.label}, #{opacityEncoder.label})", (i) ->
      color = colorAt i
      opacity = opacityAt i
      if 0 <= opacity < 1
        colorToStyleA color, opacity
      else
        colorToStyle color
  else
    undefined

encode_size = (channelClass, encoderClass) ->
  (frame, channel, limit) ->
    if channel instanceof channelClass
      vector = head frame.evaluate channel.field
      if vector instanceof Factor
        throw new Error "Could not encode size. Vector [#{vector.label}] is a Factor."
      domain = new SequentialRange vector.domain.min, vector.domain.max
      range = if channel.range
        new SequentialRange (clampNorm channel.range.min), (clampNorm channel.range.max) 
      else
        channel.range = new SequentialRange 0.05, 1
      scale = createLinearScale domain, range 
      at = vector.at
      encode = (i) -> limit * scale at i
      new encoderClass vector.label, encode, domain, range, null #XXX
    else
      new ConstantEncoder limit * clampNorm channel.value

encodeSize = encode_size VariableSizeChannel, SizeEncoder
encodeWidth = encode_size VariableWidthChannel, SizeEncoder
encodeHeight = encode_size VariableHeightChannel, SizeEncoder

#XXX Make this accept norm'd values for output ranges:
# 0 -> 0
# 1 -> 30
# 0.1? -> 8
# ...so that the default range is 0.1 - 1
# Apply clampNorm() to all inputs.
encodeArea = (frame, channel) ->
  if channel instanceof VariableSizeChannel
    vector = head frame.evaluate channel.field
    if vector instanceof Factor
      throw new Error "Could not encode size. Vector [#{vector.label}] is a Factor."
    domain = new SequentialRange vector.domain.min, vector.domain.max
    range = if channel.range
      new SequentialRange (sq channel.range.min), (sq channel.range.max)
    else
      channel.range = new SequentialRange (sq defaultSize), (sq 30)
    scale = createLinearScale domain, range 
    at = vector.at
    encode = (i) -> scale at i
    new SizeEncoder vector.label, encode, vector, domain, range, null #XXX
  else
    new ConstantEncoder sq channel.value

encodeLineWidth = (frame, channel) ->
  if channel instanceof VariableLineWidthChannel
    vector = head frame.evaluate channel.field
    if vector instanceof Factor
      throw new Error "Could not encode lineWidth. Vector [#{vector.label}] is a Factor."
    domain = new SequentialRange vector.domain.min, vector.domain.max
    range = if channel.range
      new SequentialRange channel.range.min, channel.range.max
    else
      channel.range = new SequentialRange 1.5, 15
    scale = createLinearScale domain, range 
    at = vector.at
    encode = (i) -> scale at i
    new SizeEncoder vector.label, encode, vector, domain, range, null #XXX
  else
    new ConstantEncoder channel.value

encodeShape = (frame, channel) ->
  if channel instanceof VariableShapeChannel
    vector = head frame.evaluate channel.field
    unless vector instanceof Factor
      throw new Error "Could not encode shape. Vector [#{vector.label}] is not a Factor." 
    unless channel.range
      channel.range = new CategoricalRange pickCategoricalShapePalette vector.domain.length 
    scale = createCategoricalScale vector.domain, channel.range
    at = vector.at
    encode = (i) -> Shapes[ scale at i ]
    new ShapeEncoder vector.label, encode, vector, vector.domain, channel.range, null #XXX
  else
    #REVIEW: throw error or switch to circle?
    new ConstantEncoder Shapes[channel.value] or Shapes.circle

encodeTooltip = (frame, channel) ->
  if channel
    vectors = for field in channel.fields
      head frame.evaluate field
    new TooltipEncoder vectors
  else
    undefined

#
# Rendering Functions
# ==============================
#

initFill = (fillColor, fillOpacity) ->
  [
    fillColor ? new ConstantFillColorChannel chroma head ColorPalettes.c10
    fillOpacity ? new ConstantFillOpacityChannel 1
  ]

initStroke = (strokeColor, strokeOpacity, lineWidth) ->
  [
    strokeColor ? new ConstantStrokeColorChannel chroma head ColorPalettes.c10
    strokeOpacity ? new ConstantStrokeOpacityChannel 1
    lineWidth ? new ConstantLineWidthChannel 1.5
  ]

initFillAndStroke = (fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, forceFill, forceStroke) ->

  hasFill = fillColor or fillOpacity
  hasStroke = strokeColor or strokeOpacity or lineWidth

  unless hasFill or hasStroke
    hasFill = yes if forceFill
    hasStroke = yes if forceStroke

  if hasFill
    [ fillColor, fillOpacity ] = initFill fillColor, fillOpacity

  if hasStroke
    [ strokeColor, strokeOpacity, lineWidth ] = initStroke strokeColor, strokeOpacity, lineWidth

  [ fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth ]

encodeFill = (frame, mark) ->
  if mark.fillColor or mark.fillOpacity
    [
      fillColor = encodeColor frame, mark.fillColor
      fillOpacity = encodeOpacity frame, mark.fillOpacity
      encodeStyle fillColor, fillOpacity
    ]
  else
    []

encodeStroke = (frame, mark) ->
  if mark.strokeColor or mark.strokeOpacity or mark.lineWidth
    [
      strokeColor = encodeColor frame, mark.strokeColor
      strokeOpacity = encodeOpacity frame, mark.strokeOpacity
      encodeStyle strokeColor, strokeOpacity
      encodeLineWidth frame, mark.lineWidth
    ]
  else
    []

clipRect = (g, x, y, w, h) ->
  g.beginPath()
  g.rect x, y, w, h
  g.clip()

doStroke = (g, style, lineWidth) ->
  g.lineWidth = lineWidth
  g.strokeStyle = style
  g.stroke()

doFill = (g, style) ->
  g.fillStyle = style
  g.fill()

doLine = (g, x1, y1, x2, y2) ->
  g.beginPath()
  g.moveTo x1, y1
  g.lineTo x2, y2
  g.stroke()

doRectY = (g, x, y1, y2, w) ->
  g.beginPath()
  if y2 > y1
    g.rect (x - w/2), y1, w, y2 - y1 
  else
    g.rect (x - w/2), y2, w, y1 - y2 
  g.closePath()

doRectX = (g, x1, x2, y, h) ->
  g.beginPath()
  if x2 > x1
    g.rect x1, (y - h/2), (x2 - x1), h
  else
    g.rect x2, (y - h/2), (x1 - x2), h
  g.closePath()

doSchemaX = (g, q0, q1, q2, q3, qn, y, h, s, lw) ->
  if q0 isnt undefined and
    q1 isnt undefined and
    q2 isnt undefined and
    q3 isnt undefined and
    qn isnt undefined and
    y isnt undefined and
    h isnt undefined and 
    s isnt undefined and
    lw isnt undefined

      g.strokeStyle = s
      g.lineWidth = lw
      doRectX g, q1, q3, y, h
      g.stroke()
      h2 = h/2
      h4 = h/4
      doLine g, q2, y - h2, q2, y + h2 # median
      doLine g, q1, y, q0, y # lower whisker
      doLine g, q3, y, qn, y # upper whisker
      doLine g, q0, y - h4, q0, y + h4 # lower fence
      doLine g, qn, y - h4, qn, y + h4 # upper fence

doSchemaY = (g, x, q0, q1, q2, q3, qn, w, s, lw) ->
  if x isnt undefined and
    q0 isnt undefined and
    q1 isnt undefined and
    q2 isnt undefined and
    q3 isnt undefined and
    qn isnt undefined and
    w isnt undefined and 
    s isnt undefined and
    lw isnt undefined

      g.strokeStyle = s
      g.lineWidth = lw
      doRectY g, x, q1, q3, w
      g.stroke()
      w2 = w/2
      w4 = w/4
      doLine g, x - w2, q2, x + w2, q2 # median
      doLine g, x, q1, x, q0 # lower whisker
      doLine g, x, q3, x, qn # upper whisker
      doLine g, x - w4, q0, x + w4, q0 # lower fence
      doLine g, x - w4, qn, x + w4, qn # upper fence

#
# Point Rendering
# ==============================
#
createPointMark = (expr, vectors) ->
  [ positionX, positionY ] = vectors
  space = new Space2D [ positionX ], [ positionY ]
  shape = expr.shape ? new ConstantShapeChannel 'circle'
  size = expr.size ? new ConstantSizeChannel defaultSize
  [ fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth ] = initFillAndStroke expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, no, yes
  new PointMark space, positionX, positionY, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip

encodePointMark = (frame, mark, axisX, axisY) ->
  positionX = encodePosition axisX, mark.positionX
  positionY = encodePosition axisY, mark.positionY

  shape = encodeShape frame, mark.shape
  size = encodeArea frame, mark.size

  [ fillColor, fillOpacity, fill ] = encodeFill frame, mark
  [ strokeColor, strokeOpacity, stroke, lineWidth ] = encodeStroke frame, mark

  tooltip = encodeTooltip frame, mark.tooltip

  new PointEncoding positionX, positionY, shape, size, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip


highlightPointMarks = (indices, encoders, g) ->
  { positionX, positionY, shape, size, fill, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x = positionX i
    y = positionY i
    if x isnt undefined and y isnt undefined
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
    if x isnt undefined and y isnt undefined
      (shape i) g, x, y, size i
      if stroke
        g.lineWidth = lineWidth i
        g.stroke()
      if fill
        g.fill()
  g.restore()

maskPointMarks = (indices, encoders, g, mask) ->
  { positionX, positionY, shape, size, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x = positionX i
    y = positionY i

    if x isnt undefined and y isnt undefined
      maskStyle = mask.put i
      (shape i) g, x, y, size i
      g.fillStyle = maskStyle
      g.fill()
      if stroke
        g.lineWidth = lineWidth i
        g.strokeStyle = maskStyle
        g.stroke()
  g.restore()

renderPointMarks = (indices, encoders, g) ->
  { positionX, positionY, shape, size, fill, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x = positionX i
    y = positionY i

    if x isnt undefined and y isnt undefined
      (shape i) g, x, y, size i

      if stroke
        g.lineWidth = lineWidth i
        g.strokeStyle = stroke i
        g.stroke()

      if fill
        g.fillStyle = fill i
        g.fill()

  g.restore()

# TODO Naive, need some kind of memoization during rendering.
selectMarks = (indices, encoders, xmin, ymin, xmax, ymax) ->
  { positionX, positionY } = encoders

  selectedIndices = []

  for i in indices
    x = positionX i
    y = positionY i
    if x isnt undefined and y isnt undefined and xmin <= x <= xmax and ymin <= y <= ymax
      selectedIndices.push i

  selectedIndices

#
# Col Rendering
# ==============================
#

structureOf = (vectors) ->
  join (map vectors, (vector) -> vector.type), ', '

createRectMark = (expr, vectors) ->
  structure = structureOf vectors
  switch structure
    when 'String, Number'
      [ positionX, positionY2 ] = vectors
      space = new Space2D [ positionX ], [ positionY2 ]
      width = expr.width ? new ConstantWidthChannel 0.8
      [ fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth ] = initFillAndStroke expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, yes, no
      new ColMark space, positionX, undefined, positionY2, width, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip

    when 'String, Number, Number'
      [ positionX, positionY1, positionY2 ] = vectors
      space = new Space2D [ positionX ], [ positionY1, positionY2 ]
      width = expr.width ? new ConstantWidthChannel 0.8
      [ fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth ] = initFillAndStroke expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, yes, no
      new ColMark space, positionX, positionY1, positionY2, width, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip

    when 'Number, String'
      [ positionX2, positionY ] = vectors
      space = new Space2D [ positionX2 ], [ positionY ]
      height = expr.height ? new ConstantHeightChannel 0.8
      [ fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth ] = initFillAndStroke expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, yes, no
      new BarMark space, undefined, positionX2, positionY, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip

    when 'Number, Number, String'
      [ positionX1, positionX2, positionY ] = vectors
      space = new Space2D [ positionX1, positionX2 ], [ positionY ]
      height = expr.height ? new ConstantHeightChannel 0.8
      [ fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth ] = initFillAndStroke expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, yes, no
      new BarMark space, positionX1, positionX2, positionY, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip

    else
      throw new Error "Cannot create rect marks with vectors of type [#{structure}]"


encodeColMark = (frame, mark, axisX, axisY) ->
  positionX = encodePosition axisX, mark.positionX
  positionY1 = if mark.positionY1 then encodePosition axisY, mark.positionY1 else encodeConstantPosition axisY, 0
  positionY2 = encodePosition axisY, mark.positionY2

  width = encodeSize frame, mark.width, axisX.rect.width / axisX.domain.length

  [ fillColor, fillOpacity, fill ] = encodeFill frame, mark
  [ strokeColor, strokeOpacity, stroke, lineWidth ] = encodeStroke frame, mark

  tooltip = encodeTooltip frame, mark.tooltip

  new ColEncoding positionX, positionY1, positionY2, width, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip

encodeBarMark = (frame, mark, axisX, axisY) ->
  switch mark.space.x.length
    when 1
      [ x2 ] = mark.space.x
      positionX1 = encodeConstantPosition axisX, 0
      positionX2 = encodePosition axisX, x2
    else #2
      [ x1, x2 ] = mark.space.x
      positionX1 = encodePosition axisX, x1
      positionX2 = encodePosition axisX, x2

  [ y ] = mark.space.y
  positionY = encodePosition axisY, y

  height = encodeSize frame, mark.height, axisY.rect.height / axisY.domain.length

  [ fillColor, fillOpacity, fill ] = encodeFill frame, mark
  [ strokeColor, strokeOpacity, stroke, lineWidth ] = encodeStroke frame, mark

  tooltip = encodeTooltip frame, mark.tooltip

  new BarEncoding positionX1, positionX2, positionY, height, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip

highlightColMarks = (indices, encoders, g) ->
  { positionX, positionY1, positionY2, width, fill, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x = positionX i
    y1 = positionY1 i
    y2 = positionY2 i
    w = width i
    if x isnt undefined and y1 isnt undefined and y2 isnt undefined and w isnt undefined
      doRectY g, x, y1, y2, w
      g.lineWidth = 2 + if stroke then lineWidth i else 1
      g.stroke()
  g.restore()

  g.save()
  g.globalCompositeOperation = 'destination-out'
  g.fillStyle = g.strokeStyle = 'black'
  for i in indices
    x = positionX i
    y1 = positionY1 i
    y2 = positionY2 i
    w = width i
    if x isnt undefined and y1 isnt undefined and y2 isnt undefined and w isnt undefined
      doRectY g, x, y1, y2, w
      if stroke
        g.lineWidth = lineWidth i
        g.stroke()
      g.fill() if fill
  g.restore()

highlightBarMarks = (indices, encoders, g) ->
  { positionX1, positionX2, positionY, height, fill, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x1 = positionX1 i
    x2 = positionX2 i
    y = positionY i
    h = height i
    if x1 isnt undefined and x2 isnt undefined and y isnt undefined and h isnt undefined
      doRectX g, x1, x2, y, h
      g.lineWidth = 2 + if stroke then lineWidth i else 1
      g.stroke()
  g.restore()

  g.save()
  g.globalCompositeOperation = 'destination-out'
  g.fillStyle = g.strokeStyle = 'black'
  for i in indices
    x1 = positionX1 i
    x2 = positionX2 i
    y = positionY i
    h = height i
    if x1 isnt undefined and x2 isnt undefined and y isnt undefined and h isnt undefined
      doRectX g, x1, x2, y, h
      if stroke
        g.lineWidth = lineWidth i
        g.stroke()
      g.fill() if fill
  g.restore()


maskColMarks = (indices, encoders, g, mask) ->
  { positionX, positionY1, positionY2, width, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x = positionX i
    y1 = positionY1 i
    y2 = positionY2 i
    w = width i

    if x isnt undefined and y1 isnt undefined and y2 isnt undefined and w isnt undefined
      maskStyle = mask.put i
      doRectY g, x, y1, y2, w
      doFill g, maskStyle
      doStroke g, maskStyle, lineWidth i if stroke
  g.restore()

maskBarMarks = (indices, encoders, g, mask) ->
  { positionX1, positionX2, positionY, height, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x1 = positionX1 i
    x2 = positionX2 i
    y = positionY i
    h = height i
    if x1 isnt undefined and x2 isnt undefined and y isnt undefined and h isnt undefined
      maskStyle = mask.put i
      doRectX g, x1, x2, y, h
      doFill g, maskStyle
      doStroke g, maskStyle, lineWidth i if stroke
  g.restore()


renderColMarks = (indices, encoders, g) ->
  { positionX, positionY1, positionY2, width, fill, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x = positionX i
    y1 = positionY1 i
    y2 = positionY2 i
    w = width i

    if x isnt undefined and y1 isnt undefined and y2 isnt undefined and w isnt undefined
      doRectY g, x, y1, y2, w
      doStroke g, (stroke i), (lineWidth i) if stroke
      doFill g, fill i if fill

  g.restore()

renderBarMarks = (indices, encoders, g) ->
  { positionX1, positionX2, positionY, height, fill, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    x1 = positionX1 i
    x2 = positionX2 i
    y = positionY i
    h = height i

    if x1 isnt undefined and x2 isnt undefined and y isnt undefined and h isnt undefined
      doRectX g, x1, x2, y, h
      doStroke g, (stroke i), (lineWidth i) if stroke
      doFill g, fill i if fill

  g.restore()


# TODO Naive, need some kind of memoization during rendering.
selectColMarks = (indices, encoders, xmin, ymin, xmax, ymax) ->
  { positionX, positionY1, positionY2, width } = encoders

  selectedIndices = []

  for i in indices
    x = positionX i
    y1 = positionY1 i
    y2 = positionY2 i

    if y1 > y2
      yt = y1
      y1 = y2
      y2 = yt 

    w = width i
    if x isnt undefined and y1 isnt undefined and y2 isnt undefined and w isnt undefined
      x1 = x - w/2
      x2 = x + w/2

      unless xmin > x2 or xmax < x1 or ymin > y2 or ymax < y1
        selectedIndices.push i

  selectedIndices

# TODO Naive, need some kind of memoization during rendering.
selectBarMarks = (indices, encoders, xmin, ymin, xmax, ymax) ->
  { positionX1, positionX2, positionY, height } = encoders

  selectedIndices = []

  for i in indices
    x1 = positionX1 i
    x2 = positionX2 i
    y = positionY i

    if x1 > x2
      xt = x1
      x1 = x2
      x2 = xt 

    h = height i
    if x1 isnt undefined and x2 isnt undefined and y isnt undefined and h isnt undefined
      y1 = y - h/2
      y2 = y + h/2

      unless xmin > x2 or xmax < x1 or ymin > y2 or ymax < y1
        selectedIndices.push i

  selectedIndices

#
# Schema Rendering
# ==============================
#
createSchemaMark = (expr, vectors) ->
  structure = structureOf vectors
  switch structure
    when 'String, Number, Number, Number, Number, Number'
      [ x, q0, q1, q2, q3, qn ] = vectors
      space = new Space2D [ x ], [ q0, q1, q2, q3, qn ]
      width = expr.width ? new ConstantWidthChannel 0.8
      [ strokeColor, strokeOpacity, lineWidth ] = initStroke expr.strokeColor, expr.strokeOpacity, expr.lineWidth
      new SchemaYMark space, x, q0, q1, q2, q3, qn, width, strokeColor, strokeOpacity, lineWidth, expr.tooltip

    when 'Number, Number, Number, Number, Number, String'
      [ q0, q1, q2, q3, qn, y ] = vectors
      space = new Space2D [ q0, q1, q2, q3, qn ], [ y ]
      height = expr.height ? new ConstantWidthChannel 0.8
      [ strokeColor, strokeOpacity, lineWidth ] = initStroke expr.strokeColor, expr.strokeOpacity, expr.lineWidth
      new SchemaXMark space, q0, q1, q2, q3, qn, y, height, strokeColor, strokeOpacity, lineWidth, expr.tooltip

encodeSchemaXMark = (frame, mark, axisX, axisY) ->
  q0 = encodePosition axisX, mark.q0
  q1 = encodePosition axisX, mark.q1
  q2 = encodePosition axisX, mark.q2
  q3 = encodePosition axisX, mark.q3
  qn = encodePosition axisX, mark.qn
  y = encodePosition axisY, mark.positionY

  height = encodeSize frame, mark.height, axisY.rect.height / axisY.domain.length

  [ strokeColor, strokeOpacity, stroke, lineWidth ] = encodeStroke frame, mark

  tooltip = encodeTooltip frame, mark.tooltip

  new SchemaXEncoding q0, q1, q2, q3, qn, y, height, stroke, strokeColor, strokeOpacity, lineWidth, tooltip

highlightSchemaXMarks = (indices, encoders, g) ->
  { positionY, q0, q1, q2, q3, qn, height, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    doSchemaX(
      g
      q0 i
      q1 i
      q2 i
      q3 i
      qn i
      positionY i
      height i
      stroke i
      2 + if stroke then lineWidth i else 1
    )
  g.restore()

  g.save()
  g.globalCompositeOperation = 'destination-out'
  g.strokeStyle = 'black'
  for i in indices
    doSchemaX(
      g
      q0 i
      q1 i
      q2 i
      q3 i
      qn i
      positionY i
      height i
      stroke i
      lineWidth i
    )
  g.restore()

maskSchemaXMarks = (indices, encoders, g, mask) ->
  { positionY, q0, q1, q2, q3, qn, height, stroke, lineWidth } = encoders
  g.save()
  for i in indices
    x1 = q0 i
    x2 = qn i
    y = positionY i
    h = height i

    if x1 isnt undefined and x2 isnt undefined and y isnt undefined and h isnt undefined
      maskStyle = mask.put i
      doRectX g, x1, x2, y, h
      doFill g, maskStyle
      doStroke g, maskStyle, lineWidth i
  g.restore()

renderSchemaXMarks = (indices, encoders, g) ->
  { positionY, q0, q1, q2, q3, qn, height, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    doSchemaX(
      g
      q0 i
      q1 i
      q2 i
      q3 i
      qn i
      positionY i
      height i
      stroke i
      lineWidth i
    )
  g.restore()

# TODO Naive, need some kind of memoization during rendering.
selectSchemaXMarks = (indices, encoders, xmin, ymin, xmax, ymax) ->
  { positionY, q0, q1, q2, q3, qn, height, stroke, lineWidth } = encoders

  selectedIndices = []

  for i in indices
    x1 = q0 i
    x2 = qn i
    y = positionY i

    if x1 > x2
      xt = x1
      x1 = x2
      x2 = xt 

    h = height i
    if x1 isnt undefined and x2 isnt undefined and y isnt undefined and h isnt undefined
      y1 = y - h/2
      y2 = y + h/2

      unless xmin > x2 or xmax < x1 or ymin > y2 or ymax < y1
        selectedIndices.push i

  selectedIndices

encodeSchemaYMark = (frame, mark, axisX, axisY) ->
  x = encodePosition axisX, mark.positionX
  q0 = encodePosition axisY, mark.q0
  q1 = encodePosition axisY, mark.q1
  q2 = encodePosition axisY, mark.q2
  q3 = encodePosition axisY, mark.q3
  qn = encodePosition axisY, mark.qn

  width = encodeSize frame, mark.width, axisX.rect.width / axisX.domain.length

  [ strokeColor, strokeOpacity, stroke, lineWidth ] = encodeStroke frame, mark

  tooltip = encodeTooltip frame, mark.tooltip

  new SchemaYEncoding x, q0, q1, q2, q3, qn, width, stroke, strokeColor, strokeOpacity, lineWidth, tooltip

highlightSchemaYMarks = (indices, encoders, g) ->
  { positionX, q0, q1, q2, q3, qn, width, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    doSchemaY(
      g
      positionX i
      q0 i
      q1 i
      q2 i
      q3 i
      qn i
      width i
      stroke i
      2 + if stroke then lineWidth i else 1
    )
  g.restore()

  g.save()
  g.globalCompositeOperation = 'destination-out'
  g.strokeStyle = 'black'
  for i in indices
    doSchemaY(
      g
      positionX i
      q0 i
      q1 i
      q2 i
      q3 i
      qn i
      width i
      stroke i
      lineWidth i
    )
  g.restore()

maskSchemaYMarks = (indices, encoders, g, mask) ->
  { positionX, q0, q1, q2, q3, qn, width, stroke, lineWidth } = encoders
  g.save()
  for i in indices
    x = positionX i
    y1 = q0 i
    y2 = qn i
    w = width i

    if x isnt undefined and y1 isnt undefined and y2 isnt undefined and w isnt undefined
      maskStyle = mask.put i
      doRectY g, x, y1, y2, w
      doFill g, maskStyle
      doStroke g, maskStyle, lineWidth i
  g.restore()

renderSchemaYMarks = (indices, encoders, g) ->
  { positionX, q0, q1, q2, q3, qn, width, stroke, lineWidth } = encoders

  g.save()
  for i in indices
    doSchemaY(
      g
      positionX i
      q0 i
      q1 i
      q2 i
      q3 i
      qn i
      width i
      stroke i
      lineWidth i
    )
  g.restore()

# TODO Naive, need some kind of memoization during rendering.
selectSchemaYMarks = (indices, encoders, xmin, ymin, xmax, ymax) ->
  { positionX, q0, q1, q2, q3, qn, width, stroke, lineWidth } = encoders

  selectedIndices = []

  for i in indices
    x = positionX i
    y1 = q0 i
    y2 = qn i

    if y1 > y2
      yt = y1
      y1 = y2
      y2 = yt 

    w = width i
    if x isnt undefined and y1 isnt undefined and y2 isnt undefined and w isnt undefined
      x1 = x - w/2
      x2 = x + w/2

      unless xmin > x2 or xmax < x1 or ymin > y2 or ymax < y1
        selectedIndices.push i

  selectedIndices

#
# Path Rendering
# ==============================
#
createPathMark = (expr, vectors) ->
  [ positionX, positionY ] = vectors
  space = new Space2D [ positionX ], [ positionY ]
  [ strokeColor, strokeOpacity, lineWidth ] = initStroke expr.strokeColor, expr.strokeOpacity, expr.lineWidth
  new PathMark space, positionX, positionY, strokeColor, strokeOpacity, lineWidth, expr.tooltip

encodePathMark = (frame, mark, axisX, axisY) ->
  positionX = encodePosition axisX, mark.positionX
  positionY = encodePosition axisY, mark.positionY

  [ strokeColor, strokeOpacity, stroke, lineWidth ] = encodeStroke frame, mark

  tooltip = encodeTooltip frame, mark.tooltip

  new PathEncoding positionX, positionY, stroke, strokeColor, strokeOpacity, lineWidth, tooltip

highlightPathMarks = (indices, encoders, g) ->
  { positionX, positionY } = encoders

  g.save()
  for i in indices
    x = positionX i
    y = positionY i

    g.lineWidth = 1.5
    g.strokeStyle = 'black'
    if x isnt undefined and y isnt undefined
      drawCircle g, x, y, 64
      g.stroke()

  g.restore()

maskPathMarks = (indices, encoders, g, mask) ->
  { positionX, positionY } = encoders

  g.save()
  for i in indices
    x = positionX i
    y = positionY i

    if x isnt undefined and y isnt undefined
      drawCircle g, x, y, 64
      g.fillStyle = mask.put i
      g.fill()
  g.restore()

renderPathMarks = (indices, encoders, g) ->
  { positionX, positionY, stroke, lineWidth } = encoders

  if stroke instanceof ConstantEncoder and lineWidth instanceof ConstantEncoder
    # Fast-pass: no stroke/lineWidth variations, so draw polylines.
    g.strokeStyle = stroke()
    g.lineWidth = lineWidth()

    g.save()
    _inPath = no
    for i in indices
      x = positionX i
      y = positionY i

      if x isnt undefined and y isnt undefined
        if _inPath
          g.lineTo x, y
        else
          g.beginPath()
          _inPath = yes
          g.moveTo x, y
      else
        if _inPath
          g.stroke()
        _inPath = no

    g.restore()
  else
    g.save()
    g.lineCap = 'round'
    _inPath = no
    x1 = undefined
    y1 = undefined
    stroke1 = undefined
    for i in indices
      x2 = positionX i
      y2 = positionY i
      if x2 isnt undefined and y2 isnt undefined
        stroke2 = stroke i
        if _inPath
          if stroke2 isnt stroke1
            gradient = g.createLinearGradient x1, y1, x2, y2
            gradient.addColorStop 0, stroke1 or Transparent
            gradient.addColorStop 1, stroke2 or Transparent
            g.strokeStyle = gradient
          else
            g.strokeStyle = stroke2
          g.lineWidth = lineWidth i
          g.beginPath()
          g.moveTo x1, y1
          g.lineTo x2, y2
          g.stroke()

        _inPath = yes
        x1 = x2
        y1 = y2
        stroke1 = stroke2
      else
        _inPath = no

    g.restore()

#
# Geometries
# ==============================
#

createMark = dispatch(
  [ PointExpr, Array, createPointMark ]
  [ PathExpr, Array, createPathMark ]
  [ RectExpr, Array, createRectMark ]
  [ SchemaExpr, Array, createSchemaMark ]
)

PointGeometry = new Geometry(
  encodePointMark
  maskPointMarks
  highlightPointMarks
  renderPointMarks
  selectMarks
)

PathGeometry = new Geometry(
  encodePathMark
  maskPathMarks
  highlightPathMarks
  renderPathMarks
  selectMarks
)

ColGeometry = new Geometry(
  encodeColMark
  maskColMarks
  highlightColMarks
  renderColMarks
  selectColMarks
)

BarGeometry = new Geometry(
  encodeBarMark
  maskBarMarks
  highlightBarMarks
  renderBarMarks
  selectBarMarks
)

SchemaXGeometry = new Geometry(
  encodeSchemaXMark
  maskSchemaXMarks
  highlightSchemaXMarks
  renderSchemaXMarks
  selectSchemaXMarks
)

SchemaYGeometry = new Geometry(
  encodeSchemaYMark
  maskSchemaYMarks
  highlightSchemaYMarks
  renderSchemaYMarks
  selectSchemaYMarks
)

# Visualization operators
# ==============================

plot_bounds = dispatch(
  [ Number, null, (width, height) -> new Bounds width, undefined ]
  [ null, Number, (width, height) -> new Bounds undefined, height ]
  [ Number, Number, (width, height) -> new Bounds width, height ]
  [ null, null, -> new Bounds undefined, undefined ]
)

plot_from = dispatch(
  [ Frame, identity ]
  [ Function, (read) -> new Datasource read ]
)

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

collectFields = (args) ->
  for arg in args
    if arg instanceof Field
      arg
    else if TString is (type = typeOf arg)
      new Field arg
    else
      throw new Error "Cannot create vector reference from [#{arg}] of type [#{type}]."

plot_position = (args...) ->
  new PositionChannel (new CoordChannel field for field in collectFields args)

#TODO dispatching is a clone of strokeColor
plot_fillColor = dispatch(
  [ StringValue, (value) -> new ConstantFillColorChannel chroma value.value ]
  [ String, (name) -> new VariableFillColorChannel new Field name ]
  [ Field, (field) -> new VariableFillColorChannel field ]
  [ String, ColorRange, (name, range) -> new VariableFillColorChannel (new Field name), range ]
  [ Field, ColorRange, (field, range) -> new VariableFillColorChannel field, range ]
  [ String, CategoricalRange, (name, range) -> new VariableFillColorChannel (new Field name), range ]
  [ Field, CategoricalRange, (field, range) -> new VariableFillColorChannel field, range ]
)

#TODO wire through dispatch_numeric
plot_fillOpacity = dispatch(
  [ NumberValue, (value) -> new ConstantFillOpacityChannel value.value ]
  [ String, (name) -> new VariableFillOpacityChannel new Field name ]
  [ Field, (field) -> new VariableFillOpacityChannel field ]
  [ String, SequentialRange, (name, range) -> new VariableFillOpacityChannel (new Field name), range ]
  [ Field, SequentialRange, (field, range) -> new VariableFillOpacityChannel field, range ]
)

#TODO dispatching is a clone of fillColor
plot_strokeColor = dispatch(
  [ StringValue, (value) -> new ConstantStrokeColorChannel chroma value.value ]
  [ String, (name) -> new VariableStrokeColorChannel new Field name ]
  [ Field, (field) -> new VariableStrokeColorChannel field ]
  [ String, ColorRange, (name, range) -> new VariableStrokeColorChannel (new Field name), range ]
  [ Field, ColorRange, (field, range) -> new VariableStrokeColorChannel field, range ]
  [ String, CategoricalRange, (name, range) -> new VariableStrokeColorChannel (new Field name), range ]
  [ Field, CategoricalRange, (field, range) -> new VariableStrokeColorChannel field, range ]
)

#TODO wire through dispatch_numeric
plot_strokeOpacity = dispatch(
  [ NumberValue, (value) -> new ConstantStrokeOpacityChannel value.value ]
  [ String, (name) -> new VariableStrokeOpacityChannel new Field name ]
  [ Field, (field) -> new VariableStrokeOpacityChannel field ]
  [ String, SequentialRange, (name, range) -> new VariableStrokeOpacityChannel (new Field name), range ]
  [ Field, SequentialRange, (field, range) -> new VariableStrokeOpacityChannel field, range ]
)

dispatch_numeric = (constChannelClass, variableChannelClass) ->
  dispatch(
    [ NumberValue, (value) -> new constChannelClass value.value ]
    [ String, (name) -> new variableChannelClass new Field name ]
    [ Field, (field) -> new variableChannelClass field ]
    [ String, SequentialRange, (name, range) -> new variableChannelClass (new Field name), range ]
    [ Field, SequentialRange, (field, range) -> new variableChannelClass field, range ]
  )

plot_size = dispatch_numeric ConstantSizeChannel, VariableSizeChannel
plot_width = dispatch_numeric ConstantWidthChannel, VariableWidthChannel
plot_height = dispatch_numeric ConstantHeightChannel, VariableHeightChannel

#TODO wire through dispatch_numeric
plot_lineWidth = dispatch(
  [ NumberValue, (value) -> new ConstantLineWidthChannel value.value ]
  [ String, (name) -> new VariableLineWidthChannel new Field name ]
  [ Field, (field) -> new VariableLineWidthChannel field ]
  [ String, SequentialRange, (name, range) -> new VariableLineWidthChannel (new Field name), range ]
  [ Field, SequentialRange, (field, range) -> new VariableLineWidthChannel field, range ]
)

plot_shape = dispatch(
  [ StringValue, (value) -> new ConstantShapeChannel value.value ]
  [ String, (name) -> new VariableShapeChannel new Field name ]
  [ Field, (field) -> new VariableShapeChannel field ]
  [ String, CategoricalRange, (name, range) -> new VariableShapeChannel (new Field name), range ]
  [ Field, CategoricalRange, (field, range) -> new VariableShapeChannel field, range ]
)

plot_tooltip = (args...) ->
  new VariableTooltipChannel collectFields args

plot_table = (args...) ->
  new TableExpr collectFields args

plot_record = (index=0) ->
  new RecordExpr index

configureSchema = (schema) ->
  for label, obj of schema
    if _.isString obj
      switch obj
        when 'string'
          label: label
          type: 'String'
          domain: []
          parse: asString

        when 'int'
          label: label
          type: 'Number'
          parse: asInt

        when 'real'
          label: label
          type: 'Number'
          parse: asReal

        #
        #TODO dates
        #
        else
          throw new Error "Invalid type #{obj} for schema field #{label}"

    else if _.isArray obj
      label: label
      type: 'String'
      domain: obj
      parse: asString

    else
      throw new Error "Invalid type #{obj} for schema field #{label}"

readCsvAsFrame = (label, columns, data, hasHeader) ->
  result = Papa.parse data,
    skipEmptyLines: yes
  rows = result.data
  debug rows
  shift rows if hasHeader

  vectors = for column, offset in columns
    data = new Array rows.length
    for row, index in rows
      if undefined isnt value = column.parse row[offset]
        data[index] = value

    switch column.type
      when 'String'
        plot.createFactor(
          column.label   
          column.type
          data
          column.domain
        )
      when 'Number'
        plot.createVector(
          column.label
          column.type
          data
          _.identity #TODO
        )
      #TODO Date

  createFrame label, vectors, _.range rows.length

plot_remote = (url) -> (go) ->
  download 'json', "#{url}.json", (error, descriptor) ->
    if error
      go error
    else
      switch descriptor.format
        when 'csv'
          download 'text', descriptor.location, (error, data) ->
            if error
              go error
            else
              try
                go null, readCsvAsFrame descriptor.name, (configureSchema descriptor.schema), data, if descriptor.header then yes else no
              catch error
                go error
        else
          go new Error "Unsupported format [#{descriptor.format}]"

# Geom expressions
# ==============================

plot_point = (ops...) ->
  position = findByType ops, PositionChannel

  shape = findByType ops, ShapeChannel
  size = findByType ops, SizeChannel

  fillColor = findByType ops, FillColorChannel
  fillOpacity = findByType ops, FillOpacityChannel

  strokeColor = findByType ops, StrokeColorChannel
  strokeOpacity = findByType ops, StrokeOpacityChannel
  lineWidth = findByType ops, LineWidthChannel

  tooltip = findByType ops, TooltipChannel

  new PointExpr position, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, tooltip

plot_rect = (ops...) ->
  position = findByType ops, PositionChannel
  
  width = findByType ops, WidthChannel #XXX ?
  height = findByType ops, HeightChannel #XXX ?

  fillColor = findByType ops, FillColorChannel
  fillOpacity = findByType ops, FillOpacityChannel

  strokeColor = findByType ops, StrokeColorChannel
  strokeOpacity = findByType ops, StrokeOpacityChannel
  lineWidth = findByType ops, LineWidthChannel

  tooltip = findByType ops, TooltipChannel

  new RectExpr position, width, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, tooltip

plot_path = (ops...) ->
  position = findByType ops, PositionChannel

  strokeColor = findByType ops, StrokeColorChannel
  strokeOpacity = findByType ops, StrokeOpacityChannel
  lineWidth = findByType ops, LineWidthChannel

  tooltip = findByType ops, TooltipChannel

  new PathExpr position, strokeColor, strokeOpacity, lineWidth, tooltip

plot_schema = (ops...) ->
  position = findByType ops, PositionChannel

  #XXX Can simplify using a single size parameter
  width = findByType ops, WidthChannel #XXX ?
  height = findByType ops, HeightChannel #XXX ?

  strokeColor = findByType ops, StrokeColorChannel
  strokeOpacity = findByType ops, StrokeOpacityChannel
  lineWidth = findByType ops, LineWidthChannel

  tooltip = findByType ops, TooltipChannel

  new SchemaExpr position, width, height, strokeColor, strokeOpacity, lineWidth, tooltip

# Expression parsing
# ==============================

plot_parse = (esprima, escodegen) ->
  traverse = (node, f) ->
    if isArray node
      i = node.length
      while i--
        child = node[i]
        if child isnt null and isObject child
          traverse child, f
          f child
    else
      for own i, child of node
        if child isnt null and isObject child
          traverse child, f
          f child

  (js) ->
    ast = esprima.parse js
    traverse ast, (node) ->
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
      else if node.type is 'Identifier'
        if isFunction plot[name = node.name]
          delete node.name
          node.type = 'MemberExpression'
          node.computed = no
          node.object =
            type: 'Identifier'
            name: 'plot'
          node.property =
            type: 'Identifier'
            name: name
      return
    escodegen.generate ast

#
# DOM Operations
# ==============================
#

plot_defaults =
  maxCanvasSize: new Size 795, 600
  visualizationSize: new Size 300, 300
  axisLabelFont: '10px monospace'
  axisTickColor: '#4d4d4d'
  axisTitleFont: 'bold 10px monospace'
  axisLabelColor: '#4d4d4d'
  gridLineColor: '#eee'

px = (pixels) -> "#{round pixels}px"

createDOMElement = (tag, styles) ->
  el = document.createElement tag
  style = el.style
  for name, value of styles
    style[name] = value
  el

removeDOMChildren = (el) ->
  while child = el.firstChild
    el.removeChild child
  return

createStylesheet = (styles) ->
  sheet = for selector, style of styles
    lines = for property, value of style
      "#{property}:#{value}"
    "#{selector}{#{join lines, ';'};}"

  el = document.createElement 'style'
  el.type = 'text/css'
  el.innerHTML = join sheet, '\n'
  headEl = head document.getElementsByTagName 'head'
  headEl.appendChild el
  return

createTooltipTable = (dict) ->
  table = document.createElement 'table'
  table.appendChild tbody = document.createElement 'tbody'
  for label, value of dict
    tbody.appendChild tr = document.createElement 'tr'
    
    tr.appendChild td = document.createElement 'td'
    td.appendChild document.createTextNode "#{label}:"

    tr.appendChild th = document.createElement 'th'
    th.appendChild document.createTextNode value

  table

createCanvas = (bounds) ->
  { width, height } = bounds

  element = document.createElement 'canvas'
  context = element.getContext '2d' 

  dpr = window.devicePixelRatio or 1
  bspr = context.webkitBackingStorePixelRatio or 
    context.mozBackingStorePixelRatio or 
    context.msBackingStorePixelRatio or 
    context.oBackingStorePixelRatio or 
    context.backingStorePixelRatio or 
    1 

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

createViewport = (box) ->
  [ baseCanvas, highlightCanvas, hoverCanvas, maskCanvas, clipCanvas ] = (createCanvas box for i in [ 1 .. 5 ])

  # Set position to 'relative'. This has two effects: 
  #  1. The canvases contained in it (which are set to position: absolute), overlap instead of flowing.
  #  2. Mouse events captured on the top-most canvas get reported with the offset relative to this container instead of the page.
  container = createDOMElement 'div',
    position: 'relative'
    overflow: 'visible' # Tooltips should be able to bleed out
    width: px box.width
    height: px box.height

  marquee = createDOMElement 'div',
    position: 'absolute'
    left: px 0
    top: px 0
    width: px 0
    height: px 0
    display: 'none'
    outline: '1px dotted #999'
    background: 'rgba(0, 0, 0, 0.05)'

  tooltip = createDOMElement 'div',
    position: 'absolute'
    left: px 0
    top: px 0
    'max-width': px 0.9 * box.width # set width to 90% of container width so that long tooltips wrap properly 
    display: 'none'

  tooltip.className = 'lightning-tooltip'

  container.appendChild baseCanvas.element
  container.appendChild highlightCanvas.element
  container.appendChild marquee
  container.appendChild hoverCanvas.element
  container.appendChild tooltip

  mask = createMask maskCanvas
  clip = createClip clipCanvas

  new Viewport(
    box
    container
    baseCanvas
    highlightCanvas
    hoverCanvas
    maskCanvas
    clipCanvas
    marquee
    tooltip
    mask
    clip
  )

# Fix for FF:
# jquery/FF does not report e.offsetX / e.offsetY, 
#   so retry with getBoundingClientRect().
getFFMouseCoords = (e) ->
  target = e.target ? e.srcElement
  rect = target.getBoundingClientRect()
  [ e.clientX - rect.left, e.clientY - rect.top ]

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

    unless x isnt undefined and y isnt undefined
      [ x, y ] = getFFMouseCoords e # FF patch

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

    unless x1 isnt undefined and y1 isnt undefined
      [ x1, y1 ] = getFFMouseCoords e # FF patch

    isDragging = yes
    marquee.display = 'block'
    marquee.left = px x1
    marquee.top = px y1
    $document.on 'mouseup', (e) ->
      e.preventDefault()
      { offsetX:x2, offsetY:y2 }  = e

      unless x2 isnt undefined and y2 isnt undefined
        [ x2, y2 ] = getFFMouseCoords e # FF patch

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

#
# Rendering
# ==============================
#

createEventDispatcher = ->
  _subscribersByEvent = {}
  subscribe = (event, subscriber) ->
    if subscribers = _subscribersByEvent[event]
      subscribers.push subscriber
    else
      _subscribersByEvent[event] = [ subscriber ]

  unsubscribe = (_event, _subscriber) ->
    if _event
      if _subscriber
        subscribers = _subscribersByEvent[_event]
        if subscribers
          for subscriber, i in subscribers when subscriber is _subscriber
            splice subscribers, i, 1
            break
      else
        delete _subscribersByEvent[_event]
    return

  dispatch = (event, args...) ->
    if subscribers = _subscribersByEvent[event]
      for subscriber in subscribers
        apply subscriber, null, args
    return

  [ subscribe, unsubscribe, dispatch ]

createVisualization = (_box, _frame, _layers, _axisX, _axisY, _dispatch) ->
  _viewport = createViewport _box

  { baseCanvas, highlightCanvas, hoverCanvas, clipCanvas, maskCanvas, marquee, tooltip, mask, clip } = _viewport

  visRect = _box.regions.center

  _indices = _frame.indices
  _index = undefined

  test = (x, y) ->
    i = mask.test x, y
    if i isnt undefined
      # Anti-aliasing artifacts on the mask canvas can cause false positives. Redraw this single mark and check if it ends up at the same (x, y) position.
      clipContext = clipCanvas.context
      clipContext.clearRect 0, 0, _box.width, _box.height

      for layer in _layers
        clipContext.save()
        clipContext.translate visRect.left, visRect.top
        layer.mask [ i ], layer.encoders, clipContext, clip
        clipContext.restore()
        return i if clip.test x, y
    return

  displayTooltip = (x, y, data) ->
    tableEl = createTooltipTable data
    removeDOMChildren tooltip
    tooltip.appendChild tableEl
    tooltip.style.display = 'block'
    moveTooltip x, y

  _tooltipOffset = 7 # sq distance from cursor to nearest tooltip corner.
  moveTooltip = (x, y) ->
    return if tooltip.style.display is 'none'

    tooltipWidth = tooltip.clientWidth
    tooltipHeight = tooltip.clientHeight

    p = x + _tooltipOffset
    q = y - _tooltipOffset - tooltipHeight

    # Flip horizontal if over the right edge
    p = x - _tooltipOffset - tooltipWidth if p + tooltipWidth > _box.width 

    # Flip vertical if over the top edge
    q = y + _tooltipOffset if q < 0

    # Clamp left, top if negative
    p = 0 if p < 0
    q = 0 if q < 0

    tooltip.style.left = px p
    tooltip.style.top = px q

  hideTooltip = ->
    tooltip.style.display = 'none'

  hover = (x, y) ->
    # debug x, y
    i = test x, y
    if i isnt _index
      _index = i

      hoverContext = hoverCanvas.context
      hoverContext.clearRect 0, 0, _box.width, _box.height
      hideTooltip()

      if i isnt undefined
        hoverContext.save()
        hoverContext.translate visRect.left, visRect.top
        for layer in _layers
          layer.highlight [ i ], layer.encoders, hoverContext
        hoverContext.restore()

        _dispatch 'hover', new HoverEventArg _frame.vectors, i

        tooltipData = {}
        for layer in _layers
          for aes, encoding of layer.encodings when encoding
            if encoding instanceof VariableEncoder
              # Style encodings have an encode(), but no vector, so check before use.
              if vector = encoding.vector
                tooltipData[vector.label] = vector.format i

            # Check for explicit TooltipEncoder
            else if encoding instanceof TooltipEncoder
              for vector in encoding.vectors
                tooltipData[vector.label] = vector.format i
        
        displayTooltip x, y, tooltipData
    else
      moveTooltip x, y
    return

  highlight = (indices) ->
    highlightContext = highlightCanvas.context
    highlightContext.clearRect 0, 0, _box.width, _box.height
    if indices.length
      baseCanvas.element.style.opacity = 0.5

      highlightContext.save()
      highlightContext.translate visRect.left, visRect.top
      for layer in _layers
        layer.highlight indices, layer.encoders, highlightContext
        layer.render indices, layer.encoders, highlightContext
      highlightContext.restore()

    else
      baseCanvas.element.style.opacity = 1
    return

  selectAt = (x, y) ->
    i = test x, y
    # debug 'selectAt', x, y
    if i isnt undefined
      highlight [ i ]
      _dispatch 'select', new SelectEventArg _frame.vectors, [ i ]
    else
      highlight []
      _dispatch 'deselect', new DeselectEventArg _frame.vectors
    return

  selectWithin = (x1, y1, x2, y2) ->
    xmin = -visRect.left + if x1 > x2 then x2 else x1
    xmax = -visRect.left + if x1 > x2 then x1 else x2
    ymin = -visRect.top + if y1 > y2 then y2 else y1
    ymax = -visRect.top + if y1 > y2 then y1 else y2
    # debug 'selectWithin', xmin, ymin, xmax, ymax
    for layer in _layers
      selectedIndices = layer.select _indices, layer.encoders, xmin, ymin, xmax, ymax
      highlight selectedIndices
      if selectedIndices.length
        _dispatch 'select', new SelectEventArg _frame.vectors, selectedIndices
      else
        _dispatch 'deselect', new DeselectEventArg _frame.vectors
    return

  render = ->
    baseContext = baseCanvas.context
    maskContext = maskCanvas.context

    renderGridlinesX baseContext, _axisX, visRect
    renderGridlinesY baseContext, _axisY, visRect

    baseContext.save()
    baseContext.translate visRect.left, visRect.top
    maskContext.save()
    maskContext.translate visRect.left, visRect.top

    for layer in _layers
      layer.render _indices, layer.encoders, baseContext
      layer.mask _indices, layer.encoders, maskContext, mask

    maskContext.restore()
    baseContext.restore()

    renderAxisX baseContext, _axisX, _box.regions.bottom
    renderAxisY baseContext, _axisY, _box.regions.left

    return

  captureMouseEvents hoverCanvas.element, marquee, hover, selectWithin, selectAt

  new Visualization _viewport, _frame, test, highlight, hover, selectAt, selectWithin, render


renderAxis = (g, axis, width, height, orientation) ->

  g.font = plot_defaults.axisLabelFont
  g.fillStyle = plot_defaults.axisLabelColor
  g.strokeStyle = plot_defaults.axisTickColor
  g.textBaseline = 'middle'

  titleHeight = __emWidth + 4

  maxLabelSize = width - titleHeight

  g.save()

  # Set a clip region for labels
  clipRect g, titleHeight, 0, maxLabelSize, height

  g.textAlign = 'right'

  tickStart = width - 5
  labelAnchor = width - 6

  if axis instanceof CategoricalAxis
    for category in axis.guide()
      label = category.value
      position = axis.scale category

      tickPosition = -0.5 + round position
      doLine g, tickStart, tickPosition, width, tickPosition

      g.fillText label, labelAnchor, position, maxLabelSize - 6
    doLine g, width - 0.5, 0, width - 0.5, height

  else if axis instanceof LinearAxis
    minPosition = 6
    maxPosition = height - 6
    for tick in axis.guide()
      label = tick.label
      position = axis.scale tick.value

      tickPosition = mmax 0.5, -0.5 + round position
      doLine g, tickStart, tickPosition, width, tickPosition

      labelPosition = if position < minPosition
        minPosition
      else if position > maxPosition
        maxPosition
      else
        position
      g.fillText label, labelAnchor, labelPosition, maxLabelSize - 6
    doLine g, width - 0.5, 0, width - 0.5, height
  else
    throw new Error "Invalid axis type."

  g.restore()

  # Axis title
  g.font = plot_defaults.axisTitleFont
  g.textAlign = 'center'
  g.translate titleHeight/2, height/2
  g.rotate orientation * Halfπ
  g.fillText axis.label, 0, 0, height

  g.restore()

renderGridlines = (g, axis, width, height) ->
  g.strokeStyle = plot_defaults.gridLineColor
  if axis instanceof CategoricalAxis
    # Rule lines at the top and bottom
    doLine g, 0, 0.5, width, 0.5
    doLine g, 0, height - 0.5, width, height - 0.5
  else if axis instanceof LinearAxis
    # Rule a line for each tick
    for tick in axis.guide()
      tickPosition = mmax 0.5, -0.5 + round axis.scale tick.value
      doLine g, 0, tickPosition, width, tickPosition
  return

renderGridlinesX = (g, axis, rect) ->
  g.save()
  g.translate rect.left, rect.top + rect.height
  g.rotate -Halfπ
  renderGridlines g, axis, rect.height, rect.width
  g.restore()

renderGridlinesY = (g, axis, rect) ->
  g.save()
  g.translate rect.left, rect.top
  renderGridlines g, axis, rect.width, rect.height
  g.restore()



renderAxisX = (g, axis, rect) ->
  g.save()
  g.translate rect.left, rect.top + rect.height
  g.rotate -Halfπ
  renderAxis g, axis, rect.height, rect.width, 1
  g.restore()

renderAxisY = (g, axis, rect) ->
  g.save()
  g.translate rect.left, rect.top
  renderAxis g, axis, rect.width, rect.height, -1
  g.restore()

#
# HTML Templating
# ===============
#

compileHtmlTemplate = (template, type) ->
  if 0 <= index = template.indexOf ' '
    tmpl = template.substr 0, index
    attrs = template.substr index
  else
    tmpl = template

  [ name, classes... ] = tmpl.split /\.+/g
  if 0 is name.indexOf '#'
    id = name.substr 1
    name = 'div'

  if name is ''
    name = 'div'

  beginTag = "<#{name}"
  beginTag += " id='#{id}'" if id
  beginTag += " class='#{classes.join ' '}'" if classes.length
  beginTag += attrs if attrs
  beginTag += ">"
  closeTag = "</#{name}>"

  if type is '='
    (content) -> beginTag + (if content isnt null and content isnt undefined then content else '') + closeTag
  else if type is '+'
    (content, arg0) -> #TODO add more args as necessary
      tag = replace beginTag, '{0}', arg0
      tag + content + closeTag
  else
    (contents) -> beginTag + (contents.join '') + closeTag

_htmlTemplateCache = {}
createHtmlTemplates = (templates...) ->
  for template in templates
    if cached = _htmlTemplateCache[template]
      cached
    else
      type = charAt template, 0
      if type is '=' or type is '+'
        _htmlTemplateCache[template] = compileHtmlTemplate (template.substr 1), type
      else
        _htmlTemplateCache[template] = compileHtmlTemplate template

# String -> HTMLElement
renderHtml = (htmlString) ->
  el = document.createElement 'div'
  el.innerHTML = htmlString
  el.childNodes[0]

#
# Main
# ==============================
#

filterFactorDomain = (factor, indices) ->
  dict = {}
  domain = []
  for index in indices
    { key } = category = factor.at index
    unless dict[key]
      dict[key] = yes
      domain.push category
  domain

createSpace1D = (vectors, indices) ->
  type = null
  domain = null
  _vector = null

  for vector in vectors
    if type is null
      type = vector.type
      switch type
        when TString
          _vector = vector
          domain = filterFactorDomain vector, indices

        when TNumber
          domain = vector.domain

        else
          throw new Error 'ni'

    else
      if type isnt vector.type
        throw new Error "Incompatible axis vector [#{vector.label}]. Expect type [#{type}], got [#{vector.type}]"

      switch type
        when TString
          if _vector isnt vector
            throw new Error "Incompatible categorical vector [#{vector.label}]. Expected [#{_vector.label}]."

        when TNumber
          domain = combineExtents domain, vector.domain

        else
          throw new Error 'ni'
    
  new Space1D type, vectors, domain

createAxisLabel = (vectors) ->
  labels = for vector in vectors
    vector.label
  join (unique labels), ', '

computeApproxAxisSize = (type, domain) ->
  rect = new Rect 0, 0, 400, 400
  axis = createAxis type, '', domain, (new SequentialRange 0, rect.width), rect

  # title size + tick offset + label offset
  padding = (__emWidth + 4) + 6 + 10

  if axis instanceof CategoricalAxis
    longest = 0
    categories = axis.guide()
    for category in categories
      if longest < length = ('' + category.value).length #XXX Number and Date valued categoricals need a format() function
        longest = length
    new Bounds(
      ceil longest * __emWidth + padding
      ceil categories.length * (__emWidth + 8)
    )

  else if axis instanceof LinearAxis
    longest = 0
    categories = axis.guide()
    for tick in axis.guide()
      if longest < length = tick.label.length
        longest = length
    new Bounds(
      ceil longest * __emWidth + padding
      plot_defaults.visualizationSize.height
    )

  else
    throw new Error "Invalid axis type."


createAxis = (type, label, domain, range, rect) ->
  switch type
    when TString
      scale = createOrdinalScale domain, range
      guide = ->
        domain

      new CategoricalAxis type, label, scale, domain, range, rect, guide

    when TNumber
      [ scale, tickFormat, ticks ] = createNicedSequentialLinearScale domain, range
      guide = (count=10) ->
        format = tickFormat count
        for value in ticks count
          new Tick value, format value

      new LinearAxis type, label, scale, domain, range, rect, guide

    else
      throw new Error "Unhandled axis type [#{type}]."

renderVisualization = (_frame, ops) ->
  query = createQuery ops
  frame = queryFrame _frame, query
  #debug frame

  if findByType ops, TableExpr
    renderTable frame, ops
  else if findByType ops, RecordExpr
    renderRecord frame, ops
  else
    renderPlot frame, ops

renderRecord = (frame, ops) ->
  recordExpr = findByType ops, RecordExpr
  index = recordExpr.index

  [ table, tbody, tr, th, td ] = createHtmlTemplates '=table.lightning-record', 'tbody', 'tr', '=th', '=td'

  trs = for name, vector of frame.schema
    value = vector.format index
    escapedValue = switch vector.type
      when TString
        if value isnt undefined then escape value else '-'
      when TNumber
        if value isnt undefined then escape value else '-'
      when TObject
        if value isnt undefined then value else '-'
      else
        throw new Error "Cannot render table cell of type #{vector.type}"
    tr [
      th escape vector.label
      td escapedValue
    ]

  element = renderHtml table tbody trs

  subscribe = noop #TODO
  unsubscribe = noop #TODO

  new Plot element, subscribe, unsubscribe

renderTable = (frame, ops) ->
  tableExpr = findByType ops, TableExpr

  vectorGroups = if tableExpr.fields.length
    for field in tableExpr.fields
      frame.evaluate field
  else
    frame.vectors

  vectors = flatten vectorGroups
  
  [ table, thead, tbody, tr, th, thr, td, tdr ] = createHtmlTemplates 'table.lightning-table', '=thead', 'tbody', 'tr', '=th', '=th.lightning-number', '=td', '=td.lightning-number'
  
  ths = for vector in vectors
    switch vector.type
      when TNumber
        thr escape vector.label
      else
        th escape vector.label

  trs = for i in frame.indices
    tds = for vector in vectors
      value = vector.format i
      switch vector.type
        when TString
          td if value isnt undefined then escape value else '-'
        when TNumber
          tdr if value isnt undefined then escape value else '-'
        when TObject
          td if value isnt undefined then value else '-'
        else
          throw new Error "Cannot render table cell of type #{vector.type}"
    tr tds

  element = renderHtml table [
    thead tr ths
    tbody trs
  ]

  subscribe = noop #TODO
  unsubscribe = noop #TODO

  new Plot element, subscribe, unsubscribe

computeAxisDomain = (self, other) ->
  if self.type is TNumber
    if other.type is TString
      includeOrigin0 self.domain
    else # other.type is TNumber
      self.domain
  else
    self.domain

renderPlot = (frame, ops) ->
  marks = map (filterByType ops, MarkExpr), (expr) ->
    positionVectors = for coord in expr.position.coordinates
      frame.evaluate coord.field
    #XXX Flatten positionVectors: stack() will produce 2 vectors
    createMark expr, flatten positionVectors

  spaces = map marks, (mark) -> mark.space
  vectorsX = flatMap spaces, (space) -> space.x
  vectorsY = flatMap spaces, (space) -> space.y

  spaceX = createSpace1D vectorsX, frame.indices
  spaceY = createSpace1D vectorsY, frame.indices

  domainX = computeAxisDomain spaceX, spaceY
  domainY = computeAxisDomain spaceY, spaceX

  axisBoundsX = computeApproxAxisSize spaceX.type, domainX
  axisBoundsY = computeApproxAxisSize spaceY.type, domainY

  bounds = (findByType ops, Bounds) ? new Bounds undefined, undefined
  boundsWidth = bounds.width ? mmin plot_defaults.maxCanvasSize.width, axisBoundsY.width + axisBoundsX.height
  boundsHeight = bounds.height ? mmin plot_defaults.maxCanvasSize.height, axisBoundsX.width + axisBoundsY.height

  box = new Box(
    boundsWidth
    boundsHeight
    new Margin(
      mmin 0.3 * plot_defaults.maxCanvasSize.width, axisBoundsY.width
      0
      0
      mmin 0.3 * plot_defaults.maxCanvasSize.height, axisBoundsX.width 
    )
  )

  axisRectX = box.regions.bottom
  axisRectY = box.regions.left

  rangeX = new SequentialRange 0, axisRectX.width
  rangeY = if spaceY.type is TNumber
    new SequentialRange axisRectY.height, 0
  else
    new SequentialRange 0, axisRectY.height

  axisX = createAxis spaceX.type, (createAxisLabel vectorsX), domainX, rangeX, axisRectX
  axisY = createAxis spaceY.type, (createAxisLabel vectorsY), domainY, rangeY, axisRectY

  layers = map marks, (mark) ->
    geom = mark.geometry
    encodings = geom.encode frame, mark, axisX, axisY
    encoders = {}
    for k, v of encodings when v?.encode
      encoders[k] = v.encode

    new Layer encodings, encoders, geom.mask, geom.highlight, geom.render, geom.select

  [ subscribe, unsubscribe, dispatch ] = do createEventDispatcher

  visualization = createVisualization box, frame, layers, axisX, axisY, dispatch

  visualization.render() #TODO should be callable externally, with indices.
  new Plot visualization.viewport.container, subscribe, unsubscribe

#
# Bootstrap
# ==============================
#

visualize = dispatch(
  [ 
    Datasource, Array, Function, (ds, ops, go) -> 
      ds.read (error, frame) -> 
        if error
          go error
        else
          visualize frame, ops, go
  ] 
  [
    Frame, Array, Function, (frame, ops, go) ->
      try
        go null, renderVisualization frame, ops
      catch error
        go error
  ]
)

initializeStylesheet = ->
  createStylesheet
    '.lightning-tooltip':
      background: '#2c2c2c'
      color: '#fff'
      'font-size': '12px'
    '.lightning-tooltip th, .lightning-tooltip td':
      padding: '0px 4px'
      'vertical-align': 'middle'
    '.lightning-tooltip th':
      'text-align': 'left'
    '.lightning-table th, .lightning-table td':
      padding: '0px 8px'
      'vertical-align': 'middle'
    '.lightning-table tbody > tr:nth-child(odd)':
      'background-color': '#f3f3f3'
    '.lightning-table .lightning-number':
      'text-align': 'right'
    '.lightning-record th, .lightning-record td':
      padding: '0px 8px'
      'vertical-align': 'middle'
    '.lightning-record th':
      'text-align': 'right'
    '.lightning-record tbody > tr:nth-child(odd)':
      'background-color': '#f3f3f3'

__scratchCanvas = null
__emWidth = 18

initializeScratchCanvas = ->
  __scratchCanvas = canvas = createCanvas new Bounds 100, 100
  g = canvas.context
  g.font = plot_defaults.axisLabelFont
  __emWidth = (g.measureText 'M').width #FIXME won't work for non-monospace fonts

__isLibInitialized = no
initializeLib = ->
  unless __isLibInitialized
    do initializeStylesheet
    do initializeScratchCanvas
    __isLibInitialized = yes

plot = (ops...) ->
  if datasource = findByType ops, Datasource, Frame
    do initializeLib
    (go) -> visualize datasource, (without ops, datasource), go
  else
    (more...) -> apply plot, null, concat ops, more

#
# Public API
# ==============================
# 

plot.VERSION = '999.999.999'
plot.bounds = plot_bounds
plot.from = plot_from
plot.value = plot_value
plot.domain = plot_domain
plot.range = plot_range
plot.position = plot_position
plot.fillColor = plot_fillColor
plot.fillOpacity = plot_fillOpacity
plot.strokeColor = plot_strokeColor
plot.strokeOpacity = plot_strokeOpacity
plot.size = plot_size
plot.width = plot_width
plot.height = plot_height
plot.lineWidth = plot_lineWidth
plot.shape = plot_shape
plot.tooltip = plot_tooltip
plot.factor = plot_factor
plot.stack = plot_stack
plot.groupBy = plot_groupBy
plot.select = plot_select
plot.where = plot_where
plot.limit = plot_limit
plot.having = plot_having
plot.eq = plot_eq
plot.ne = plot_ne
plot.lt = plot_lt
plot.gt = plot_gt
plot.le = plot_le
plot.ge = plot_ge
plot.like = plot_like
plot.avg = plot_avg
plot.count = plot_count
plot.max = plot_max
plot.min = plot_min
plot.sum = plot_sum
#plot.stddev = plot_stddev
#plot.stddevP = plot_stddevP
#plot.variance = plot_variance
#plot.varianceP = plot_varianceP
plot.parse = plot_parse
plot.point = plot_point
plot.rect = plot_rect
plot.path = plot_path
plot.schema = plot_schema
plot.table = plot_table
plot.record = plot_record
plot.remote = plot_remote
plot.createFrame = createFrame
plot.createVector = createVector
plot.createList = createList
plot.createFactor = createFactor


if module?.exports? then module.exports = plot else window.plot = plot

