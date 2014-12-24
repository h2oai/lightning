#
# Vortex
# ==============================
#

#
# TODO
# ------------------------------
#
# - fix mmin, mmax, vvalues in shorthand
# - Tooltips
# - Stack
# - Jitter
# - Missing value handling for all aes encodings
# - Axes
# - Legends
# - Bar
# - Line
# - Area
# - Polygon
# - Path
# - Detail
# - Events (selection, hover)


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
        (a) -> pattern is RegExp
      when Error
        (a) -> pattern is Error
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

class Group

class Frame
  constructor: (@label, @vectors, @schema, @indices, @cube, @at, @eval, @attach) ->

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
  constructor: (@eval) ->

class ReducedField extends Field
  constructor: (@eval) ->

class Mark

class PointMark extends Mark
  constructor: (@positionX, @positionY, @shape, @size, @fillColor, 
    @fillOpacity, @strokeColor, @strokeOpacity, @lineWidth) ->

class PathMark extends Mark
  constructor: (@positionX, @positionY, @strokeColor, @strokeOpacity, 
    @lineWidth) ->

class TextMark extends Mark
  constructor: (@position, @text, @size, @fillColor, @fillOpacity) ->

class PointEncoding
  constructor: (@positionX, @positionY, @shape, @size, @fill, @fillColor, 
    @fillOpacity, @stroke, @strokeColor, @strokeOpacity, @lineWidth) ->

class LineEncoding
  constructor: (@positionX, @positionY, @stroke, @strokeColor, @strokeOpacity, 
    @lineWidth) ->

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

class PositionChannel extends Channel
  constructor: (@fieldX, @fieldY) ->

class CoordChannel extends Channel
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

class Geometry
  constructor: (@init, @encode, @mask, @highlight, @render, @select) ->

class Datasource
  constructor: (@read) ->

class Canvas
  constructor: (@element, @context, @bounds, @ratio) ->

class Viewport
  constructor: ( @bounds, @container, @baseCanvas, @highlightCanvas,
    @hoverCanvas, @maskCanvas, @clipCanvas, @marquee, @mask, @clip) ->

class Layer
  constructor: (@encoding, @mask, @highlight, @render, @select) ->

class Visualization
  constructor: (@viewport, @frame, @test, @highlight, @hover, @selectAt, 
    @selectWithin, @render) ->

class Bounds
  constructor: (@width, @height) ->

class Query
  constructor: (@select, @where, @group, @having) ->

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

class HavingOp
  constructor: (@fields, @predicate) ->

#
# Utility functions
# ==============================
#

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
clampOpacity = clamp_ 0, 1

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

# [a], T, a -> a
getOp = (ops, type, def) ->
  if op = findByType ops, type
    op
  else
    def

getOps = filterByType

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

#
# Vector
# ==============================
#

# string, type, [a], (int -> string) -> Vector
createVector = (label, type, data, format) ->
  domain = computeExtent data
  count = -> data.length
  at = (i) -> data[i]
  _format = (i) -> format data[i]
  new Vector label, label, type, at, count, domain, _format

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

#
# Frame
# ==============================
#

# string, [Vector], [int], Cube? -> Frame
createFrame = (label, vectors, indices, cube) ->
  schema = indexBy vectors, (vector) -> vector.name

  frame = new Frame label, vectors, schema, indices, cube, null, null, null

  frame.eval = (field) ->
    if field instanceof MappedField
      frame.eval field.eval frame
    else if field instanceof ReducedField
      if cube
        frame.eval field.eval frame, cube
      else
        throw new Error "Cannot compute aggregate [#{field.name}] on an unaggregated frame."
    else
      if vector = schema[field.name]
        vector
      else
        throw new Error "Vector [#{field.name}] does not exist in frame [#{label}]."

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
    getOps ops, SelectOp
    getOps ops, WhereOp
    getOps ops, GroupOp
    getOps ops, HavingOp
  )

createFields = (names) ->
  map names, (name) -> new Field name

# Factored fields
# ------------------------------

