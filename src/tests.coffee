check = (t, f) ->
  (expected, args...) ->
    actual = f.apply null, args
    t actual, expected 

test 'types', (t) ->
  t.plan 12
  t.equal TUndefined, 'undefined'
  t.equal TNull, 'null'
  t.equal TBoolean, 'Boolean'
  t.equal TString, 'String'
  t.equal TNumber, 'Number'
  t.equal TFunction, 'Function'
  t.equal TObject, 'Object'
  t.equal TArray, 'Array'
  t.equal TArguments, 'Arguments'
  t.equal TDate, 'Date'
  t.equal TRegExp, 'RegExp'
  t.equal TError, 'Error'

test 'typeOf', (t) ->
  class TypeOf_Class

  cases = [
    [ undefined, TUndefined ]
    [ null, TNull ]
    [ true, TBoolean ]
    [ false, TBoolean ]
    [ '', TString ]
    [ 'string', TString ]
    [ 0, TNumber ]
    [ 1, TNumber ]
    [ Number.NaN, TNumber ]
    [ Number.MAX_VALUE, TNumber ]
    [ Number.MIN_VALUE, TNumber ]
    [ Number.POSITIVE_INFINITY, TNumber ]
    [ Number.NEGATIVE_INFINITY, TNumber ]
    [ identity, TFunction ]
    [ {}, TObject ]
    [ new TypeOf_Class(), TObject ]
    [ [], TArray ]
    [ [ 4, 2 ], TArray ]
    [ arguments, TArguments ]
    [ new Date(), TDate ]
    [ /^.+$/g, TRegExp ]
    [ new Error(), TError ]
  ]

  t.plan cases.length

  for [ input, expected ] in cases
    t.equal (typeOf input), expected

  return

test 'dispatch', (t) ->
  class Dispatch_Sample_Class

  positiveCases = [
    [ undefined, undefined ]
    [ null, null ]
    [ Boolean, true, false ]
    [ true, true ]
    [ false, false ]
    [ String, '', 'string' ]
    [ '', '' ]
    [ 'string', 'string' ]
    [ Number, 0, 1, Number.NaN, Number.MAX_VALUE, Number.MIN_VALUE, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY ]
    [ 0, 0 ]
    [ 1, 1 ]
    [ Number.NaN, Number.NaN ]
    [ Number.MAX_VALUE, Number.MAX_VALUE ]
    [ Number.MIN_VALUE, Number.MIN_VALUE ]
    [ Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY ]
    [ Number.NEGATIVE_INFINITY, Number.NEGATIVE_INFINITY ]
    [ Function, identity ]
    [ Object, {}, new Dispatch_Sample_Class() ]
    [ { type: 'foo' }, { type: 'foo', mode: 'bar' } ]
    [ Dispatch_Sample_Class, new Dispatch_Sample_Class() ]
    [ Array, [], [ 4, 2 ] ]
    [ [String], [ 'foo', 'bar' ] ]
    [ [Number], [ 41, 42, 43 ] ]
    [ [], [] ]
    [ [ 4, 2 ], [ 4, 2 ] ]
    [ Date, new Date() ]
    [ RegExp, /^.+$/g ]
    [ Error, new Error() ]
  ]

  negativeCases = [
    [ undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ null, undefined, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ Boolean, undefined, null, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ true, undefined, null, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ false, undefined, null, true, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ String, undefined, null, true, false, 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ '', undefined, null, true, false, 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ 'string', undefined, null, true, false, '', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ Number, undefined, null, true, false, '', 'string', identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ 0, undefined, null, true, false, '', 'string', 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ 1, undefined, null, true, false, '', 'string', 0, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ Number.NaN, undefined, null, true, false, '', 'string', 0, 1, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ Function, undefined, null, true, false, '', 'string', 0, 1, Number.NaN, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ Object, undefined, null, true, false, '', 'string', 0, 1, Number.NaN ]
    [ { type: 'foo' }, undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'bar' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ Dispatch_Sample_Class, undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ Array, undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, new Date(), /^.+$/g, new Error() ]
    [ [], undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [ 4, 2 ], new Date(), /^.+$/g, new Error() ]
    [ [ 4, 2 ], undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], new Date(), /^.+$/g, new Error() ]
    [ Date, undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], /^.+$/g, new Error() ]
    [ RegExp, undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), new Error() ]
    [ Error, undefined, null, true, false, '', 'string', 0, 1, Number.NaN, identity, {}, new Dispatch_Sample_Class(), { type: 'foo' }, [], [ 4, 2 ], new Date(), /^.+$/g ]
  ]

  createDispatchTarget = (expected) ->
    (actual) ->
      if (isNaN expected) and (isNaN actual)
        t.pass()
      else
        t.equal actual, expected

  for [ pattern, args... ] in positiveCases
    for arg in args
      f = dispatch [ pattern, createDispatchTarget arg ]
      f arg

  for [ pattern, args... ] in negativeCases
    for arg in args
      f = dispatch [ pattern, -> ]
      t.throws operation f, arg

  t.end()

