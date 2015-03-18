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

check = (t, f) ->
  (expected, args...) ->
    actual = f.apply null, args
    t actual, expected 

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