createFactorField = (field) ->
  new MappedField (frame) ->
    vector = frame.eval field
    if vector instanceof Factor
      field        
    else
      length = vector.count()
      at = vector.at
      data = new Array length
      for i in [ 0 ... length ]
        if undefined isnt value = at i
          data[i] = '' + value

      frame.attach computedVector = createFactor "factor(#{vector.label})", TString, data
      new Field computedVector.name

plot_factor = dispatch(
  [ String, (name) -> createFactorField new Field name ]
  [ Field, (field) -> createFactorField field ]
)

# Aggregate fields
# ------------------------------

aggregate_avg = (array) ->
  total = 0
  for value in array when value isnt undefined
    total += value
  total / array.length

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

aggregate_stddev = (array) -> #XXX

aggregate_stddevP = (array) -> #XXX

aggregate_variance = (array) -> #XXX

aggregate_varianceP = (array) -> #XXX

createAggregateField = (field, symbol, type, format, f) ->
  new ReducedField (frame, cube) ->
    name = "#{symbol}(#{field.name})"
    if cube.frame.exists name
      new Field name
    else
      vector = cube.frame.eval field
      at = vector.at
      data = new Array cube.cells.length
      for cell, j in cube.cells
        values = []
        for i in cell.indices
          values.push value if (value = at i) isnt undefined
        data[j] = f values
      frame.attach computedVector = createVector name, type, data, format
      new Field computedVector.name

plot_aggregate = (title, type, format, func) ->
  dispatch(
    [ String, (name) -> createAggregateField (new Field name), title, type, format, func ]
    [ Field, (field) -> createAggregateField field, title, type, format, func ]
  )

plot_avg = plot_aggregate 'avg', TNumber, identity, aggregate_avg

plot_count = plot_aggregate 'count', TNumber, identity, aggregate_count

plot_max = plot_aggregate 'max', TNumber, identity, aggregate_max

plot_min = plot_aggregate 'min', TNumber, identity, aggregate_min

plot_sum = plot_aggregate 'sum', TNumber, identity, aggregate_sum

plot_stddev = plot_aggregate 'stddev', TNumber, identity, aggregate_stddev

plot_stddevP = plot_aggregate 'stddevP', TNumber, identity, aggregate_stddevP

plot_variance = plot_aggregate 'variance', TNumber, identity, aggregate_variance

plot_varianceP = plot_aggregate 'varianceP', TNumber, identity, aggregate_varianceP

# GROUP BY clause
# ------------------------------

plot_group = (args...) ->
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

# HAVING clause
# ------------------------------

plot__having = dispatch(
  [ [String], Function, (names, func) -> new HavingOp (createFields names), func ]
)

plot_having = (names..., func) -> plot__having names, func

# Filter predicates
# ------------------------------

plot_eq = (expected) -> (actual) -> expected is actual

plot_ne = (expected) -> (actual) -> expected isnt actual

plot_lt = (expected) -> (actual) -> expected < actual

plot_gt = (expected) -> (actual) -> expected > actual

plot_le = (expected) -> (actual) -> expected <= actual

plot_ge = (expected) -> (actual) -> expected >= actual

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
  
  if query.group.length
    fields = flatMap query.group, (op) -> op.fields
    factors = for field in fields
      vector = filteredFrame.eval field
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

filterFrame = (frame, ops) ->
  _indices = frame.indices # transient!
  for op in ops
    indices = []
    vectors = for field in op.fields
      frame.eval field
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

pickCategoricalShapePalette = (cardinality) -> ShapePalettes.c8

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

createNicedLinearScale = (domain, range) ->
  scaleSafe_(
    d3.scale.linear()
      .domain [ domain.min, domain.max ]
      .range [ range.min, range.max ]
      .nice()
  )

createLinearAxis = (label, domain, range) ->
  scale = d3.scale.linear()
    .domain [ domain.min, domain.max ]
    .range [ range.min, range.max ]
    .nice()

  guide = (count) ->
    format = scale.tickFormat count
    scale.ticks count

  new LinearAxis label, (scaleSafe_ scale), domain, range, guide