test 'applyc', (t) ->
  class Foo
    constructor: (@bar, @baz) ->

  foo = applyc Foo, [ 'bar', 'baz' ]
  
  t.plan 3
  t.assert foo instanceof Foo
  t.equal foo.bar, 'bar'
  t.equal foo.baz, 'baz'

test 'classes and attributes', (t) ->

  classes = [
    [ Clip, 2 ]
    [ Mask, 2 ]
    [ Size, 2 ]
    [ Rect, 4 ]
    [ Vector, 7 ]
    [ Factor, 8 ]
    [ List, 6 ]
    [ Frame, 9 ]
    [ Value, 1 ]
    [ NumberValue, 1 ]
    [ StringValue, 1 ]
    [ DateValue, 1 ]
    [ BooleanValue, 1 ]
    [ Field, 1 ]
    [ MappedField, 1 ]
    [ ReducedField, 1 ]
    [ Fill, 2 ]
    [ Stroke, 3 ]
    [ SelectExpr, 1 ]
    [ RecordExpr, 1 ]
    [ PointExpr, 9 ]
    [ PathExpr, 5 ]
    [ SchemaExpr, 5 ]
    [ RectExpr, 9 ]
    [ LineExpr, 4 ]
    [ LineAnnotation, 5 ]
    [ PointMark, 11 ]
    [ SchemaXMark, 12 ]
    [ SchemaYMark, 12 ]
    [ ColMark, 11 ]
    [ BarMark, 11 ]
    [ PathMark, 7 ]
    [ PointEncoding, 12 ]
    [ SchemaXEncoding, 12 ]
    [ SchemaYEncoding, 12 ]
    [ ColEncoding, 12 ]
    [ BarEncoding, 12 ]
    [ PathEncoding, 7 ]
    [ Space2D, 2 ]
    [ Space1D, 3 ]
    [ CategoricalAxis, 7 ]
    [ LinearAxis, 7 ]
    [ Tick, 2 ]
    [ Encoder, 2 ]
    [ ConstantEncoder, 1 ]
    [ VariableEncoder, 3 ]
    [ TooltipEncoder, 1 ]
    [ PositionEncoder, 6 ]
    [ ColorEncoder, 6 ]
    [ OpacityEncoder, 6 ]
    [ SizeEncoder, 6 ]
    [ ShapeEncoder, 6 ]
    [ Channel, 0 ]
    [ ColorChannel, 0 ]
  ]

  t.plan classes.length
  for [ klass, argCount ] in classes
    instance = applyc klass,  args = ({} for i in [0 ... argCount])
    t.assert instance instanceof klass
  return

test 'asReal', (t) ->
  t.plan 6
  c = check t.equal, asReal
  c undefined, undefined
  c undefined, null
  c undefined, 'foo'
  c 0, '0'
  c 1, '1'
  c 1.1, '1.1'

test 'asInt', (t) ->
  t.plan 6
  c = check t.equal, asInt
  c undefined, undefined
  c undefined, null
  c undefined, 'foo'
  c 0, '0'
  c 1, '1'
  c 1, '1.1'

test 'asAny', (t) ->
  t.plan 5
  c = check t.equal, asAny
  c undefined, undefined
  c undefined, null
  c 'foo', 'foo'
  c 10, 10
  c (foo={}), foo

test 'sq', (t) ->
  t.plan 1
  t.equal (sq 3), 9

test 'clampNorm', (t) ->
  t.plan 5
  t.equal (clampNorm 0), 0
  t.equal (clampNorm 0.5), 0.5
  t.equal (clampNorm 1), 1
  t.equal (clampNorm -10), 0
  t.equal (clampNorm 10), 1

test 'copy', (t) ->
  t.plan 2
  t.deepEqual (copy []), []
  foo = {}
  bar = {}
  t.deepEqual (copy [foo, bar]), [foo, bar]

test 'flatMap', (t) ->
  t.plan 2
  t.deepEqual (flatMap []), []
  t.deepEqual (flatMap [ 1, 2, 3, 4 ], ((a) -> [ a, a * a ])), [ 1, 1, 2, 4, 3, 9, 4, 16 ]

test 'operation', (t) ->
  t.plan 2
  add = (a, b) -> a + b
  op1 = operation add, 36, 6
  t.equal op1(), 42

  fortytwo = -> 42
  op2 = operation fortytwo
  t.equal op2(), 42

test 'always', (t) ->
  t.plan 1
  foo = {}
  alwaysFoo = always foo
  t.equal alwaysFoo(), foo