createCategoricalScale = (domain, range) ->
  _rangeValues = range.values
  _rangeCount = _rangeValues.length
  (category) -> _rangeValues[ category.key % _rangeCount ]

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

#
# Encoding
# ==============================
#

encodePosition = (frame, channel, range) ->
  field = channel.field
  vector = frame.eval field
  { domain } = vector

  switch vector.type
    when TNumber
      scale = createNicedLinearScale domain, range
      at = vector.at
      encode = (i) -> scale at i
      guide = (count) ->
        format = scale.tickFormat count
        scale.ticks count

      new LinearAxis vector.label, encode, domain, range, guide
    else
      throw new Error 'ni'

encodeColor = (frame, channel) ->
  if channel instanceof VariableFillColorChannel or channel instanceof VariableStrokeColorChannel
    vector = frame.eval channel.field
    if vector instanceof Factor
      unless channel.range
        channel.range = new CategoricalRange pickCategoricalColorPalette vector.domain.length
      scale = createCategoricalScale vector.domain, channel.range
      at = vector.at
      encode = (i) -> chroma scale at i
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
      new ColorEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder channel.value

encodeOpacity = (frame, channel) ->
  if channel instanceof VariableFillOpacityChannel or channel instanceof VariableStrokeOpacityChannel
    vector = frame.eval channel.field
    if vector instanceof Factor
      throw new Error "Could not encode opacity. Vector [#{vector.label}] is a Factor."
    domain = new SequentialRange vector.domain.min, vector.domain.max
    range = if channel.range
      new SequentialRange (clampOpacity channel.range.min), (clampOpacity channel.range.max)
    else
      channel.range = new SequentialRange 0.05, 1
    scale = createLinearScale domain, range
    at = vector.at
    encode = (i) -> scale at i
    new OpacityEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder clampOpacity channel.value

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

encodeSize = (frame, channel) ->
  if channel instanceof VariableSizeChannel
    vector = frame.eval channel.field
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
    new SizeEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder sq channel.value

encodeLineWidth = (frame, channel) ->
  if channel instanceof VariableLineWidthChannel
    vector = frame.eval channel.field
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
    new SizeEncoder vector.label, encode, domain, range, null #XXX
  else
    new ConstantEncoder channel.value

encodeShape = (frame, channel) ->
  if channel instanceof VariableShapeChannel
    vector = frame.eval channel.field
    unless vector instanceof Factor
      throw new Error "Could not encode shape. Vector [#{vector.label}] is not a Factor." 
    unless channel.range
      channel.range = new CategoricalRange pickCategoricalShapePalette vector.domain.length 
    scale = createCategoricalScale vector.domain, channel.range
    at = vector.at
    encode = (i) -> Shapes[ scale at i ]
    new ShapeEncoder vector.label, encode, vector.domain, channel.range, null #XXX
  else
    #REVIEW: throw error or switch to circle?
    new ConstantEncoder Shapes[channel.value] or Shapes.circle

#
# Point Rendering
# ==============================
#

initPointMark = (mark) ->
  mark.shape = new ConstantShapeChannel 'circle' unless mark.shape
  mark.size = new ConstantSizeChannel defaultSize unless mark.size

  hasFill = mark.fillColor or mark.fillOpacity
  hasStroke = mark.strokeColor or mark.strokeOpacity or mark.lineWidth
  hasStroke = yes unless hasFill or hasStroke

  if hasFill
    mark.fillColor = new ConstantFillColorChannel chroma head ColorPalettes.c10 unless mark.fillColor
    mark.fillOpacity = new ConstantFillOpacityChannel 1 unless mark.fillOpacity

  if hasStroke
    mark.strokeColor = new ConstantStrokeColorChannel chroma head ColorPalettes.c10 unless mark.strokeColor
    mark.strokeOpacity = new ConstantStrokeOpacityChannel 1 unless mark.strokeOpacity
    mark.lineWidth = new ConstantLineWidthChannel 1.5 unless mark.lineWidth

  mark

encodePointMark = (frame, mark, bounds, positionX, positionY) ->
  shape = encodeShape frame, mark.shape
  size = encodeSize frame, mark.size

  if mark.fillColor or mark.fillOpacity
    fillColor = encodeColor frame, mark.fillColor
    fillOpacity = encodeOpacity frame, mark.fillOpacity
    fill = encodeStyle fillColor, fillOpacity

  if mark.strokeColor or mark.strokeOpacity or mark.lineWidth
    strokeColor = encodeColor frame, mark.strokeColor
    strokeOpacity = encodeOpacity frame, mark.strokeOpacity
    stroke = encodeStyle strokeColor, strokeOpacity
    lineWidth = encodeLineWidth frame, mark.lineWidth

  new PointEncoding positionX, positionY, shape, size, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth


highlightPointMarks = (indices, encoding, g) ->
  positionX = encoding.positionX.encode
  positionY = encoding.positionY.encode
  shape = encoding.shape.encode
  size = encoding.size.encode
  fill = encoding.fill?.encode
  stroke = encoding.stroke?.encode
  lineWidth = encoding.lineWidth?.encode

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


maskPointMarks = (indices, encoding, g, mask) ->
  positionX = encoding.positionX.encode
  positionY = encoding.positionY.encode
  shape = encoding.shape.encode
  size = encoding.size.encode
  stroke = encoding.stroke?.encode
  lineWidth = encoding.lineWidth?.encode

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

renderPointMarks = (indices, encoding, g) ->
  positionX = encoding.positionX.encode
  positionY = encoding.positionY.encode
  shape = encoding.shape.encode
  size = encoding.size.encode
  fill = encoding.fill?.encode
  stroke = encoding.stroke?.encode
  lineWidth = encoding.lineWidth?.encode

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

# XXX Naive, need some kind of memoization during rendering.
selectMarks = (indices, encoding, xmin, ymin, xmax, ymax) ->
  positionX = encoding.positionX.encode
  positionY = encoding.positionY.encode

  selectedIndices = []

  for i in indices
    x = positionX i
    y = positionY i
    if x isnt undefined and y isnt undefined and xmin <= x <= xmax and ymin <= y <= ymax
      selectedIndices.push i

  selectedIndices

#
# Path Rendering
# ==============================
#
initPathMark = (mark) ->
  mark.strokeColor = new ConstantStrokeColorChannel chroma head ColorPalettes.c10 unless mark.strokeColor
  mark.strokeOpacity = new ConstantStrokeOpacityChannel 1 unless mark.strokeOpacity
  mark.lineWidth = new ConstantLineWidthChannel 1.5 unless mark.lineWidth
  mark

encodePathMark = (frame, mark, bounds, positionX, positionY) ->
  strokeColor = encodeColor frame, mark.strokeColor
  strokeOpacity = encodeOpacity frame, mark.strokeOpacity
  stroke = encodeStyle strokeColor, strokeOpacity
  lineWidth = encodeLineWidth frame, mark.lineWidth
  new LineEncoding positionX, positionY, stroke, strokeColor, strokeOpacity, lineWidth

highlightPathMarks = (indices, encoding, g) ->
  positionX = encoding.positionX.encode
  positionY = encoding.positionY.encode

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

maskPathMarks = (indices, encoding, g, mask) ->
  positionX = encoding.positionX.encode
  positionY = encoding.positionY.encode

  g.save()
  for i in indices
    x = positionX i
    y = positionY i

    if x isnt undefined and y isnt undefined
      drawCircle g, x, y, 64
      g.fillStyle = mask.put i
      g.fill()
  g.restore()

renderPathMarks = (indices, encoding, g) ->
  positionX = encoding.positionX.encode
  positionY = encoding.positionY.encode
  stroke = encoding.stroke.encode
  lineWidth = encoding.lineWidth.encode

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

Geometries = [
  [
    PointMark
  ,
    new Geometry(
      initPointMark
      encodePointMark
      maskPointMarks
      highlightPointMarks
      renderPointMarks
      selectMarks
    )
  ]
,
  [
    PathMark
  ,
    new Geometry(
      initPathMark
      encodePathMark
      maskPathMarks
      highlightPathMarks
      renderPathMarks
      selectMarks
    )
  ]
]

getGeometry = (mark) ->
  for [ type, geom ] in Geometries when mark instanceof type
    return geom
  return

registerGeometry = (type, geom) ->
  Geometries.push [ type, geom ]

# Visualization operators
# ==============================

plot_from = dispatch(
  [ Frame, identity ]
  [ Function, (read) -> new Datasource read ]
)

plot_rectangular = (scaleX, scaleY) ->

plot_polar = (scaleR, scaleA) ->

plot_parallel = (scales...) ->

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
  [ String, String, (nameX, nameY) -> new PositionChannel (new Field nameX), (new Field nameY) ]
  [ String, Field, (nameX, fieldY) -> new PositionChannel (new Field nameX), fieldY ]
  [ Field, String, (fieldX, nameY) -> new PositionChannel fieldX, (new Field nameY) ]
  [ Field, Field, (fieldX, fieldY) -> new PositionChannel fieldX, fieldY ]
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

plot_shape = dispatch(
  [ StringValue, (value) -> new ConstantShapeChannel value.value ]
  [ String, (name) -> new VariableShapeChannel new Field name ]
  [ Field, (field) -> new VariableShapeChannel field ]
  [ String, CategoricalRange, (name, range) -> new VariableShapeChannel (new Field name), range ]
  [ Field, CategoricalRange, (field, range) -> new VariableShapeChannel field, range ]
)

plot_point = (ops...) ->
  position = getOp ops, PositionChannel
  positionX = new CoordChannel position.fieldX
  positionY = new CoordChannel position.fieldY
  shape = getOp ops, ShapeChannel
  size = getOp ops, SizeChannel
  fillColor = getOp ops, FillColorChannel
  fillOpacity = getOp ops, FillOpacityChannel
  strokeColor = getOp ops, StrokeColorChannel
  strokeOpacity = getOp ops, StrokeOpacityChannel
  lineWidth = getOp ops, LineWidthChannel

  new PointMark positionX, positionY, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth

plot_path = (ops...) ->
  position = getOp ops, PositionChannel
  positionX = new CoordChannel position.fieldX
  positionY = new CoordChannel position.fieldY
  strokeColor = getOp ops, StrokeColorChannel
  strokeOpacity = getOp ops, StrokeOpacityChannel
  lineWidth = getOp ops, LineWidthChannel

  new PathMark positionX, positionY, strokeColor, strokeOpacity, lineWidth

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
  bounds: new Bounds 400, 400

px = (pixels) -> "#{round pixels}px"

createDOMElement = (tag, styles) ->
  el = document.createElement tag
  style = el.style
  for name, value of styles
    style[name] = value
  el

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

createViewport = (bounds) ->
  [ baseCanvas, highlightCanvas, hoverCanvas, maskCanvas, clipCanvas ] = (createCanvas bounds for i in [ 1 .. 5 ])

  # Set position to 'relative'. This has two effects: 
  #  1. The canvases contained in it (which are set to position: absolute), overlap instead of flowing.
  #  2. Mouse events captured on the top-most canvas get reported with the offset relative to this container instead of the page.
  container = createDOMElement 'div',
    position: 'relative'
    width: px bounds.width
    height: px bounds.height

  marquee = createDOMElement 'div',
    position: 'absolute'
    left: px 0
    top: px 0
    width: px 0
    height: px 0
    display: 'none'
    outline: '1px dotted #999'
    background: 'rgba(0, 0, 0, 0.05)'

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

#
# Rendering
# ==============================
#

createVisualization = (bounds, frame, layers) ->
  viewport = createViewport bounds

  { bounds, baseCanvas, highlightCanvas, hoverCanvas, clipCanvas, maskCanvas, marquee, mask, clip } = viewport
  _indices = frame.indices
  _index = undefined

  test = (x, y) ->
    i = mask.test x, y
    if i isnt undefined
      # Anti-aliasing artifacts on the mask canvas can cause false positives. Redraw this single mark and check if it ends up at the same (x, y) position.
      clipCanvas.context.clearRect 0, 0, bounds.width, bounds.height
      for layer in layers
        layer.mask [ i ], layer.encoding, clipCanvas.context, clip
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
        for layer in layers
          layer.highlight [ i ], layer.encoding, hoverCanvas.context
    return

  highlight = (indices) ->
    highlightCanvas.context.clearRect 0, 0, bounds.width, bounds.height
    if indices.length
      baseCanvas.element.style.opacity = 0.5
      for layer in layers
        layer.highlight indices, layer.encoding, highlightCanvas.context
        layer.render indices, layer.encoding, highlightCanvas.context
    else
      baseCanvas.element.style.opacity = 1
    return

  selectAt = (x, y) ->
    i = test x, y
    debug 'selectAt', x, y
    highlight if i isnt undefined then [ i ] else []
    return

  selectWithin = (x1, y1, x2, y2) ->
    xmin = if x1 > x2 then x2 else x1
    xmax = if x1 > x2 then x1 else x2
    ymin = if y1 > y2 then y2 else y1
    ymax = if y1 > y2 then y1 else y2
    debug 'selectWithin', xmin, ymin, xmax, ymax
    for layer in layers
      highlight layer.select _indices, layer.encoding, xmin, ymin, xmax, ymax
    return

  render = ->
    for layer in layers
      layer.render _indices, layer.encoding, baseCanvas.context
      layer.mask _indices, layer.encoding, maskCanvas.context, mask
    return

  captureMouseEvents hoverCanvas.element, marquee, hover, selectWithin, selectAt

  new Visualization viewport, frame, test, highlight, hover, selectAt, selectWithin, render

#
# Main
# ==============================
#

renderPlot = (_frame, ops) ->
  query = createQuery ops
  frame = queryFrame _frame, query
  debug dumpFrame frame

  bounds = getOp ops, Bounds, plot_defaults.bounds
  marks = getOps ops, Mark

  #XXX coalesce (x, y) from all marks + validation
  mark = head marks
  positionX = encodePosition frame, mark.positionX, new SequentialRange 0, bounds.width
  positionY = encodePosition frame, mark.positionY, new SequentialRange bounds.height, 0

  layers = map marks, (mark) ->
    geom = getGeometry mark
    encoding = geom.encode frame, (geom.init mark), bounds, positionX, positionY
    new Layer encoding, geom.mask, geom.highlight, geom.render, geom.select

  visualization = createVisualization bounds, frame, layers

  visualization.render() #TODO should be callable externally, with indices.
  
  visualization.viewport.container

#
# Bootstrap
# ==============================
#

createPlot = dispatch(
  [ 
    Datasource, Array, Function, (ds, ops, go) -> 
      ds.read (error, frame) -> 
        if error
          go error
        else
          createPlot frame, ops, go
  ] 
  [
    Frame, Array, Function, (frame, ops, go) ->
      try
        go null, renderPlot frame, ops
      catch error
        go error
  ]
)

plot = (ops...) ->
  if datasource = findByType ops, Datasource, Frame
    (go) -> createPlot datasource, (without ops, datasource), go
  else
    (more...) -> apply plot, null, concat ops, more

#
# Public API
# ==============================
# 

plot.from = plot_from
plot.rectangular = plot_rectangular
plot.polar = plot_polar
plot.parallel = plot_parallel
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
plot.group = plot_group
plot.select = plot_select
plot.where = plot_where
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
plot.stddev = plot_stddev
plot.stddevP = plot_stddevP
plot.variance = plot_variance
plot.varianceP = plot_varianceP
plot.parse = plot_parse
plot.point = plot_point
plot.path = plot_path
plot.createFrame = createFrame
plot.createVector = createVector
plot.createFactor = createFactor


if module?.exports? then module.exports = plot else window.plot = plot

