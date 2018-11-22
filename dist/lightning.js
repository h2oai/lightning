(function () {
    var All, Annotation, AnnotationExpr, Axis, BarEncoding, BarGeometry, BarMark, BooleanValue, Bounds, Box, Canvas, CategoricalAxis, CategoricalRange, Category, Cell, CellSelectEventArg, Channel, Clip, ColEncoding, ColGeometry, ColMark, ColorChannel, ColorEncoder, ColorLimit, ColorPalettes, ColorRange, ColumnSelectEventArg, ConstantCoordChannel, ConstantEncoder, ConstantFillColorChannel, ConstantFillOpacityChannel, ConstantHeightChannel, ConstantLineWidthChannel, ConstantShapeChannel, ConstantSizeChannel, ConstantStrokeColorChannel, ConstantStrokeOpacityChannel, ConstantWidthChannel, CoordChannel, Cube, Datasource, DateValue, Degrees, DeselectEventArg, DivergingColorRange, DivergingRange, DomainX, DomainY, Encoder, Encoding, EpsilonSquare, Extent, Factor, Factoring, Field, Fill, FillColorChannel, FillOpacityChannel, Frame, Geometry, Group, GroupOp, Halfπ, HavingOp, HeaderSelectEventArg, HeightChannel, HoverEventArg, Layer, Level, LimitOp, LineAnnotation, LineExpr, LineWidthChannel, LinearAxis, List, MappedField, Margin, Mark, MarkExpr, Mask, Matcher, MidDot, NumberValue, OpacityEncoder, PathEncoding, PathExpr, PathGeometry, PathMark, Plot, PointEncoding, PointExpr, PointGeometry, PointMark, PositionChannel, PositionEncoder, QuantitativeAxis, QuantitativeRange, Query, Radians, Range, RecordExpr, Rect, RectExpr, ReducedField, Regions, RowSelectEventArg, SchemaExpr, SchemaXEncoding, SchemaXGeometry, SchemaXMark, SchemaYEncoding, SchemaYGeometry, SchemaYMark, SelectEventArg, SelectExpr, SequentialColorRange, SequentialRange, ShapeChannel, ShapeEncoder, ShapePalettes, Shapes, Size, SizeChannel, SizeEncoder, Space1D, Space2D, Sqrt3, StringValue, Stroke, StrokeColorChannel, StrokeOpacityChannel, TArguments, TArray, TBoolean, TDate, TError, TFunction, TNull, TNumber, TObject, TRegExp, TString, TUndefined, Tan30, Tick, TooltipChannel, TooltipEncoder, Transparent, Value, VariableCoordChannel, VariableEncoder, VariableFillColorChannel, VariableFillOpacityChannel, VariableHeightChannel, VariableLineWidthChannel, VariableShapeChannel, VariableSizeChannel, VariableStrokeColorChannel, VariableStrokeOpacityChannel, VariableTooltipChannel, VariableWidthChannel, Vector, Viewport, Visualization, WhereOp, WidthChannel, __emWidth, __isLibInitialized, __scratchCanvas, _createVector, aggregateFrame, aggregate_avg, aggregate_count, aggregate_max, aggregate_min, aggregate_sum, always, applyc, arrayElementsAreEqual, asAny, asInt, asReal, buildHierarchy, byteToHex, captureMouseEvents, clampNorm, clamp_, clipRect, cloneColor, collapseHierarchy, collectFields, colorToStyle, combineExtents, computeApproxAxisSize, computeAxisDomain, computeExtent, computeFunctorExtent, computeSchema, computeSkew0, computeSkew_, copy, createAggregateField, createAllFactor, createAllField, createAnnotation, createAxis, createAxisLabel, createCanvas, createCategoricalScale, createClip, createColorScale, createDOMElement, createDivergingColorScale, createDivergingLinearScale, createEventDispatcher, createExpr_, createExtent, createFactor, createFactorField, createFields, createFrame, createFunctor, createLineAnnotation, createLinearScale, createList, createMark, createMask, createNicedSequentialLinearScale, createOrdinalScale, createPathMark, createPointMark, createQuery, createRectMark, createSchemaMark, createSequentialColorScale, createSequentialLinearScale, createSpace1D, createStackedField, createStylesheet, createTooltipTable, createVector, createViewport, createVisualization, defaultSize, dispatch, dispatch_numeric, doFill, doLine, doRectX, doRectY, doSchemaX, doSchemaY, doStroke, download, drawCircle, drawCross, drawDiamond, drawSquare, drawTriangleDown, drawTriangleLeft, drawTriangleRight, drawTriangleUp, dumpFrame, encodeArea, encodeBarMark, encodeColMark, encodeColor, encodeConstantPosition, encodeFill, encodeHeight, encodeLineWidth, encodeOpacity, encodePathMark, encodePointMark, encodePosition, encodeSchemaXMark, encodeSchemaYMark, encodeShape, encodeSize, encodeStroke, encodeStyle, encodeTooltip, encodeWidth, encode_size, extractFactor, factorize, filterByType, filterFactorDomain, filterFrame, findByType, findByTypes, flatMap, getFFMouseCoords, highlightBarMarks, highlightColMarks, highlightPathMarks, highlightPointMarks, highlightSchemaXMarks, highlightSchemaYMarks, includeOrigin0, includeOrigin_, initFill, initFillAndStroke, initStroke, initializeLib, initializeScratchCanvas, initializeStylesheet, maskBarMarks, maskColMarks, maskPathMarks, maskPointMarks, maskSchemaXMarks, maskSchemaYMarks, operation, pickCategoricalColorPalette, pickCategoricalShapePalette, plot, plot__having, plot__where, plot_aggregate, plot_avg, plot_bounds, plot_computed, plot_count, plot_dataPackage, plot_domainX_HACK, plot_domainY_HACK, plot_eq, plot_factor, plot_fillColor, plot_fillOpacity, plot_from, plot_ge, plot_groupBy, plot_gt, plot_having, plot_height, plot_in, plot_le, plot_like, plot_limit, plot_line, plot_lineWidth, plot_lt, plot_max, plot_min, plot_ne, plot_notIn, plot_parse, plot_path, plot_point, plot_position, plot_range, plot_rect, plot_schema, plot_select, plot_settings, plot_shape, plot_size, plot_stack, plot_strokeColor, plot_strokeOpacity, plot_sum, plot_tooltip, plot_value, plot_where, plot_width, px, quantile_, queryFrame, readCsvAsFrame, readDataPackageSchema, removeDOMChildren, renderAxis, renderAxisX, renderAxisY, renderBarMarks, renderColMarks, renderGridlines, renderGridlinesX, renderGridlinesY, renderHtml, renderLineAnnotation, renderPathMarks, renderPlot, renderPointMarks, renderRecord, renderSchemaXMarks, renderSchemaYMarks, renderTable, renderVisualization, scaleSafe_, selectBarMarks, selectColMarks, selectMarks, selectSchemaXMarks, selectSchemaYMarks, sq, structureOf, typeOf, visualize, ε, π, τ, slice1 = [].slice, extend = function (child, parent) {
            for (var key in parent) {
                if (hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        }, hasProp = {}.hasOwnProperty;
    π = Math.PI;
    τ = 2 * π;
    Halfπ = π / 2;
    ε = 0.000001;
    EpsilonSquare = ε * ε;
    Radians = π / 180;
    Degrees = 180 / π;
    Tan30 = Math.tan(30 * Radians);
    Sqrt3 = Math.sqrt(3);
    ColorLimit = 255 * 255 * 255;
    Transparent = 'transparent';
    MidDot = '&middot;';
    TUndefined = 'undefined';
    TNull = 'null';
    TBoolean = 'Boolean';
    TString = 'String';
    TNumber = 'Number';
    TFunction = 'Function';
    TObject = 'Object';
    TArray = 'Array';
    TArguments = 'Arguments';
    TDate = 'Date';
    TRegExp = 'RegExp';
    TError = 'Error';
    typeOf = function (a) {
        var type;
        type = Object.prototype.toString.call(a);
        if (a === null) {
            return TNull;
        } else if (a === void 0) {
            return TUndefined;
        } else if (a === true || a === false || type === '[object Boolean]') {
            return TBoolean;
        } else {
            switch (type) {
            case '[object String]':
                return TString;
            case '[object Number]':
                return TNumber;
            case '[object Function]':
                return TFunction;
            case '[object Object]':
                return TObject;
            case '[object Array]':
                return TArray;
            case '[object Arguments]':
                return TArguments;
            case '[object Date]':
                return TDate;
            case '[object RegExp]':
                return TRegExp;
            case '[object Error]':
                return TError;
            default:
                return type;
            }
        }
    };
    Matcher = function () {
        function Matcher(match, func1) {
            this.match = match;
            this.func = func1;
        }
        return Matcher;
    }();
    dispatch = function () {
        var matchPattern_, matchPatterns_;
        matchPattern_ = function (pattern) {
            var matchElement, type, type1;
            type = typeOf(pattern);
            switch (type) {
            case TUndefined:
                return function (a) {
                    return a === void 0;
                };
            case TNull:
                return function (a) {
                    return a === null;
                };
            case TBoolean:
                return function (a) {
                    return pattern === Boolean || a === pattern;
                };
            case TString:
                return function (a) {
                    return pattern === String || a === pattern;
                };
            case TNumber:
                return function (a) {
                    return pattern === Number || a === pattern || _.isNaN(a) && _.isNaN(pattern);
                };
            case TRegExp:
                return function () {
                    return pattern === RegExp;
                };
            case Error:
                return function () {
                    return pattern === Error;
                };
            case TDate:
                return function (a) {
                    return pattern === Date || a === pattern;
                };
            case TArray:
                if (pattern.length === 1 && TFunction === (type1 = typeOf(pattern[0]))) {
                    matchElement = matchPattern_(pattern[0]);
                    return function (xs) {
                        var l, len, x;
                        if (TArray !== typeOf(xs)) {
                            return false;
                        }
                        for (l = 0, len = xs.length; l < len; l++) {
                            x = xs[l];
                            if (!matchElement(x)) {
                                return false;
                            }
                        }
                        return true;
                    };
                } else {
                    return function (a) {
                        return pattern === Array || arrayElementsAreEqual(pattern, a);
                    };
                }
                break;
            case TFunction:
                return function (a) {
                    var t;
                    if (a instanceof pattern) {
                        return true;
                    }
                    if (a && a.constructor === pattern) {
                        return true;
                    }
                    t = typeOf(a);
                    return pattern === Boolean && t === TBoolean || pattern === String && t === TString || pattern === Number && t === TNumber;
                };
            case TObject:
                return function (a) {
                    var k, v;
                    for (k in pattern) {
                        v = pattern[k];
                        if (a[k] !== v) {
                            return false;
                        }
                    }
                    return true;
                };
            default:
                return function () {
                    return false;
                };
            }
        };
        matchPatterns_ = function (patterns) {
            var matchers;
            matchers = _.map(patterns, matchPattern_);
            return function (args) {
                var check, i, l, len;
                if (args.length === 0) {
                    return false;
                }
                if (args.length !== matchers.length) {
                    return false;
                }
                for (i = l = 0, len = matchers.length; l < len; i = ++l) {
                    check = matchers[i];
                    if (!check(args[i])) {
                        return false;
                    }
                }
                return true;
            };
        };
        return function () {
            var exprs, matchers;
            exprs = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
            matchers = _.map(exprs, function (arg1) {
                var func, l, patterns;
                patterns = 2 <= arg1.length ? slice1.call(arg1, 0, l = arg1.length - 1) : (l = 0, []), func = arg1[l++];
                return new Matcher(matchPatterns_(patterns), func);
            });
            return function () {
                var args, l, len, matcher;
                args = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
                for (l = 0, len = matchers.length; l < len; l++) {
                    matcher = matchers[l];
                    if (matcher.match(args)) {
                        return matcher.func.apply(null, args);
                    }
                }
                throw new Error('Pattern match failure for args [ ' + _.map(args, function (arg) {
                    return '' + arg + ':' + typeOf(arg);
                }).join(', ') + ' ]');
            };
        };
    }();
    applyc = function (ctor, args) {
        return new (ctor.bind.apply(ctor, [null].concat(args)))();
    };
    Clip = function () {
        function Clip(put1, test1) {
            this.put = put1;
            this.test = test1;
        }
        return Clip;
    }();
    Mask = function () {
        function Mask(put1, test1) {
            this.put = put1;
            this.test = test1;
        }
        return Mask;
    }();
    Size = function () {
        function Size(width1, height1) {
            this.width = width1;
            this.height = height1;
        }
        return Size;
    }();
    Rect = function () {
        function Rect(left1, top, width1, height1) {
            this.left = left1;
            this.top = top;
            this.width = width1;
            this.height = height1;
        }
        return Rect;
    }();
    Vector = function () {
        function Vector(name1, label1, type2, at1, count1, domain1, format1) {
            this.name = name1;
            this.label = label1;
            this.type = type2;
            this.at = at1;
            this.count = count1;
            this.domain = domain1;
            this.format = format1;
        }
        return Vector;
    }();
    Factor = function (superClass) {
        extend(Factor, superClass);
        function Factor(name, label, type, at, valueAt1, count, domain, format) {
            this.valueAt = valueAt1;
            Factor.__super__.constructor.call(this, name, label, type, at, count, domain, format);
        }
        return Factor;
    }(Vector);
    List = function (superClass) {
        extend(List, superClass);
        function List(name, label, at, count, domain, format) {
            List.__super__.constructor.call(this, name, label, TObject, at, count, domain, format);
        }
        return List;
    }(Vector);
    Group = function () {
        function Group() {
        }
        return Group;
    }();
    Frame = function () {
        function Frame(label1, vectors1, schema1, indices1, cube1, at1, evaluate, attach, metadata1) {
            this.label = label1;
            this.vectors = vectors1;
            this.schema = schema1;
            this.indices = indices1;
            this.cube = cube1;
            this.at = at1;
            this.evaluate = evaluate;
            this.attach = attach;
            this.metadata = metadata1;
        }
        return Frame;
    }();
    Value = function () {
        function Value(value1) {
            this.value = value1;
        }
        return Value;
    }();
    NumberValue = function (superClass) {
        extend(NumberValue, superClass);
        function NumberValue(value) {
            NumberValue.__super__.constructor.call(this, value);
        }
        return NumberValue;
    }(Value);
    StringValue = function (superClass) {
        extend(StringValue, superClass);
        function StringValue(value) {
            StringValue.__super__.constructor.call(this, value);
        }
        return StringValue;
    }(Value);
    DateValue = function (superClass) {
        extend(DateValue, superClass);
        function DateValue(value) {
            DateValue.__super__.constructor.call(this, value);
        }
        return DateValue;
    }(Value);
    BooleanValue = function (superClass) {
        extend(BooleanValue, superClass);
        function BooleanValue(value) {
            BooleanValue.__super__.constructor.call(this, value);
        }
        return BooleanValue;
    }(Value);
    Field = function () {
        function Field(name1) {
            this.name = name1;
        }
        return Field;
    }();
    MappedField = function (superClass) {
        extend(MappedField, superClass);
        function MappedField(evaluate) {
            this.evaluate = evaluate;
        }
        return MappedField;
    }(Field);
    ReducedField = function (superClass) {
        extend(ReducedField, superClass);
        function ReducedField(evaluate) {
            this.evaluate = evaluate;
        }
        return ReducedField;
    }(Field);
    Fill = function () {
        function Fill(color1, opacity1) {
            this.color = color1;
            this.opacity = opacity1;
        }
        return Fill;
    }();
    Stroke = function () {
        function Stroke(color1, opacity1, size1) {
            this.color = color1;
            this.opacity = opacity1;
            this.size = size1;
        }
        return Stroke;
    }();
    SelectExpr = function () {
        function SelectExpr(fields1) {
            this.fields = fields1;
        }
        return SelectExpr;
    }();
    RecordExpr = function () {
        function RecordExpr(index1) {
            this.index = index1;
        }
        return RecordExpr;
    }();
    MarkExpr = function () {
        function MarkExpr() {
        }
        return MarkExpr;
    }();
    PointExpr = function (superClass) {
        extend(PointExpr, superClass);
        function PointExpr(position1, shape1, size1, fillColor1, fillOpacity1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.position = position1;
            this.shape = shape1;
            this.size = size1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return PointExpr;
    }(MarkExpr);
    PathExpr = function (superClass) {
        extend(PathExpr, superClass);
        function PathExpr(position1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.position = position1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return PathExpr;
    }(MarkExpr);
    SchemaExpr = function (superClass) {
        extend(SchemaExpr, superClass);
        function SchemaExpr(position1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.position = position1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return SchemaExpr;
    }(MarkExpr);
    RectExpr = function (superClass) {
        extend(RectExpr, superClass);
        function RectExpr(position1, width1, height1, fillColor1, fillOpacity1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.position = position1;
            this.width = width1;
            this.height = height1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return RectExpr;
    }(MarkExpr);
    AnnotationExpr = function () {
        function AnnotationExpr() {
        }
        return AnnotationExpr;
    }();
    LineExpr = function (superClass) {
        extend(LineExpr, superClass);
        function LineExpr(position1, strokeColor1, strokeOpacity1, lineWidth1) {
            this.position = position1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
        }
        return LineExpr;
    }(AnnotationExpr);
    Annotation = function () {
        function Annotation() {
        }
        return Annotation;
    }();
    LineAnnotation = function (superClass) {
        extend(LineAnnotation, superClass);
        function LineAnnotation(slope1, intercept1, strokeColor1, strokeOpacity1, lineWidth1) {
            this.slope = slope1;
            this.intercept = intercept1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.render = renderLineAnnotation;
        }
        return LineAnnotation;
    }(Annotation);
    Mark = function () {
        function Mark() {
        }
        return Mark;
    }();
    PointMark = function (superClass) {
        extend(PointMark, superClass);
        function PointMark(space1, positionX3, positionY3, shape1, size1, fillColor1, fillOpacity1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.space = space1;
            this.positionX = positionX3;
            this.positionY = positionY3;
            this.shape = shape1;
            this.size = size1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
            this.geometry = PointGeometry;
        }
        return PointMark;
    }(Mark);
    SchemaXMark = function (superClass) {
        extend(SchemaXMark, superClass);
        function SchemaXMark(space1, q01, q11, q21, q31, qn1, positionY3, height1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.space = space1;
            this.q0 = q01;
            this.q1 = q11;
            this.q2 = q21;
            this.q3 = q31;
            this.qn = qn1;
            this.positionY = positionY3;
            this.height = height1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
            this.geometry = SchemaXGeometry;
        }
        return SchemaXMark;
    }(Mark);
    SchemaYMark = function (superClass) {
        extend(SchemaYMark, superClass);
        function SchemaYMark(space1, positionX3, q01, q11, q21, q31, qn1, width1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.space = space1;
            this.positionX = positionX3;
            this.q0 = q01;
            this.q1 = q11;
            this.q2 = q21;
            this.q3 = q31;
            this.qn = qn1;
            this.width = width1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
            this.geometry = SchemaYGeometry;
        }
        return SchemaYMark;
    }(Mark);
    ColMark = function (superClass) {
        extend(ColMark, superClass);
        function ColMark(space1, positionX3, positionY11, positionY21, width1, fillColor1, fillOpacity1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.space = space1;
            this.positionX = positionX3;
            this.positionY1 = positionY11;
            this.positionY2 = positionY21;
            this.width = width1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
            this.geometry = ColGeometry;
        }
        return ColMark;
    }(Mark);
    BarMark = function (superClass) {
        extend(BarMark, superClass);
        function BarMark(space1, positionX11, positionX21, positionY3, height1, fillColor1, fillOpacity1, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.space = space1;
            this.positionX1 = positionX11;
            this.positionX2 = positionX21;
            this.positionY = positionY3;
            this.height = height1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
            this.geometry = BarGeometry;
        }
        return BarMark;
    }(Mark);
    PathMark = function (superClass) {
        extend(PathMark, superClass);
        function PathMark(space1, positionX3, positionY3, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.space = space1;
            this.positionX = positionX3;
            this.positionY = positionY3;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
            this.geometry = PathGeometry;
        }
        return PathMark;
    }(Mark);
    Encoding = function () {
        function Encoding() {
        }
        return Encoding;
    }();
    PointEncoding = function (superClass) {
        extend(PointEncoding, superClass);
        function PointEncoding(positionX3, positionY3, shape1, size1, fill1, fillColor1, fillOpacity1, stroke3, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.positionX = positionX3;
            this.positionY = positionY3;
            this.shape = shape1;
            this.size = size1;
            this.fill = fill1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.stroke = stroke3;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return PointEncoding;
    }(Encoding);
    SchemaXEncoding = function (superClass) {
        extend(SchemaXEncoding, superClass);
        function SchemaXEncoding(q01, q11, q21, q31, qn1, positionY3, height1, stroke3, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.q0 = q01;
            this.q1 = q11;
            this.q2 = q21;
            this.q3 = q31;
            this.qn = qn1;
            this.positionY = positionY3;
            this.height = height1;
            this.stroke = stroke3;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return SchemaXEncoding;
    }(Encoding);
    SchemaYEncoding = function (superClass) {
        extend(SchemaYEncoding, superClass);
        function SchemaYEncoding(positionX3, q01, q11, q21, q31, qn1, width1, stroke3, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.positionX = positionX3;
            this.q0 = q01;
            this.q1 = q11;
            this.q2 = q21;
            this.q3 = q31;
            this.qn = qn1;
            this.width = width1;
            this.stroke = stroke3;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return SchemaYEncoding;
    }(Encoding);
    ColEncoding = function (superClass) {
        extend(ColEncoding, superClass);
        function ColEncoding(positionX3, positionY11, positionY21, width1, fill1, fillColor1, fillOpacity1, stroke3, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.positionX = positionX3;
            this.positionY1 = positionY11;
            this.positionY2 = positionY21;
            this.width = width1;
            this.fill = fill1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.stroke = stroke3;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return ColEncoding;
    }(Encoding);
    BarEncoding = function (superClass) {
        extend(BarEncoding, superClass);
        function BarEncoding(positionX11, positionX21, positionY3, height1, fill1, fillColor1, fillOpacity1, stroke3, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.positionX1 = positionX11;
            this.positionX2 = positionX21;
            this.positionY = positionY3;
            this.height = height1;
            this.fill = fill1;
            this.fillColor = fillColor1;
            this.fillOpacity = fillOpacity1;
            this.stroke = stroke3;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return BarEncoding;
    }(Encoding);
    PathEncoding = function (superClass) {
        extend(PathEncoding, superClass);
        function PathEncoding(positionX3, positionY3, stroke3, strokeColor1, strokeOpacity1, lineWidth1, tooltip1) {
            this.positionX = positionX3;
            this.positionY = positionY3;
            this.stroke = stroke3;
            this.strokeColor = strokeColor1;
            this.strokeOpacity = strokeOpacity1;
            this.lineWidth = lineWidth1;
            this.tooltip = tooltip1;
        }
        return PathEncoding;
    }(Encoding);
    Space2D = function () {
        function Space2D(x3, y3) {
            this.x = x3;
            this.y = y3;
        }
        return Space2D;
    }();
    Space1D = function () {
        function Space1D(type2, vectors1, domain1) {
            this.type = type2;
            this.vectors = vectors1;
            this.domain = domain1;
        }
        return Space1D;
    }();
    Axis = function () {
        function Axis() {
        }
        return Axis;
    }();
    CategoricalAxis = function (superClass) {
        extend(CategoricalAxis, superClass);
        function CategoricalAxis(type2, label1, scale1, domain1, range1, rect1, guide1) {
            this.type = type2;
            this.label = label1;
            this.scale = scale1;
            this.domain = domain1;
            this.range = range1;
            this.rect = rect1;
            this.guide = guide1;
        }
        return CategoricalAxis;
    }(Axis);
    QuantitativeAxis = function (superClass) {
        extend(QuantitativeAxis, superClass);
        function QuantitativeAxis() {
            return QuantitativeAxis.__super__.constructor.apply(this, arguments);
        }
        return QuantitativeAxis;
    }(Axis);
    LinearAxis = function (superClass) {
        extend(LinearAxis, superClass);
        function LinearAxis(type2, label1, scale1, domain1, range1, rect1, guide1) {
            this.type = type2;
            this.label = label1;
            this.scale = scale1;
            this.domain = domain1;
            this.range = range1;
            this.rect = rect1;
            this.guide = guide1;
        }
        return LinearAxis;
    }(QuantitativeAxis);
    Tick = function () {
        function Tick(value1, label1) {
            this.value = value1;
            this.label = label1;
        }
        return Tick;
    }();
    Encoder = function () {
        function Encoder(label1, encode1) {
            this.label = label1;
            this.encode = encode1;
        }
        return Encoder;
    }();
    ConstantEncoder = function (superClass) {
        extend(ConstantEncoder, superClass);
        function ConstantEncoder(value1) {
            this.value = value1;
            ConstantEncoder.__super__.constructor.call(this, 'Constant', always(this.value));
        }
        return ConstantEncoder;
    }(Encoder);
    VariableEncoder = function (superClass) {
        extend(VariableEncoder, superClass);
        function VariableEncoder(label, encode, vector1) {
            this.vector = vector1;
            VariableEncoder.__super__.constructor.call(this, label, encode);
        }
        return VariableEncoder;
    }(Encoder);
    TooltipEncoder = function (superClass) {
        extend(TooltipEncoder, superClass);
        function TooltipEncoder(vectors1) {
            this.vectors = vectors1;
            TooltipEncoder.__super__.constructor.call(this, 'tooltips');
        }
        return TooltipEncoder;
    }(Encoder);
    PositionEncoder = function (superClass) {
        extend(PositionEncoder, superClass);
        function PositionEncoder(label, encode, vector, domain1, range1, guide1) {
            this.domain = domain1;
            this.range = range1;
            this.guide = guide1;
            PositionEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return PositionEncoder;
    }(VariableEncoder);
    ColorEncoder = function (superClass) {
        extend(ColorEncoder, superClass);
        function ColorEncoder(label, encode, vector, domain1, range1, guide1) {
            this.domain = domain1;
            this.range = range1;
            this.guide = guide1;
            ColorEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return ColorEncoder;
    }(VariableEncoder);
    OpacityEncoder = function (superClass) {
        extend(OpacityEncoder, superClass);
        function OpacityEncoder(label, encode, vector, domain1, range1, guide1) {
            this.domain = domain1;
            this.range = range1;
            this.guide = guide1;
            OpacityEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return OpacityEncoder;
    }(VariableEncoder);
    SizeEncoder = function (superClass) {
        extend(SizeEncoder, superClass);
        function SizeEncoder(label, encode, vector, domain1, range1, guide1) {
            this.domain = domain1;
            this.range = range1;
            this.guide = guide1;
            SizeEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return SizeEncoder;
    }(VariableEncoder);
    ShapeEncoder = function (superClass) {
        extend(ShapeEncoder, superClass);
        function ShapeEncoder(label, encode, vector, domain1, range1, guide1) {
            this.domain = domain1;
            this.range = range1;
            this.guide = guide1;
            ShapeEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return ShapeEncoder;
    }(VariableEncoder);
    Channel = function () {
        function Channel() {
        }
        return Channel;
    }();
    ColorChannel = function (superClass) {
        extend(ColorChannel, superClass);
        function ColorChannel() {
            return ColorChannel.__super__.constructor.apply(this, arguments);
        }
        return ColorChannel;
    }(Channel);
    CoordChannel = function (superClass) {
        extend(CoordChannel, superClass);
        function CoordChannel() {
            return CoordChannel.__super__.constructor.apply(this, arguments);
        }
        return CoordChannel;
    }(Channel);
    PositionChannel = function (superClass) {
        extend(PositionChannel, superClass);
        function PositionChannel(coordinates) {
            this.coordinates = coordinates;
        }
        return PositionChannel;
    }(Channel);
    FillColorChannel = function (superClass) {
        extend(FillColorChannel, superClass);
        function FillColorChannel() {
            return FillColorChannel.__super__.constructor.apply(this, arguments);
        }
        return FillColorChannel;
    }(Channel);
    FillOpacityChannel = function (superClass) {
        extend(FillOpacityChannel, superClass);
        function FillOpacityChannel() {
            return FillOpacityChannel.__super__.constructor.apply(this, arguments);
        }
        return FillOpacityChannel;
    }(Channel);
    StrokeColorChannel = function (superClass) {
        extend(StrokeColorChannel, superClass);
        function StrokeColorChannel() {
            return StrokeColorChannel.__super__.constructor.apply(this, arguments);
        }
        return StrokeColorChannel;
    }(Channel);
    StrokeOpacityChannel = function (superClass) {
        extend(StrokeOpacityChannel, superClass);
        function StrokeOpacityChannel() {
            return StrokeOpacityChannel.__super__.constructor.apply(this, arguments);
        }
        return StrokeOpacityChannel;
    }(Channel);
    SizeChannel = function (superClass) {
        extend(SizeChannel, superClass);
        function SizeChannel() {
            return SizeChannel.__super__.constructor.apply(this, arguments);
        }
        return SizeChannel;
    }(Channel);
    WidthChannel = function (superClass) {
        extend(WidthChannel, superClass);
        function WidthChannel() {
            return WidthChannel.__super__.constructor.apply(this, arguments);
        }
        return WidthChannel;
    }(Channel);
    HeightChannel = function (superClass) {
        extend(HeightChannel, superClass);
        function HeightChannel() {
            return HeightChannel.__super__.constructor.apply(this, arguments);
        }
        return HeightChannel;
    }(Channel);
    LineWidthChannel = function (superClass) {
        extend(LineWidthChannel, superClass);
        function LineWidthChannel() {
            return LineWidthChannel.__super__.constructor.apply(this, arguments);
        }
        return LineWidthChannel;
    }(Channel);
    ShapeChannel = function (superClass) {
        extend(ShapeChannel, superClass);
        function ShapeChannel() {
            return ShapeChannel.__super__.constructor.apply(this, arguments);
        }
        return ShapeChannel;
    }(Channel);
    TooltipChannel = function (superClass) {
        extend(TooltipChannel, superClass);
        function TooltipChannel() {
            return TooltipChannel.__super__.constructor.apply(this, arguments);
        }
        return TooltipChannel;
    }(Channel);
    ConstantCoordChannel = function (superClass) {
        extend(ConstantCoordChannel, superClass);
        function ConstantCoordChannel(value1) {
            this.value = value1;
        }
        return ConstantCoordChannel;
    }(CoordChannel);
    VariableCoordChannel = function (superClass) {
        extend(VariableCoordChannel, superClass);
        function VariableCoordChannel(field1) {
            this.field = field1;
        }
        return VariableCoordChannel;
    }(CoordChannel);
    ConstantFillColorChannel = function (superClass) {
        extend(ConstantFillColorChannel, superClass);
        function ConstantFillColorChannel(value1) {
            this.value = value1;
        }
        return ConstantFillColorChannel;
    }(FillColorChannel);
    VariableFillColorChannel = function (superClass) {
        extend(VariableFillColorChannel, superClass);
        function VariableFillColorChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableFillColorChannel;
    }(FillColorChannel);
    ConstantFillOpacityChannel = function (superClass) {
        extend(ConstantFillOpacityChannel, superClass);
        function ConstantFillOpacityChannel(value1) {
            this.value = value1;
        }
        return ConstantFillOpacityChannel;
    }(FillOpacityChannel);
    VariableFillOpacityChannel = function (superClass) {
        extend(VariableFillOpacityChannel, superClass);
        function VariableFillOpacityChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableFillOpacityChannel;
    }(FillOpacityChannel);
    ConstantStrokeColorChannel = function (superClass) {
        extend(ConstantStrokeColorChannel, superClass);
        function ConstantStrokeColorChannel(value1) {
            this.value = value1;
        }
        return ConstantStrokeColorChannel;
    }(StrokeColorChannel);
    VariableStrokeColorChannel = function (superClass) {
        extend(VariableStrokeColorChannel, superClass);
        function VariableStrokeColorChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableStrokeColorChannel;
    }(StrokeColorChannel);
    ConstantStrokeOpacityChannel = function (superClass) {
        extend(ConstantStrokeOpacityChannel, superClass);
        function ConstantStrokeOpacityChannel(value1) {
            this.value = value1;
        }
        return ConstantStrokeOpacityChannel;
    }(StrokeOpacityChannel);
    VariableStrokeOpacityChannel = function (superClass) {
        extend(VariableStrokeOpacityChannel, superClass);
        function VariableStrokeOpacityChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableStrokeOpacityChannel;
    }(StrokeOpacityChannel);
    ConstantSizeChannel = function (superClass) {
        extend(ConstantSizeChannel, superClass);
        function ConstantSizeChannel(value1) {
            this.value = value1;
        }
        return ConstantSizeChannel;
    }(SizeChannel);
    VariableSizeChannel = function (superClass) {
        extend(VariableSizeChannel, superClass);
        function VariableSizeChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableSizeChannel;
    }(SizeChannel);
    ConstantWidthChannel = function (superClass) {
        extend(ConstantWidthChannel, superClass);
        function ConstantWidthChannel(value1) {
            this.value = value1;
        }
        return ConstantWidthChannel;
    }(WidthChannel);
    VariableWidthChannel = function (superClass) {
        extend(VariableWidthChannel, superClass);
        function VariableWidthChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableWidthChannel;
    }(WidthChannel);
    ConstantHeightChannel = function (superClass) {
        extend(ConstantHeightChannel, superClass);
        function ConstantHeightChannel(value1) {
            this.value = value1;
        }
        return ConstantHeightChannel;
    }(HeightChannel);
    VariableHeightChannel = function (superClass) {
        extend(VariableHeightChannel, superClass);
        function VariableHeightChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableHeightChannel;
    }(HeightChannel);
    ConstantLineWidthChannel = function (superClass) {
        extend(ConstantLineWidthChannel, superClass);
        function ConstantLineWidthChannel(value1) {
            this.value = value1;
        }
        return ConstantLineWidthChannel;
    }(LineWidthChannel);
    VariableLineWidthChannel = function (superClass) {
        extend(VariableLineWidthChannel, superClass);
        function VariableLineWidthChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableLineWidthChannel;
    }(LineWidthChannel);
    ConstantShapeChannel = function (superClass) {
        extend(ConstantShapeChannel, superClass);
        function ConstantShapeChannel(value1) {
            this.value = value1;
        }
        return ConstantShapeChannel;
    }(ShapeChannel);
    VariableShapeChannel = function (superClass) {
        extend(VariableShapeChannel, superClass);
        function VariableShapeChannel(field1, range1) {
            this.field = field1;
            this.range = range1;
        }
        return VariableShapeChannel;
    }(ShapeChannel);
    VariableTooltipChannel = function (superClass) {
        extend(VariableTooltipChannel, superClass);
        function VariableTooltipChannel(fields1) {
            this.fields = fields1;
        }
        return VariableTooltipChannel;
    }(TooltipChannel);
    Extent = function () {
        function Extent(min1, max1) {
            this.min = min1;
            this.max = max1;
        }
        return Extent;
    }();
    DomainX = function () {
        function DomainX(min1, max1) {
            this.min = min1;
            this.max = max1;
        }
        return DomainX;
    }();
    DomainY = function () {
        function DomainY(min1, max1) {
            this.min = min1;
            this.max = max1;
        }
        return DomainY;
    }();
    Range = function () {
        function Range() {
        }
        return Range;
    }();
    CategoricalRange = function (superClass) {
        extend(CategoricalRange, superClass);
        function CategoricalRange(values1) {
            this.values = values1;
        }
        return CategoricalRange;
    }(Range);
    QuantitativeRange = function (superClass) {
        extend(QuantitativeRange, superClass);
        function QuantitativeRange() {
            return QuantitativeRange.__super__.constructor.apply(this, arguments);
        }
        return QuantitativeRange;
    }(Range);
    SequentialRange = function (superClass) {
        extend(SequentialRange, superClass);
        function SequentialRange(min1, max1) {
            this.min = min1;
            this.max = max1;
        }
        return SequentialRange;
    }(QuantitativeRange);
    DivergingRange = function (superClass) {
        extend(DivergingRange, superClass);
        function DivergingRange(min1, mid, max1) {
            this.min = min1;
            this.mid = mid;
            this.max = max1;
        }
        return DivergingRange;
    }(QuantitativeRange);
    ColorRange = function (superClass) {
        extend(ColorRange, superClass);
        function ColorRange() {
            return ColorRange.__super__.constructor.apply(this, arguments);
        }
        return ColorRange;
    }(Range);
    SequentialColorRange = function (superClass) {
        extend(SequentialColorRange, superClass);
        function SequentialColorRange(min1, max1) {
            this.min = min1;
            this.max = max1;
        }
        return SequentialColorRange;
    }(ColorRange);
    DivergingColorRange = function (superClass) {
        extend(DivergingColorRange, superClass);
        function DivergingColorRange(min1, mid, max1) {
            this.min = min1;
            this.mid = mid;
            this.max = max1;
        }
        return DivergingColorRange;
    }(ColorRange);
    Geometry = function () {
        function Geometry(encode1, mask1, highlight1, render1, select) {
            this.encode = encode1;
            this.mask = mask1;
            this.highlight = highlight1;
            this.render = render1;
            this.select = select;
        }
        return Geometry;
    }();
    Datasource = function () {
        function Datasource(read1) {
            this.read = read1;
        }
        return Datasource;
    }();
    Canvas = function () {
        function Canvas(element1, context1, bounds1, ratio1) {
            this.element = element1;
            this.context = context1;
            this.bounds = bounds1;
            this.ratio = ratio1;
        }
        return Canvas;
    }();
    Viewport = function () {
        function Viewport(box1, container1, baseCanvas1, highlightCanvas1, hoverCanvas1, maskCanvas1, clipCanvas1, marquee1, tooltip1, mask1, clip1) {
            this.box = box1;
            this.container = container1;
            this.baseCanvas = baseCanvas1;
            this.highlightCanvas = highlightCanvas1;
            this.hoverCanvas = hoverCanvas1;
            this.maskCanvas = maskCanvas1;
            this.clipCanvas = clipCanvas1;
            this.marquee = marquee1;
            this.tooltip = tooltip1;
            this.mask = mask1;
            this.clip = clip1;
        }
        return Viewport;
    }();
    Layer = function () {
        function Layer(encodings1, encoders1, mask1, highlight1, render1, select) {
            this.encodings = encodings1;
            this.encoders = encoders1;
            this.mask = mask1;
            this.highlight = highlight1;
            this.render = render1;
            this.select = select;
        }
        return Layer;
    }();
    Visualization = function () {
        function Visualization(viewport, frame1, test1, highlight1, hover1, selectAt1, selectWithin1, render1) {
            this.viewport = viewport;
            this.frame = frame1;
            this.test = test1;
            this.highlight = highlight1;
            this.hover = hover1;
            this.selectAt = selectAt1;
            this.selectWithin = selectWithin1;
            this.render = render1;
        }
        return Visualization;
    }();
    Plot = function () {
        function Plot(element1, subscribe1, unsubscribe1, highlight1) {
            this.element = element1;
            this.subscribe = subscribe1;
            this.unsubscribe = unsubscribe1;
            this.highlight = highlight1;
        }
        return Plot;
    }();
    Bounds = function () {
        function Bounds(width1, height1) {
            this.width = width1;
            this.height = height1;
        }
        return Bounds;
    }();
    Regions = function () {
        function Regions(center, left1, top, right1, bottom) {
            this.center = center;
            this.left = left1;
            this.top = top;
            this.right = right1;
            this.bottom = bottom;
        }
        return Regions;
    }();
    Margin = function () {
        function Margin(left1, top, right1, bottom) {
            this.left = left1;
            this.top = top;
            this.right = right1;
            this.bottom = bottom;
        }
        return Margin;
    }();
    Box = function () {
        function Box(width, height, margin) {
            var rect;
            this.width = width;
            this.height = height;
            this.margin = margin;
            this.regions = new Regions(rect = new Rect(margin.left, margin.top, width - margin.left - margin.right, height - margin.top - margin.bottom), new Rect(0, margin.top, margin.left, rect.height), new Rect(margin.left + rect.width, margin.top, margin.right, rect.height), new Rect(margin.left, 0, rect.width, margin.top), new Rect(margin.left, margin.top + rect.height, rect.width, margin.bottom));
        }
        return Box;
    }();
    Query = function () {
        function Query(where, limit1, group, having) {
            this.where = where;
            this.limit = limit1;
            this.group = group;
            this.having = having;
        }
        return Query;
    }();
    Category = function () {
        function Category(key1, value1) {
            this.key = key1;
            this.value = value1;
        }
        return Category;
    }();
    All = new Category(0, 'All');
    Cube = function () {
        function Cube(frame1, hierarchy1, cells1, dimension) {
            this.frame = frame1;
            this.hierarchy = hierarchy1;
            this.cells = cells1;
            this.dimension = dimension;
        }
        return Cube;
    }();
    Level = function () {
        function Level(category1, indices1, children1) {
            this.category = category1;
            this.indices = indices1;
            this.children = children1;
        }
        return Level;
    }();
    Cell = function () {
        function Cell(levels1, indices1) {
            this.levels = levels1;
            this.indices = indices1;
        }
        return Cell;
    }();
    Factoring = function () {
        function Factoring(at1, valueAt1, count1, domain1, format1) {
            this.at = at1;
            this.valueAt = valueAt1;
            this.count = count1;
            this.domain = domain1;
            this.format = format1;
        }
        return Factoring;
    }();
    GroupOp = function () {
        function GroupOp(fields1) {
            this.fields = fields1;
        }
        return GroupOp;
    }();
    WhereOp = function () {
        function WhereOp(fields1, predicate) {
            this.fields = fields1;
            this.predicate = predicate;
        }
        return WhereOp;
    }();
    LimitOp = function () {
        function LimitOp(offset1, length1) {
            this.offset = offset1;
            this.length = length1;
        }
        return LimitOp;
    }();
    HavingOp = function () {
        function HavingOp(fields1, predicate) {
            this.fields = fields1;
            this.predicate = predicate;
        }
        return HavingOp;
    }();
    HoverEventArg = function () {
        function HoverEventArg(frame1, index1) {
            this.frame = frame1;
            this.index = index1;
        }
        return HoverEventArg;
    }();
    SelectEventArg = function () {
        function SelectEventArg(frame1, indices1) {
            this.frame = frame1;
            this.indices = indices1;
        }
        return SelectEventArg;
    }();
    DeselectEventArg = function () {
        function DeselectEventArg(frame1) {
            this.frame = frame1;
        }
        return DeselectEventArg;
    }();
    ColumnSelectEventArg = function () {
        function ColumnSelectEventArg(vector1) {
            this.vector = vector1;
        }
        return ColumnSelectEventArg;
    }();
    HeaderSelectEventArg = function () {
        function HeaderSelectEventArg(vector1) {
            this.vector = vector1;
        }
        return HeaderSelectEventArg;
    }();
    RowSelectEventArg = function () {
        function RowSelectEventArg(index1) {
            this.index = index1;
        }
        return RowSelectEventArg;
    }();
    CellSelectEventArg = function () {
        function CellSelectEventArg(vector1, index1) {
            this.vector = vector1;
            this.index = index1;
        }
        return CellSelectEventArg;
    }();
    asReal = function (datum) {
        var value;
        value = parseFloat(datum);
        if (_.isNaN(value)) {
            return void 0;
        } else {
            return value;
        }
    };
    asInt = function (datum) {
        var value;
        value = parseInt(datum, 10);
        if (_.isNaN(value)) {
            return void 0;
        } else {
            return value;
        }
    };
    asAny = function (datum) {
        if (datum != null) {
            return datum;
        } else {
            return void 0;
        }
    };
    sq = function (x) {
        return x * x;
    };
    clamp_ = function (min, max) {
        return function (value) {
            if (value < min) {
                return min;
            } else if (value > max) {
                return max;
            } else {
                return value;
            }
        };
    };
    clampNorm = clamp_(0, 1);
    defaultSize = 8;
    copy = function (a) {
        return a.slice(0);
    };
    flatMap = function (xs, f) {
        var l, len, len1, m, ref, x, y, ys;
        ys = [];
        for (l = 0, len = xs.length; l < len; l++) {
            x = xs[l];
            ref = f(x);
            for (m = 0, len1 = ref.length; m < len1; m++) {
                y = ref[m];
                ys.push(y);
            }
        }
        return ys;
    };
    operation = function () {
        var args, f;
        f = arguments[0], args = 2 <= arguments.length ? slice1.call(arguments, 1) : [];
        return function () {
            return f.apply(null, args);
        };
    };
    always = function (value) {
        return function () {
            return value;
        };
    };
    arrayElementsAreEqual = function (xs, ys) {
        var i, l, len, x;
        if (xs && ys && xs.length === ys.length) {
            for (i = l = 0, len = xs.length; l < len; i = ++l) {
                x = xs[i];
                if (x !== ys[i]) {
                    return false;
                }
            }
            return true;
        } else {
            return false;
        }
    };
    filterByType = function () {
        var arg, args, filtered, l, len, len1, m, type, types;
        args = arguments[0], types = 2 <= arguments.length ? slice1.call(arguments, 1) : [];
        filtered = [];
        for (l = 0, len = args.length; l < len; l++) {
            arg = args[l];
            for (m = 0, len1 = types.length; m < len1; m++) {
                type = types[m];
                if (arg instanceof type) {
                    filtered.push(arg);
                }
            }
        }
        return filtered;
    };
    findByType = function () {
        var arg, args, l, len, len1, m, type, types;
        args = arguments[0], types = 2 <= arguments.length ? slice1.call(arguments, 1) : [];
        for (l = 0, len = args.length; l < len; l++) {
            arg = args[l];
            for (m = 0, len1 = types.length; m < len1; m++) {
                type = types[m];
                if (arg instanceof type) {
                    return arg;
                }
            }
        }
    };
    findByTypes = function (args, types) {
        var l, len, results, type;
        results = [];
        for (l = 0, len = types.length; l < len; l++) {
            type = types[l];
            results.push(findByType(args, type));
        }
        return results;
    };
    createExtent = function (a, b) {
        if (a < b) {
            return new Extent(a, b);
        } else {
            return new Extent(b, a);
        }
    };
    computeExtent = function (array) {
        var l, len, max, min, value;
        min = Number.POSITIVE_INFINITY;
        max = Number.NEGATIVE_INFINITY;
        for (l = 0, len = array.length; l < len; l++) {
            value = array[l];
            if (value !== void 0) {
                if (value <= min) {
                    min = value;
                }
                if (value >= max) {
                    max = value;
                }
            }
        }
        return new Extent(min, max);
    };
    computeFunctorExtent = function (count, f) {
        var i, l, max, min, ref, value;
        min = Number.POSITIVE_INFINITY;
        max = Number.NEGATIVE_INFINITY;
        for (i = l = 0, ref = count; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
            if ((value = f(i)) !== void 0) {
                if (value <= min) {
                    min = value;
                }
                if (value >= max) {
                    max = value;
                }
            }
        }
        return new Extent(min, max);
    };
    computeSkew_ = function (origin) {
        return function (extent) {
            if (extent.min >= origin && extent.max > origin) {
                return 1;
            } else if (extent.min < origin && extent.max <= origin) {
                return -1;
            } else {
                return 0;
            }
        };
    };
    computeSkew0 = computeSkew_(0);
    combineExtents = function (extent1, extent2) {
        return new Extent(Math.min(extent1.min, extent2.min), Math.max(extent1.max, extent2.max));
    };
    includeOrigin_ = function (origin) {
        return function (extent) {
            if (extent.min > origin && extent.max > origin) {
                return new Extent(origin, extent.max);
            } else if (extent.min < origin && extent.max < origin) {
                return new Extent(extent.min, origin);
            } else {
                return extent;
            }
        };
    };
    includeOrigin0 = includeOrigin_(0);
    download = function (type, url, go) {
        return $.ajax({
            dataType: type,
            url: url,
            success: function (data, status, xhr) {
                return go(null, data);
            },
            error: function (xhr, status, error) {
                return go(error);
            }
        });
    };
    createList = function (label, data, _format) {
        var at, count, format;
        count = function () {
            return data.length;
        };
        at = function (i) {
            return data[i];
        };
        format = _format ? function (i) {
            return _format(data[i], i);
        } : at;
        return new List(label, label, at, count, data, format);
    };
    createVector = function (label, type, data, _format) {
        return _createVector(label, label, type, data, _format);
    };
    _createVector = function (name, label, type, data, _format) {
        var at, count, domain, format;
        domain = computeExtent(data);
        count = function () {
            return data.length;
        };
        at = function (i) {
            return data[i];
        };
        format = _format ? function (i) {
            return _format(data[i], i);
        } : at;
        return new Vector(name, label, type, at, count, domain, format);
    };
    createFunctor = function (name, label, type, _count, _at, _format) {
        var domain, format;
        domain = computeFunctorExtent(_count, _at);
        format = _format ? function (i) {
            return _format(_at(i), i);
        } : _at;
        return new Vector(name, label, type, _at, _count, domain, format);
    };
    factorize = function (_read, count, values, _format) {
        var _dictionary, _id, at, category, data, domain, element, format, i, l, length, ref, value, valueAt;
        _id = 0;
        _dictionary = {};
        length = count();
        data = new Array(length);
        domain = function () {
            var l, len, results;
            results = [];
            for (l = 0, len = values.length; l < len; l++) {
                value = values[l];
                results.push(_dictionary[value] = new Category(_id++, value));
            }
            return results;
        }();
        for (i = l = 0, ref = length; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
            element = _read(i);
            value = element !== void 0 ? element : '?';
            if (!(category = _dictionary[value])) {
                domain.push(_dictionary[value] = category = new Category(_id++, value));
            }
            data[i] = category;
        }
        at = function (i) {
            return data[i];
        };
        valueAt = function (i) {
            return data[i].value;
        };
        format = _format ? function (i) {
            return _format(data[i].value);
        } : function (i) {
            if ((value = data[i].value) !== void 0) {
                return _.escape(value);
            } else {
                return value;
            }
        };
        return new Factoring(at, valueAt, count, domain, format);
    };
    createFactor = function (label, type, data, domain, _format) {
        var at, count, factoring;
        count = function () {
            return data.length;
        };
        at = function (i) {
            return data[i];
        };
        factoring = factorize(at, count, domain || [], _format);
        return new Factor(label, label, type, factoring.at, factoring.valueAt, count, factoring.domain, factoring.format);
    };
    createAllFactor = function (label, length) {
        var at, category, categoryValue, count, format, valueAt;
        categoryValue = 'All';
        category = new Category(0, categoryValue);
        valueAt = function (i) {
            return categoryValue;
        };
        at = function () {
            return category;
        };
        count = function () {
            return length;
        };
        format = function () {
            return categoryValue;
        };
        return new Factor(label, label, TString, at, valueAt, count, [category], format);
    };
    createFrame = function (label, vectors, indices, cube, metadata) {
        var frame, schema;
        schema = _.keyBy(vectors, function (vector) {
            return vector.name;
        });
        frame = new Frame(label, vectors, schema, indices, cube, null, null, null, metadata || {});
        frame.evaluate = function (arg) {
            var field, fields, vecs, vector;
            fields = _.isArray(arg) ? arg : [arg];
            vecs = function () {
                var l, len, results;
                results = [];
                for (l = 0, len = fields.length; l < len; l++) {
                    field = fields[l];
                    if (field instanceof MappedField) {
                        results.push(frame.evaluate(field.evaluate(frame)));
                    } else if (field instanceof ReducedField) {
                        if (cube) {
                            results.push(frame.evaluate(field.evaluate(frame, cube)));
                        } else {
                            throw new Error('Cannot compute aggregate [' + field.name + '] on an unaggregated frame.');
                        }
                    } else if (field instanceof Field) {
                        if (vector = schema[field.name]) {
                            results.push(vector);
                        } else {
                            throw new Error('Vector [' + field.name + '] does not exist in frame [' + label + '].');
                        }
                    } else {
                        throw new Error('Cannot evaluate [' + arg + '] on frame [' + label + '].');
                    }
                }
                return results;
            }();
            return _.flatten(vecs);
        };
        frame.attach = function (vector) {
            if (schema[vector.name]) {
                throw new Error('Cannot attach vector [' + vector.name + ']: a vector by that name already exists in frame [' + label + ']');
            } else {
                vectors.push(vector);
                schema[vector.name] = vector;
                return vector;
            }
        };
        frame.exists = function (name) {
            if (schema[name]) {
                return true;
            } else {
                return false;
            }
        };
        return frame;
    };
    dumpFrame = function (frame) {
        var at, ats, i, l, len, len1, m, offset, ref, row, rows;
        rows = new Array(frame.indices.length);
        ats = _.map(frame.vectors, function (vector) {
            if (vector instanceof Factor) {
                return vector.valueAt;
            } else {
                return vector.at;
            }
        });
        ref = frame.indices;
        for (l = 0, len = ref.length; l < len; l++) {
            i = ref[l];
            rows[i] = row = new Array(frame.vectors.length);
            for (offset = m = 0, len1 = ats.length; m < len1; offset = ++m) {
                at = ats[offset];
                row[offset] = at(i);
            }
        }
        return rows;
    };
    createQuery = function (ops) {
        return new Query(filterByType(ops, WhereOp), filterByType(ops, LimitOp), filterByType(ops, GroupOp), filterByType(ops, HavingOp));
    };
    createFields = function (names) {
        return _.map(names, function (name) {
            return new Field(name);
        });
    };
    createFactorField = function (field) {
        return new MappedField(function (frame) {
            var at, computedVector, data, i, l, length, ref, value, vector;
            vector = _.head(frame.evaluate(field));
            if (vector instanceof Factor) {
                return field;
            } else {
                length = vector.count();
                at = vector.at;
                data = new Array(length);
                for (i = l = 0, ref = length; 0 <= ref ? l < ref : l > ref; i = 0 <= ref ? ++l : --l) {
                    if (void 0 !== (value = at(i))) {
                        data[i] = '' + value;
                    }
                }
                frame.attach(computedVector = createFactor('factor(' + vector.label + ')', TString, data));
                return [new Field(computedVector.name)];
            }
        });
    };
    createAllField = function (name) {
        return new MappedField(function (frame) {
            frame.attach(createAllFactor(name, frame.indices.length));
            return [new Field(name)];
        });
    };
    plot_factor = dispatch([
        String,
        function (name) {
            return plot_factor(new Field(name));
        }
    ], [
        Field,
        function (field) {
            return createFactorField(field);
        }
    ], [
        StringValue,
        function (arg1) {
            var value;
            value = arg1.value;
            return createAllField(value);
        }
    ]);
    createStackedField = function (stackedField, depth) {
        return new MappedField(function (frame) {
            var _categories, at, cells, cube, format, hi, highName, highs, i, j, k, l, len, length, levels, lo, lowName, lows, m, n, ref, ref1, ref2, value, vector;
            vector = _.head(frame.evaluate(stackedField));
            if (vector instanceof Factor) {
                throw new Error('Cannot stack factor [' + vector.label + ']: expecting vector.');
            }
            length = vector.count();
            lows = new Array(length);
            highs = new Array(length);
            lowName = 'low(' + vector.name + ', ' + depth + ')';
            highName = 'high(' + vector.name + ', ' + depth + ')';
            at = vector.at;
            cube = frame.cube;
            depth = Math.min(depth, cube.dimension);
            cells = cube.cells;
            lo = hi = 0;
            _categories = new Array(depth);
            ref = frame.indices;
            for (l = 0, len = ref.length; l < len; l++) {
                i = ref[l];
                levels = cells[i].levels;
                for (j = m = 0, ref1 = depth; 0 <= ref1 ? m < ref1 : m > ref1; j = 0 <= ref1 ? ++m : --m) {
                    if (_categories[j] !== levels[j].category) {
                        lo = hi = 0;
                        for (k = n = 0, ref2 = depth; 0 <= ref2 ? n < ref2 : n > ref2; k = 0 <= ref2 ? ++n : --n) {
                            _categories[k] = levels[k].category;
                        }
                        break;
                    }
                }
                value = at(i);
                if (value < 0) {
                    lows[i] = lo;
                    highs[i] = lo = lo + value;
                } else {
                    lows[i] = hi;
                    highs[i] = hi = hi + value;
                }
            }
            format = function (value, i) {
                return vector.format(i);
            };
            frame.attach(_createVector(lowName, vector.name, vector.type, lows, format));
            frame.attach(_createVector(highName, vector.name, vector.type, highs, format));
            return [
                new Field(lowName),
                new Field(highName)
            ];
        });
    };
    plot_stack = dispatch([
        String,
        Number,
        function (name, depth) {
            return plot_stack(new Field(name), depth);
        }
    ], [
        Field,
        Number,
        function (field, depth) {
            return createStackedField(field, depth);
        }
    ]);
    quantile_ = function (values) {
        var clampIndex;
        clampIndex = clamp_(0, values.length - 1);
        return function (percentile) {
            return values[clampIndex(-1 + Math.round(percentile * values.length))];
        };
    };
    computeSchema = function (array) {
        var maximum, minimum, q1, q2, q3, quantile, value, values;
        values = function () {
            var l, len, results;
            results = [];
            for (l = 0, len = array.length; l < len; l++) {
                value = array[l];
                if (value || value === 0) {
                    results.push(value);
                }
            }
            return results;
        }();
        values.sort(function (a, b) {
            return a - b;
        });
        minimum = values[0];
        maximum = values[values.length - 1];
        quantile = quantile_(values);
        q1 = quantile(0.25);
        q2 = quantile(0.5);
        q3 = quantile(0.75);
        return [
            minimum,
            q1,
            q2,
            q3,
            maximum
        ];
    };
    aggregate_avg = function (array) {
        var count, l, len, total, value;
        total = 0;
        count = 0;
        for (l = 0, len = array.length; l < len; l++) {
            value = array[l];
            if (!(value !== void 0)) {
                continue;
            }
            total += value;
            count++;
        }
        return total / count;
    };
    aggregate_count = function (array) {
        var count, l, len, value;
        count = 0;
        for (l = 0, len = array.length; l < len; l++) {
            value = array[l];
            if (value !== void 0) {
                count++;
            }
        }
        return count;
    };
    aggregate_max = function (array) {
        var l, len, max, value;
        max = Number.NEGATIVE_INFINITY;
        for (l = 0, len = array.length; l < len; l++) {
            value = array[l];
            if (value !== void 0) {
                if (value >= max) {
                    max = value;
                }
            }
        }
        return max;
    };
    aggregate_min = function (array) {
        var l, len, min, value;
        min = Number.POSITIVE_INFINITY;
        for (l = 0, len = array.length; l < len; l++) {
            value = array[l];
            if (value !== void 0) {
                if (value <= min) {
                    min = value;
                }
            }
        }
        return min;
    };
    aggregate_sum = function (array) {
        var l, len, total, value;
        total = 0;
        for (l = 0, len = array.length; l < len; l++) {
            value = array[l];
            if (value !== void 0) {
                total += value;
            }
        }
        return total;
    };
    createAggregateField = function (field, symbol, type, format, f) {
        return new ReducedField(function (frame, cube) {
            var at, cell, computedVector, data, i, j, l, len, len1, m, name, ref, ref1, value, values, vector;
            name = symbol + '(' + field.name + ')';
            if (frame.exists(name)) {
                return new Field(name);
            } else {
                vector = _.head(cube.frame.evaluate(field));
                at = vector.at;
                data = new Array(cube.cells.length);
                ref = cube.cells;
                for (j = l = 0, len = ref.length; l < len; j = ++l) {
                    cell = ref[j];
                    values = [];
                    ref1 = cell.indices;
                    for (m = 0, len1 = ref1.length; m < len1; m++) {
                        i = ref1[m];
                        if ((value = at(i)) !== void 0) {
                            values.push(value);
                        }
                    }
                    data[j] = f(values);
                }
                frame.attach(computedVector = createVector(name, type, data, format));
                return [new Field(computedVector.name)];
            }
        });
    };
    plot_aggregate = function (title, type, format, func) {
        return dispatch([
            String,
            function (name) {
                return createAggregateField(new Field(name), title, type, format, func);
            }
        ], [
            Field,
            function (field) {
                return createAggregateField(field, title, type, format, func);
            }
        ]);
    };
    plot_count = plot_aggregate('count', TNumber, _.identity, aggregate_count);
    plot_avg = plot_aggregate('avg', TNumber, _.identity, aggregate_avg);
    plot_max = plot_aggregate('max', TNumber, _.identity, aggregate_max);
    plot_min = plot_aggregate('min', TNumber, _.identity, aggregate_min);
    plot_sum = plot_aggregate('sum', TNumber, _.identity, aggregate_sum);
    plot_groupBy = function () {
        var arg, args, fields;
        args = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
        fields = function () {
            var l, len, results;
            results = [];
            for (l = 0, len = args.length; l < len; l++) {
                arg = args[l];
                if (arg instanceof Field) {
                    results.push(arg);
                } else if (_.isString(arg)) {
                    results.push(new Field(arg));
                } else {
                    throw new Error('Cannot group by [' + arg + ']');
                }
            }
            return results;
        }();
        return new GroupOp(fields);
    };
    plot__where = dispatch([
        [String],
        Function,
        function (names, func) {
            return new WhereOp(createFields(names), func);
        }
    ]);
    plot_where = function () {
        var func, l, names;
        names = 2 <= arguments.length ? slice1.call(arguments, 0, l = arguments.length - 1) : (l = 0, []), func = arguments[l++];
        return plot__where(names, func);
    };
    plot_limit = dispatch([
        Number,
        Number,
        function (offset, length) {
            return new LimitOp(offset, length);
        }
    ], [
        Number,
        function (length) {
            return new LimitOp(0, length);
        }
    ]);
    plot__having = dispatch([
        [String],
        Function,
        function (names, func) {
            return new HavingOp(createFields(names), func);
        }
    ], [
        [Field],
        Function,
        function (fields, func) {
            return new HavingOp(fields, func);
        }
    ]);
    plot_having = function () {
        var func, l, names;
        names = 2 <= arguments.length ? slice1.call(arguments, 0, l = arguments.length - 1) : (l = 0, []), func = arguments[l++];
        return plot__having(names, func);
    };
    plot_eq = function (value) {
        return function (actual) {
            return actual === value;
        };
    };
    plot_ne = function (value) {
        return function (actual) {
            return actual !== value;
        };
    };
    plot_lt = function (value) {
        return function (actual) {
            return actual < value;
        };
    };
    plot_gt = function (value) {
        return function (actual) {
            return actual > value;
        };
    };
    plot_le = function (value) {
        return function (actual) {
            return actual <= value;
        };
    };
    plot_ge = function (value) {
        return function (actual) {
            return actual >= value;
        };
    };
    plot_like = function (regex) {
        if (TRegExp !== typeOf(regex)) {
            throw new Error('like [' + regex + ']: expecting RegExp');
        }
        return function (actual) {
            return regex.test(actual);
        };
    };
    plot_in = function (expecteds) {
        return function (actual) {
            var expected, l, len;
            for (l = 0, len = expecteds.length; l < len; l++) {
                expected = expecteds[l];
                if (expected === actual) {
                    return true;
                }
            }
            return false;
        };
    };
    plot_notIn = function (expecteds) {
        return function (actual) {
            var expected, l, len;
            for (l = 0, len = expecteds.length; l < len; l++) {
                expected = expecteds[l];
                if (expected === actual) {
                    return false;
                }
            }
            return true;
        };
    };
    queryFrame = function (frame, query) {
        var aggregatedFrame, cells, cube, factors, field, fields, filteredFrame, hierarchy, limit, resultFrame, vector;
        filteredFrame = query.where.length ? createFrame(frame.label, frame.vectors, filterFrame(frame, query.where)) : frame;
        resultFrame = query.group.length ? (fields = flatMap(query.group, function (op) {
            return op.fields;
        }), factors = function () {
            var l, len, results;
            results = [];
            for (l = 0, len = fields.length; l < len; l++) {
                field = fields[l];
                vector = _.head(filteredFrame.evaluate(field));
                if (vector instanceof Factor) {
                    results.push(vector);
                } else {
                    throw new Error('Cannot group by [' + field.name + ']: not a Factor.');
                }
            }
            return results;
        }(), hierarchy = { 0: new Level(All, filteredFrame.indices, {}) }, buildHierarchy(hierarchy, factors, 0), cells = [], collapseHierarchy(hierarchy[0].children, fields.length - 1, cells, 0, new Array(fields.length)), cube = new Cube(filteredFrame, hierarchy, cells, fields.length), aggregatedFrame = aggregateFrame(filteredFrame.label + '\'', cube, factors), query.having.length ? createFrame(aggregatedFrame.label, aggregatedFrame.vectors, filterFrame(aggregatedFrame, query.having), aggregatedFrame.cube) : aggregatedFrame) : filteredFrame;
        if (query.limit.length) {
            limit = query.limit[query.limit.length - 1];
            return createFrame(resultFrame.label, resultFrame.vectors, resultFrame.indices.slice(limit.offset, limit.offset + limit.length));
        } else {
            return resultFrame;
        }
    };
    filterFrame = function (frame, ops) {
        var _indices, args, at, ats, field, i, indices, j, l, len, len1, len2, m, n, op, vectors;
        _indices = frame.indices;
        for (l = 0, len = ops.length; l < len; l++) {
            op = ops[l];
            indices = [];
            vectors = function () {
                var len1, m, ref, results;
                ref = op.fields;
                results = [];
                for (m = 0, len1 = ref.length; m < len1; m++) {
                    field = ref[m];
                    results.push(_.head(frame.evaluate(field)));
                }
                return results;
            }();
            ats = _.map(vectors, function (vector) {
                if (vector instanceof Factor) {
                    return vector.valueAt;
                } else {
                    return vector.at;
                }
            });
            for (m = 0, len1 = _indices.length; m < len1; m++) {
                i = _indices[m];
                args = new Array(vectors.length);
                for (j = n = 0, len2 = ats.length; n < len2; j = ++n) {
                    at = ats[j];
                    args[j] = at(i);
                }
                if (op.predicate.apply(null, args)) {
                    indices.push(i);
                }
            }
            _indices = indices;
        }
        return _indices;
    };
    aggregateFrame = function (label, cube, sourceFactors) {
        var indices, offset, targetFactors;
        indices = _.range(cube.cells.length);
        targetFactors = function () {
            var l, ref, results;
            results = [];
            for (offset = l = 0, ref = cube.dimension; 0 <= ref ? l < ref : l > ref; offset = 0 <= ref ? ++l : --l) {
                results.push(extractFactor(cube, sourceFactors[offset], offset));
            }
            return results;
        }();
        return createFrame(label, targetFactors, indices, cube);
    };
    buildHierarchy = function (hierarchy, vectors, offset) {
        var at, category, child, children, i, key, l, len, level, ref;
        at = vectors[offset].at;
        for (key in hierarchy) {
            level = hierarchy[key];
            children = level.children;
            ref = level.indices;
            for (l = 0, len = ref.length; l < len; l++) {
                i = ref[l];
                category = at(i);
                if (!(child = children[category.key])) {
                    children[category.key] = child = new Level(category, [], {});
                }
                child.indices.push(i);
            }
            if (offset < vectors.length - 1) {
                buildHierarchy(children, vectors, offset + 1);
            }
        }
    };
    collapseHierarchy = function (hierarchy, depth, cells, offset, coord) {
        var key, level;
        for (key in hierarchy) {
            level = hierarchy[key];
            coord[offset] = level;
            if (offset === depth) {
                cells.push(new Cell(copy(coord), level.indices));
            } else {
                collapseHierarchy(level.children, depth, cells, offset + 1, coord);
            }
        }
    };
    extractFactor = function (cube, vector, offset) {
        var at, category, cell, count, data, dictionary, domain, format, i, l, len, ref, valueAt;
        data = new Array(cube.cells.length);
        dictionary = {};
        domain = [];
        ref = cube.cells;
        for (i = l = 0, len = ref.length; l < len; i = ++l) {
            cell = ref[i];
            data[i] = category = cell.levels[offset].category;
            if (!dictionary[category.value]) {
                dictionary[category.value] = category;
                domain.push(category);
            }
        }
        at = function (i) {
            return data[i];
        };
        valueAt = function (i) {
            return data[i].value;
        };
        format = function (i) {
            return data[i].value;
        };
        count = function () {
            return data.length;
        };
        return new Factor(vector.label, vector.label, vector.type, at, valueAt, count, domain, format);
    };
    ColorPalettes = {
        c10: [
            '#1f77b4',
            '#ff7f0e',
            '#2ca02c',
            '#d62728',
            '#9467bd',
            '#8c564b',
            '#e377c2',
            '#7f7f7f',
            '#bcbd22',
            '#17becf'
        ],
        c20: [
            '#1f77b4',
            '#aec7e8',
            '#ff7f0e',
            '#ffbb78',
            '#2ca02c',
            '#98df8a',
            '#d62728',
            '#ff9896',
            '#9467bd',
            '#c5b0d5',
            '#8c564b',
            '#c49c94',
            '#e377c2',
            '#f7b6d2',
            '#7f7f7f',
            '#c7c7c7',
            '#bcbd22',
            '#dbdb8d',
            '#17becf',
            '#9edae5'
        ],
        c20b: [
            '#393b79',
            '#5254a3',
            '#6b6ecf',
            '#9c9ede',
            '#637939',
            '#8ca252',
            '#b5cf6b',
            '#cedb9c',
            '#8c6d31',
            '#bd9e39',
            '#e7ba52',
            '#e7cb94',
            '#843c39',
            '#ad494a',
            '#d6616b',
            '#e7969c',
            '#7b4173',
            '#a55194',
            '#ce6dbd',
            '#de9ed6'
        ],
        c20c: [
            '#3182bd',
            '#6baed6',
            '#9ecae1',
            '#c6dbef',
            '#e6550d',
            '#fd8d3c',
            '#fdae6b',
            '#fdd0a2',
            '#31a354',
            '#74c476',
            '#a1d99b',
            '#c7e9c0',
            '#756bb1',
            '#9e9ac8',
            '#bcbddc',
            '#dadaeb',
            '#636363',
            '#969696',
            '#bdbdbd',
            '#d9d9d9'
        ]
    };
    pickCategoricalColorPalette = function (cardinality) {
        if (cardinality > 10) {
            return ColorPalettes.c20;
        } else {
            return ColorPalettes.c10;
        }
    };
    cloneColor = function (color) {
        var b, g, r, ref;
        ref = color.rgb(), r = ref[0], g = ref[1], b = ref[2];
        return chroma.rgb(r, g, b);
    };
    colorToStyle = function (color, opacity) {
        if (0 <= opacity && opacity < 1) {
            return cloneColor(color).alpha(opacity).css();
        } else {
            return color.css();
        }
    };
    drawCircle = function (g, x, y, area) {
        var r;
        r = Math.sqrt(area / π);
        g.beginPath();
        g.arc(x, y, r, 0, τ, false);
        return g.closePath();
    };
    drawSquare = function (g, x, y, area) {
        var r;
        r = 0.5 * Math.sqrt(area);
        g.save();
        g.translate(x, y);
        g.beginPath();
        g.moveTo(r, r);
        g.lineTo(-r, r);
        g.lineTo(-r, -r);
        g.lineTo(r, -r);
        g.closePath();
        return g.restore();
    };
    drawCross = function (g, x, y, area) {
        var r, r3;
        r = 0.5 * Math.sqrt(area / 5);
        r3 = r * 3;
        g.save();
        g.translate(x, y);
        g.beginPath();
        g.moveTo(r3, r);
        g.lineTo(r, r);
        g.lineTo(r, r3);
        g.lineTo(-r, r3);
        g.lineTo(-r, r);
        g.lineTo(-r3, r);
        g.lineTo(-r3, -r);
        g.lineTo(-r, -r);
        g.lineTo(-r, -r3);
        g.lineTo(r, -r3);
        g.lineTo(r, -r);
        g.lineTo(r3, -r);
        g.closePath();
        return g.restore();
    };
    drawDiamond = function (g, x, y, area) {
        var rx, ry;
        ry = Math.sqrt(area / (2 * Tan30));
        rx = ry * Tan30;
        g.save();
        g.translate(x, y);
        g.beginPath();
        g.moveTo(rx, 0);
        g.lineTo(0, ry);
        g.lineTo(-rx, 0);
        g.lineTo(0, -ry);
        g.closePath();
        return g.restore();
    };
    drawTriangleUp = function (g, x, y, area) {
        var rx, ry;
        rx = Math.sqrt(area / Sqrt3);
        ry = rx * Sqrt3 / 2;
        g.save();
        g.translate(x, y);
        g.beginPath();
        g.moveTo(0, -ry);
        g.lineTo(rx, ry);
        g.lineTo(-rx, ry);
        g.closePath();
        return g.restore();
    };
    drawTriangleDown = function (g, x, y, area) {
        var rx, ry;
        rx = Math.sqrt(area / Sqrt3);
        ry = rx * Sqrt3 / 2;
        g.save();
        g.translate(x, y);
        g.beginPath();
        g.moveTo(0, ry);
        g.lineTo(rx, -ry);
        g.lineTo(-rx, -ry);
        g.closePath();
        return g.restore();
    };
    drawTriangleRight = function (g, x, y, area) {
        var rx, ry;
        ry = Math.sqrt(area / Sqrt3);
        rx = ry * Sqrt3 / 2;
        g.save();
        g.translate(x, y);
        g.beginPath();
        g.moveTo(rx, 0);
        g.lineTo(-rx, ry);
        g.lineTo(-rx, -ry);
        g.closePath();
        return g.restore();
    };
    drawTriangleLeft = function (g, x, y, area) {
        var rx, ry;
        ry = Math.sqrt(area / Sqrt3);
        rx = ry * Sqrt3 / 2;
        g.save();
        g.translate(x, y);
        g.beginPath();
        g.moveTo(-rx, 0);
        g.lineTo(rx, -ry);
        g.lineTo(rx, ry);
        g.closePath();
        return g.restore();
    };
    Shapes = {
        circle: drawCircle,
        square: drawSquare,
        cross: drawCross,
        diamond: drawDiamond,
        triangleUp: drawTriangleUp,
        triangleDown: drawTriangleDown,
        triangleLeft: drawTriangleLeft,
        triangleRight: drawTriangleRight
    };
    ShapePalettes = {
        c8: [
            'circle',
            'square',
            'cross',
            'diamond',
            'triangleUp',
            'triangleDown',
            'triangleLeft',
            'triangleRight'
        ]
    };
    pickCategoricalShapePalette = function () {
        return ShapePalettes.c8;
    };
    scaleSafe_ = function (scale) {
        return function (value) {
            if (value !== void 0) {
                return scale(value);
            } else {
                return void 0;
            }
        };
    };
    createNicedSequentialLinearScale = function (domain, range) {
        var scale;
        scale = d3.scaleLinear().domain([
            domain.min,
            domain.max
        ]).range([
            range.min,
            range.max
        ]).nice();
        return [
            scaleSafe_(scale),
            scale.tickFormat,
            scale.ticks
        ];
    };
    createOrdinalScale = function (domain, range) {
        var _dictionary, _index, category, l, len, offset, rangeMin;
        _index = 0;
        _dictionary = {};
        for (l = 0, len = domain.length; l < len; l++) {
            category = domain[l];
            _dictionary[category.key] = _index++;
        }
        offset = (range.max - range.min) / domain.length / 2;
        rangeMin = range.min;
        return scaleSafe_(function (category) {
            return rangeMin + 2 * _dictionary[category.key] * offset + offset;
        });
    };
    createCategoricalScale = function (domain, range) {
        var _rangeCount, _rangeValues;
        _rangeValues = range.values;
        _rangeCount = _rangeValues.length;
        return scaleSafe_(function (category) {
            return _rangeValues[category.key % _rangeCount];
        });
    };
    createSequentialLinearScale = function (domain, range) {
        return scaleSafe_(d3.scaleLinear().domain([
            domain.min,
            domain.max
        ]).range([
            range.min,
            range.max
        ]));
    };
    createDivergingLinearScale = function (domain, range) {
        return scaleSafe_(d3.scaleLinear().domain([
            domain.min,
            domain.mid,
            domain.max
        ]).range([
            range.min,
            range.mid,
            range.max
        ]));
    };
    createSequentialColorScale = function (domain, range) {
        return scaleSafe_(chroma.scale([
            range.min,
            range.max
        ]).domain([
            domain.min,
            domain.max
        ]).mode('lch'));
    };
    createDivergingColorScale = function (domain, range) {
        var left, right;
        left = chroma.scale([
            range.min,
            range.mid
        ]).domain([
            domain.min,
            domain.mid
        ]).mode('lch');
        right = chroma.scale([
            range.mid,
            range.max
        ]).domain([
            domain.mid,
            domain.max
        ]).mode('lch');
        return function (value) {
            if (value !== void 0) {
                if (value < domain.mid) {
                    return left(value);
                } else {
                    return right(value);
                }
            } else {
                return void 0;
            }
        };
    };
    createColorScale = dispatch([
        SequentialRange,
        ColorRange,
        createSequentialColorScale
    ], [
        DivergingRange,
        ColorRange,
        createDivergingColorScale
    ]);
    createLinearScale = dispatch([
        SequentialRange,
        SequentialRange,
        createSequentialLinearScale
    ], [
        DivergingRange,
        DivergingRange,
        createDivergingLinearScale
    ]);
    byteToHex = function (b) {
        var hex;
        hex = b.toString(16);
        if (hex.length === 1) {
            return '0' + hex;
        } else {
            return hex;
        }
    };
    createClip = function (canvas) {
        var context, put, ratio, test;
        context = canvas.context, ratio = canvas.ratio;
        put = function () {
            return '#fff';
        };
        test = function (x, y) {
            var a, b, g, r, ref;
            ref = context.getImageData(x * ratio, y * ratio, 1, 1).data, r = ref[0], g = ref[1], b = ref[2], a = ref[3];
            return r === 255 && g === 255 && b === 255 && a === 255;
        };
        return new Clip(put, test);
    };
    createMask = function (canvas) {
        var _color, context, dict, put, ratio, test;
        context = canvas.context, ratio = canvas.ratio;
        _color = 0;
        dict = {};
        put = function (index) {
            var b, color, g, r;
            color = _color++;
            if (_color >= ColorLimit) {
                _color = 0;
            }
            dict[color] = index;
            r = color >> 16 & 255;
            g = color >> 8 & 255;
            b = color & 255;
            return '#' + byteToHex(r) + byteToHex(g) + byteToHex(b);
        };
        test = function (x, y) {
            var a, b, color, g, r, ref;
            ref = context.getImageData(x * ratio, y * ratio, 1, 1).data, r = ref[0], g = ref[1], b = ref[2], a = ref[3];
            if (a === 255) {
                color = (r << 16) + (g << 8) + b;
                return dict[color];
            } else {
                return void 0;
            }
        };
        return new Mask(put, test);
    };
    encodePosition = function (axis, vector) {
        var at, domain, encode, guide, label, range, scale;
        scale = axis.scale, domain = axis.domain, range = axis.range, guide = axis.guide;
        label = vector.label, at = vector.at;
        encode = function (i) {
            return scale(at(i));
        };
        return new PositionEncoder(label, encode, vector, domain, range, guide);
    };
    encodeConstantPosition = function (axis, value) {
        return new ConstantEncoder(axis.scale(value));
    };
    encodeColor = function (frame, channel) {
        var at, domain, encode, range, scale, skew, vector;
        if (channel instanceof VariableFillColorChannel || channel instanceof VariableStrokeColorChannel) {
            vector = _.head(frame.evaluate(channel.field));
            if (vector instanceof Factor) {
                if (!channel.range) {
                    channel.range = new CategoricalRange(pickCategoricalColorPalette(vector.domain.length));
                }
                scale = createCategoricalScale(vector.domain, channel.range);
                at = vector.at;
                encode = function (i) {
                    return chroma(scale(at(i)));
                };
                return new ColorEncoder(vector.label, encode, vector, vector.domain, channel.range, null);
            } else {
                domain = function () {
                    switch (computeSkew0(vector.domain)) {
                    case 1:
                        return new SequentialRange(vector.domain.min, vector.domain.max);
                    case -1:
                        return new SequentialRange(vector.domain.min, vector.domain.max);
                    default:
                        return new DivergingRange(vector.domain.min, 0, vector.domain.max);
                    }
                }();
                skew = computeSkew0(domain);
                range = channel.range ? channel.range instanceof DivergingColorRange ? domain instanceof SequentialRange ? skew === 1 ? new SequentialColorRange(channel.range.mid, channel.range.max) : new SequentialColorRange(channel.range.min, channel.range.mid) : channel.range : (domain instanceof DivergingRange ? domain = new SequentialRange(domain.min, domain.max) : void 0, channel.range) : domain instanceof SequentialRange ? skew === 1 ? new SequentialColorRange('#deebf7', '#3182bd') : new SequentialColorRange('#e6550d', '#fee6ce') : new DivergingColorRange('#fc8d59', '#ffffbf');
                scale = createColorScale(domain, range);
                at = vector.at;
                encode = function (i) {
                    return scale(at(i));
                };
                return new ColorEncoder(vector.label, encode, vector, domain, range, null);
            }
        } else {
            return new ConstantEncoder(channel.value);
        }
    };
    encodeOpacity = function (frame, channel) {
        var at, domain, encode, range, scale, vector;
        if (channel instanceof VariableFillOpacityChannel || channel instanceof VariableStrokeOpacityChannel) {
            vector = _.head(frame.evaluate(channel.field));
            if (vector instanceof Factor) {
                throw new Error('Could not encode opacity. Vector [' + vector.label + '] is a Factor.');
            }
            domain = new SequentialRange(vector.domain.min, vector.domain.max);
            range = channel.range ? new SequentialRange(clampNorm(channel.range.min), clampNorm(channel.range.max)) : channel.range = new SequentialRange(0.05, 1);
            scale = createLinearScale(domain, range);
            at = vector.at;
            encode = function (i) {
                return scale(at(i));
            };
            return new OpacityEncoder(vector.label, encode, vector, domain, range, null);
        } else {
            return new ConstantEncoder(clampNorm(channel.value));
        }
    };
    encodeStyle = function (colorEncoder, opacityEncoder) {
        var colorAt, opacityAt;
        if (colorEncoder && opacityEncoder) {
            colorAt = colorEncoder.encode;
            opacityAt = opacityEncoder.encode;
            return new VariableEncoder('(' + colorEncoder.label + ', ' + opacityEncoder.label + ')', function (i) {
                return colorToStyle(colorAt(i), opacityAt(i));
            });
        } else {
            return void 0;
        }
    };
    encode_size = function (channelClass, encoderClass) {
        return function (frame, channel, limit) {
            var at, domain, encode, range, scale, vector;
            if (channel instanceof channelClass) {
                vector = _.head(frame.evaluate(channel.field));
                if (vector instanceof Factor) {
                    throw new Error('Could not encode size. Vector [' + vector.label + '] is a Factor.');
                }
                domain = new SequentialRange(vector.domain.min, vector.domain.max);
                range = channel.range ? new SequentialRange(clampNorm(channel.range.min), clampNorm(channel.range.max)) : channel.range = new SequentialRange(0.05, 1);
                scale = createLinearScale(domain, range);
                at = vector.at;
                encode = function (i) {
                    return limit * scale(at(i));
                };
                return new encoderClass(vector.label, encode, domain, range, null);
            } else {
                return new ConstantEncoder(limit * clampNorm(channel.value));
            }
        };
    };
    encodeSize = encode_size(VariableSizeChannel, SizeEncoder);
    encodeWidth = encode_size(VariableWidthChannel, SizeEncoder);
    encodeHeight = encode_size(VariableHeightChannel, SizeEncoder);
    encodeArea = function (frame, channel) {
        var at, domain, encode, range, scale, vector;
        if (channel instanceof VariableSizeChannel) {
            vector = _.head(frame.evaluate(channel.field));
            if (vector instanceof Factor) {
                throw new Error('Could not encode size. Vector [' + vector.label + '] is a Factor.');
            }
            domain = new SequentialRange(vector.domain.min, vector.domain.max);
            range = channel.range ? new SequentialRange(sq(channel.range.min), sq(channel.range.max)) : channel.range = new SequentialRange(sq(defaultSize), sq(30));
            scale = createLinearScale(domain, range);
            at = vector.at;
            encode = function (i) {
                return scale(at(i));
            };
            return new SizeEncoder(vector.label, encode, vector, domain, range, null);
        } else {
            return new ConstantEncoder(sq(channel.value));
        }
    };
    encodeLineWidth = function (frame, channel) {
        var at, domain, encode, range, scale, vector;
        if (channel instanceof VariableLineWidthChannel) {
            vector = _.head(frame.evaluate(channel.field));
            if (vector instanceof Factor) {
                throw new Error('Could not encode lineWidth. Vector [' + vector.label + '] is a Factor.');
            }
            domain = new SequentialRange(vector.domain.min, vector.domain.max);
            range = channel.range ? new SequentialRange(channel.range.min, channel.range.max) : channel.range = new SequentialRange(1.5, 15);
            scale = createLinearScale(domain, range);
            at = vector.at;
            encode = function (i) {
                return scale(at(i));
            };
            return new SizeEncoder(vector.label, encode, vector, domain, range, null);
        } else {
            return new ConstantEncoder(channel.value);
        }
    };
    encodeShape = function (frame, channel) {
        var at, encode, scale, vector;
        if (channel instanceof VariableShapeChannel) {
            vector = _.head(frame.evaluate(channel.field));
            if (!(vector instanceof Factor)) {
                throw new Error('Could not encode shape. Vector [' + vector.label + '] is not a Factor.');
            }
            if (!channel.range) {
                channel.range = new CategoricalRange(pickCategoricalShapePalette(vector.domain.length));
            }
            scale = createCategoricalScale(vector.domain, channel.range);
            at = vector.at;
            encode = function (i) {
                return Shapes[scale(at(i))];
            };
            return new ShapeEncoder(vector.label, encode, vector, vector.domain, channel.range, null);
        } else {
            return new ConstantEncoder(Shapes[channel.value] || Shapes.circle);
        }
    };
    encodeTooltip = function (frame, channel) {
        var field, vectors;
        if (channel) {
            vectors = function () {
                var l, len, ref, results;
                ref = channel.fields;
                results = [];
                for (l = 0, len = ref.length; l < len; l++) {
                    field = ref[l];
                    results.push(_.head(frame.evaluate(field)));
                }
                return results;
            }();
            return new TooltipEncoder(vectors);
        } else {
            return void 0;
        }
    };
    initFill = function (fillColor, fillOpacity) {
        return [
            fillColor != null ? fillColor : new ConstantFillColorChannel(chroma(_.head(ColorPalettes.c10))),
            fillOpacity != null ? fillOpacity : new ConstantFillOpacityChannel(1)
        ];
    };
    initStroke = function (strokeColor, strokeOpacity, lineWidth) {
        return [
            strokeColor != null ? strokeColor : new ConstantStrokeColorChannel(chroma(_.head(ColorPalettes.c10))),
            strokeOpacity != null ? strokeOpacity : new ConstantStrokeOpacityChannel(1),
            lineWidth != null ? lineWidth : new ConstantLineWidthChannel(1.5)
        ];
    };
    initFillAndStroke = function (fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, forceFill, forceStroke) {
        var hasFill, hasStroke, ref, ref1;
        hasFill = fillColor || fillOpacity;
        hasStroke = strokeColor || strokeOpacity || lineWidth;
        if (!(hasFill || hasStroke)) {
            if (forceFill) {
                hasFill = true;
            }
            if (forceStroke) {
                hasStroke = true;
            }
        }
        if (hasFill) {
            ref = initFill(fillColor, fillOpacity), fillColor = ref[0], fillOpacity = ref[1];
        }
        if (hasStroke) {
            ref1 = initStroke(strokeColor, strokeOpacity, lineWidth), strokeColor = ref1[0], strokeOpacity = ref1[1], lineWidth = ref1[2];
        }
        return [
            fillColor,
            fillOpacity,
            strokeColor,
            strokeOpacity,
            lineWidth
        ];
    };
    encodeFill = function (frame, mark) {
        var fillColor, fillOpacity;
        if (mark.fillColor || mark.fillOpacity) {
            return [
                fillColor = encodeColor(frame, mark.fillColor),
                fillOpacity = encodeOpacity(frame, mark.fillOpacity),
                encodeStyle(fillColor, fillOpacity)
            ];
        } else {
            return [];
        }
    };
    encodeStroke = function (frame, mark) {
        var strokeColor, strokeOpacity;
        if (mark.strokeColor || mark.strokeOpacity || mark.lineWidth) {
            return [
                strokeColor = encodeColor(frame, mark.strokeColor),
                strokeOpacity = encodeOpacity(frame, mark.strokeOpacity),
                encodeStyle(strokeColor, strokeOpacity),
                encodeLineWidth(frame, mark.lineWidth)
            ];
        } else {
            return [];
        }
    };
    clipRect = function (g, x, y, w, h) {
        g.beginPath();
        g.rect(x, y, w, h);
        return g.clip();
    };
    doStroke = function (g, style, lineWidth) {
        g.lineWidth = lineWidth;
        g.strokeStyle = style;
        return g.stroke();
    };
    doFill = function (g, style) {
        g.fillStyle = style;
        return g.fill();
    };
    doLine = function (g, x1, y1, x2, y2) {
        g.beginPath();
        g.moveTo(x1, y1);
        g.lineTo(x2, y2);
        return g.stroke();
    };
    doRectY = function (g, x, y1, y2, w) {
        g.beginPath();
        if (y2 > y1) {
            g.rect(x - w / 2, y1, w, y2 - y1);
        } else {
            g.rect(x - w / 2, y2, w, y1 - y2);
        }
        return g.closePath();
    };
    doRectX = function (g, x1, x2, y, h) {
        g.beginPath();
        if (x2 > x1) {
            g.rect(x1, y - h / 2, x2 - x1, h);
        } else {
            g.rect(x2, y - h / 2, x1 - x2, h);
        }
        return g.closePath();
    };
    doSchemaX = function (g, q0, q1, q2, q3, qn, y, h, s, lw) {
        var h2, h4;
        if (q0 !== void 0 && q1 !== void 0 && q2 !== void 0 && q3 !== void 0 && qn !== void 0 && y !== void 0 && h !== void 0 && s !== void 0 && lw !== void 0) {
            g.strokeStyle = s;
            g.lineWidth = lw;
            doRectX(g, q1, q3, y, h);
            g.stroke();
            h2 = h / 2;
            h4 = h / 4;
            doLine(g, q2, y - h2, q2, y + h2);
            doLine(g, q1, y, q0, y);
            doLine(g, q3, y, qn, y);
            doLine(g, q0, y - h4, q0, y + h4);
            return doLine(g, qn, y - h4, qn, y + h4);
        }
    };
    doSchemaY = function (g, x, q0, q1, q2, q3, qn, w, s, lw) {
        var w2, w4;
        if (x !== void 0 && q0 !== void 0 && q1 !== void 0 && q2 !== void 0 && q3 !== void 0 && qn !== void 0 && w !== void 0 && s !== void 0 && lw !== void 0) {
            g.strokeStyle = s;
            g.lineWidth = lw;
            doRectY(g, x, q1, q3, w);
            g.stroke();
            w2 = w / 2;
            w4 = w / 4;
            doLine(g, x - w2, q2, x + w2, q2);
            doLine(g, x, q1, x, q0);
            doLine(g, x, q3, x, qn);
            doLine(g, x - w4, q0, x + w4, q0);
            return doLine(g, x - w4, qn, x + w4, qn);
        }
    };
    renderLineAnnotation = function (annotation, axisX, axisY, g) {
        var intercept, lineWidth, slope, strokeColor, strokeOpacity, x1, x2, y1, y2;
        slope = annotation.slope, intercept = annotation.intercept, strokeColor = annotation.strokeColor, strokeOpacity = annotation.strokeOpacity, lineWidth = annotation.lineWidth;
        if (intercept !== void 0) {
            if (slope === 0) {
                if (axisY instanceof QuantitativeAxis) {
                    x1 = axisX.range.min;
                    x2 = axisX.range.max;
                    y1 = y2 = axisY.scale(intercept);
                }
            } else {
                if (axisX instanceof QuantitativeAxis && axisY instanceof QuantitativeAxis) {
                    x1 = axisX.scale(axisX.domain.min);
                    x2 = axisX.scale(axisX.domain.max);
                    y1 = axisY.scale(slope * axisX.domain.min + intercept);
                    y2 = axisY.scale(slope * axisY.domain.max + intercept);
                }
            }
        } else {
            if (axisX instanceof QuantitativeAxis) {
                x1 = x2 = axisX.scale(slope);
                y1 = axisY.range.min;
                y2 = axisY.range.max;
            }
        }
        if (x1 !== void 0 && y1 !== void 0 && x2 !== void 0 && y2 !== void 0) {
            g.save();
            g.strokeStyle = colorToStyle(strokeColor, strokeOpacity);
            g.lineWidth = lineWidth;
            doLine(g, x1, y1, x2, y2);
            g.restore();
        }
    };
    createLineAnnotation = function (expr) {
        var intercept, lineWidth, ref, slope, strokeColor, strokeOpacity;
        ref = expr.position.coordinates, slope = ref[0], intercept = ref[1];
        strokeColor = expr.strokeColor, strokeOpacity = expr.strokeOpacity, lineWidth = expr.lineWidth;
        return new LineAnnotation(slope ? slope.value : 0, intercept ? intercept.value : void 0, strokeColor ? strokeColor.value : chroma('red'), strokeOpacity ? strokeOpacity.value : 1, lineWidth ? lineWidth.value : 1.5);
    };
    createPointMark = function (expr, vectors) {
        var fillColor, fillOpacity, lineWidth, positionX, positionY, ref, ref1, ref2, shape, size, space, strokeColor, strokeOpacity;
        positionX = vectors[0], positionY = vectors[1];
        space = new Space2D([positionX], [positionY]);
        shape = (ref = expr.shape) != null ? ref : new ConstantShapeChannel('circle');
        size = (ref1 = expr.size) != null ? ref1 : new ConstantSizeChannel(defaultSize);
        ref2 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, false, true), fillColor = ref2[0], fillOpacity = ref2[1], strokeColor = ref2[2], strokeOpacity = ref2[3], lineWidth = ref2[4];
        return new PointMark(space, positionX, positionY, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
    };
    encodePointMark = function (frame, mark, axisX, axisY) {
        var fill, fillColor, fillOpacity, lineWidth, positionX, positionY, ref, ref1, shape, size, stroke, strokeColor, strokeOpacity, tooltip;
        positionX = encodePosition(axisX, mark.positionX);
        positionY = encodePosition(axisY, mark.positionY);
        shape = encodeShape(frame, mark.shape);
        size = encodeArea(frame, mark.size);
        ref = encodeFill(frame, mark), fillColor = ref[0], fillOpacity = ref[1], fill = ref[2];
        ref1 = encodeStroke(frame, mark), strokeColor = ref1[0], strokeOpacity = ref1[1], stroke = ref1[2], lineWidth = ref1[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new PointEncoding(positionX, positionY, shape, size, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightPointMarks = function (indices, encoders, g) {
        var fill, i, l, len, len1, lineWidth, m, positionX, positionY, shape, size, stroke, x, y;
        positionX = encoders.positionX, positionY = encoders.positionY, shape = encoders.shape, size = encoders.size, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y = positionY(i);
            if (x !== void 0 && y !== void 0) {
                shape(i)(g, x, y, size(i));
                g.lineWidth = 2 + (stroke ? lineWidth(i) : 1);
                g.stroke();
            }
        }
        g.restore();
        g.save();
        g.globalCompositeOperation = 'destination-out';
        g.fillStyle = g.strokeStyle = 'black';
        for (m = 0, len1 = indices.length; m < len1; m++) {
            i = indices[m];
            x = positionX(i);
            y = positionY(i);
            if (x !== void 0 && y !== void 0) {
                shape(i)(g, x, y, size(i));
                if (stroke) {
                    g.lineWidth = lineWidth(i);
                    g.stroke();
                }
                if (fill) {
                    g.fill();
                }
            }
        }
        return g.restore();
    };
    maskPointMarks = function (indices, encoders, g, mask) {
        var i, l, len, lineWidth, maskStyle, positionX, positionY, shape, size, stroke, x, y;
        positionX = encoders.positionX, positionY = encoders.positionY, shape = encoders.shape, size = encoders.size, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y = positionY(i);
            if (x !== void 0 && y !== void 0) {
                maskStyle = mask.put(i);
                shape(i)(g, x, y, size(i));
                g.fillStyle = maskStyle;
                g.fill();
                if (stroke) {
                    g.lineWidth = lineWidth(i);
                    g.strokeStyle = maskStyle;
                    g.stroke();
                }
            }
        }
        return g.restore();
    };
    renderPointMarks = function (indices, encoders, g) {
        var fill, i, l, len, lineWidth, positionX, positionY, shape, size, stroke, x, y;
        positionX = encoders.positionX, positionY = encoders.positionY, shape = encoders.shape, size = encoders.size, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y = positionY(i);
            if (x !== void 0 && y !== void 0) {
                shape(i)(g, x, y, size(i));
                if (stroke) {
                    g.lineWidth = lineWidth(i);
                    g.strokeStyle = stroke(i);
                    g.stroke();
                }
                if (fill) {
                    g.fillStyle = fill(i);
                    g.fill();
                }
            }
        }
        return g.restore();
    };
    selectMarks = function (indices, encoders, xmin, ymin, xmax, ymax) {
        var i, l, len, positionX, positionY, selectedIndices, x, y;
        positionX = encoders.positionX, positionY = encoders.positionY;
        selectedIndices = [];
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y = positionY(i);
            if (x !== void 0 && y !== void 0 && (xmin <= x && x <= xmax) && (ymin <= y && y <= ymax)) {
                selectedIndices.push(i);
            }
        }
        return selectedIndices;
    };
    structureOf = function (vectors) {
        return _.map(vectors, function (vector) {
            return vector.type;
        }).join(', ');
    };
    createRectMark = function (expr, vectors) {
        var fillColor, fillOpacity, height, lineWidth, positionX, positionX1, positionX2, positionY, positionY1, positionY2, ref, ref1, ref2, ref3, ref4, ref5, ref6, ref7, space, strokeColor, strokeOpacity, structure, width;
        structure = structureOf(vectors);
        switch (structure) {
        case 'String, Number':
            positionX = vectors[0], positionY2 = vectors[1];
            space = new Space2D([positionX], [positionY2]);
            width = (ref = expr.width) != null ? ref : new ConstantWidthChannel(0.8);
            ref1 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = ref1[0], fillOpacity = ref1[1], strokeColor = ref1[2], strokeOpacity = ref1[3], lineWidth = ref1[4];
            return new ColMark(space, positionX, void 0, positionY2, width, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        case 'String, Number, Number':
            positionX = vectors[0], positionY1 = vectors[1], positionY2 = vectors[2];
            space = new Space2D([positionX], [
                positionY1,
                positionY2
            ]);
            width = (ref2 = expr.width) != null ? ref2 : new ConstantWidthChannel(0.8);
            ref3 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = ref3[0], fillOpacity = ref3[1], strokeColor = ref3[2], strokeOpacity = ref3[3], lineWidth = ref3[4];
            return new ColMark(space, positionX, positionY1, positionY2, width, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        case 'Number, String':
            positionX2 = vectors[0], positionY = vectors[1];
            space = new Space2D([positionX2], [positionY]);
            height = (ref4 = expr.height) != null ? ref4 : new ConstantHeightChannel(0.8);
            ref5 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = ref5[0], fillOpacity = ref5[1], strokeColor = ref5[2], strokeOpacity = ref5[3], lineWidth = ref5[4];
            return new BarMark(space, void 0, positionX2, positionY, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        case 'Number, Number, String':
            positionX1 = vectors[0], positionX2 = vectors[1], positionY = vectors[2];
            space = new Space2D([
                positionX1,
                positionX2
            ], [positionY]);
            height = (ref6 = expr.height) != null ? ref6 : new ConstantHeightChannel(0.8);
            ref7 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = ref7[0], fillOpacity = ref7[1], strokeColor = ref7[2], strokeOpacity = ref7[3], lineWidth = ref7[4];
            return new BarMark(space, positionX1, positionX2, positionY, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        default:
            throw new Error('Cannot create rect marks with vectors of type [' + structure + ']');
        }
    };
    encodeColMark = function (frame, mark, axisX, axisY) {
        var fill, fillColor, fillOpacity, lineWidth, positionX, positionY1, positionY2, ref, ref1, stroke, strokeColor, strokeOpacity, tooltip, width;
        positionX = encodePosition(axisX, mark.positionX);
        positionY1 = mark.positionY1 ? encodePosition(axisY, mark.positionY1) : encodeConstantPosition(axisY, 0);
        positionY2 = encodePosition(axisY, mark.positionY2);
        width = encodeSize(frame, mark.width, axisX.rect.width / axisX.domain.length);
        ref = encodeFill(frame, mark), fillColor = ref[0], fillOpacity = ref[1], fill = ref[2];
        ref1 = encodeStroke(frame, mark), strokeColor = ref1[0], strokeOpacity = ref1[1], stroke = ref1[2], lineWidth = ref1[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new ColEncoding(positionX, positionY1, positionY2, width, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    encodeBarMark = function (frame, mark, axisX, axisY) {
        var fill, fillColor, fillOpacity, height, lineWidth, positionX1, positionX2, positionY, ref, ref1, ref2, stroke, strokeColor, strokeOpacity, tooltip, x1, x2, y;
        switch (mark.space.x.length) {
        case 1:
            x2 = mark.space.x[0];
            positionX1 = encodeConstantPosition(axisX, 0);
            positionX2 = encodePosition(axisX, x2);
            break;
        default:
            ref = mark.space.x, x1 = ref[0], x2 = ref[1];
            positionX1 = encodePosition(axisX, x1);
            positionX2 = encodePosition(axisX, x2);
        }
        y = mark.space.y[0];
        positionY = encodePosition(axisY, y);
        height = encodeSize(frame, mark.height, axisY.rect.height / axisY.domain.length);
        ref1 = encodeFill(frame, mark), fillColor = ref1[0], fillOpacity = ref1[1], fill = ref1[2];
        ref2 = encodeStroke(frame, mark), strokeColor = ref2[0], strokeOpacity = ref2[1], stroke = ref2[2], lineWidth = ref2[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new BarEncoding(positionX1, positionX2, positionY, height, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightColMarks = function (indices, encoders, g) {
        var fill, i, l, len, len1, lineWidth, m, positionX, positionY1, positionY2, stroke, w, width, x, y1, y2;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y1 = positionY1(i);
            y2 = positionY2(i);
            w = width(i);
            if (x !== void 0 && y1 !== void 0 && y2 !== void 0 && w !== void 0) {
                doRectY(g, x, y1, y2, w);
                g.lineWidth = 2 + (stroke ? lineWidth(i) : 1);
                g.stroke();
            }
        }
        g.restore();
        g.save();
        g.globalCompositeOperation = 'destination-out';
        g.fillStyle = g.strokeStyle = 'black';
        for (m = 0, len1 = indices.length; m < len1; m++) {
            i = indices[m];
            x = positionX(i);
            y1 = positionY1(i);
            y2 = positionY2(i);
            w = width(i);
            if (x !== void 0 && y1 !== void 0 && y2 !== void 0 && w !== void 0) {
                doRectY(g, x, y1, y2, w);
                if (stroke) {
                    g.lineWidth = lineWidth(i);
                    g.stroke();
                }
                if (fill) {
                    g.fill();
                }
            }
        }
        return g.restore();
    };
    highlightBarMarks = function (indices, encoders, g) {
        var fill, h, height, i, l, len, len1, lineWidth, m, positionX1, positionX2, positionY, stroke, x1, x2, y;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x1 = positionX1(i);
            x2 = positionX2(i);
            y = positionY(i);
            h = height(i);
            if (x1 !== void 0 && x2 !== void 0 && y !== void 0 && h !== void 0) {
                doRectX(g, x1, x2, y, h);
                g.lineWidth = 2 + (stroke ? lineWidth(i) : 1);
                g.stroke();
            }
        }
        g.restore();
        g.save();
        g.globalCompositeOperation = 'destination-out';
        g.fillStyle = g.strokeStyle = 'black';
        for (m = 0, len1 = indices.length; m < len1; m++) {
            i = indices[m];
            x1 = positionX1(i);
            x2 = positionX2(i);
            y = positionY(i);
            h = height(i);
            if (x1 !== void 0 && x2 !== void 0 && y !== void 0 && h !== void 0) {
                doRectX(g, x1, x2, y, h);
                if (stroke) {
                    g.lineWidth = lineWidth(i);
                    g.stroke();
                }
                if (fill) {
                    g.fill();
                }
            }
        }
        return g.restore();
    };
    maskColMarks = function (indices, encoders, g, mask) {
        var i, l, len, lineWidth, maskStyle, positionX, positionY1, positionY2, stroke, w, width, x, y1, y2;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y1 = positionY1(i);
            y2 = positionY2(i);
            w = width(i);
            if (x !== void 0 && y1 !== void 0 && y2 !== void 0 && w !== void 0) {
                maskStyle = mask.put(i);
                doRectY(g, x, y1, y2, w);
                doFill(g, maskStyle);
                if (stroke) {
                    doStroke(g, maskStyle, lineWidth(i));
                }
            }
        }
        return g.restore();
    };
    maskBarMarks = function (indices, encoders, g, mask) {
        var h, height, i, l, len, lineWidth, maskStyle, positionX1, positionX2, positionY, stroke, x1, x2, y;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x1 = positionX1(i);
            x2 = positionX2(i);
            y = positionY(i);
            h = height(i);
            if (x1 !== void 0 && x2 !== void 0 && y !== void 0 && h !== void 0) {
                maskStyle = mask.put(i);
                doRectX(g, x1, x2, y, h);
                doFill(g, maskStyle);
                if (stroke) {
                    doStroke(g, maskStyle, lineWidth(i));
                }
            }
        }
        return g.restore();
    };
    renderColMarks = function (indices, encoders, g) {
        var fill, i, l, len, lineWidth, positionX, positionY1, positionY2, stroke, w, width, x, y1, y2;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y1 = positionY1(i);
            y2 = positionY2(i);
            w = width(i);
            if (x !== void 0 && y1 !== void 0 && y2 !== void 0 && w !== void 0) {
                doRectY(g, x, y1, y2, w);
                if (stroke) {
                    doStroke(g, stroke(i), lineWidth(i));
                }
                if (fill) {
                    doFill(g, fill(i));
                }
            }
        }
        return g.restore();
    };
    renderBarMarks = function (indices, encoders, g) {
        var fill, h, height, i, l, len, lineWidth, positionX1, positionX2, positionY, stroke, x1, x2, y;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x1 = positionX1(i);
            x2 = positionX2(i);
            y = positionY(i);
            h = height(i);
            if (x1 !== void 0 && x2 !== void 0 && y !== void 0 && h !== void 0) {
                doRectX(g, x1, x2, y, h);
                if (stroke) {
                    doStroke(g, stroke(i), lineWidth(i));
                }
                if (fill) {
                    doFill(g, fill(i));
                }
            }
        }
        return g.restore();
    };
    selectColMarks = function (indices, encoders, xmin, ymin, xmax, ymax) {
        var i, l, len, positionX, positionY1, positionY2, selectedIndices, w, width, x, x1, x2, y1, y2, yt;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width;
        selectedIndices = [];
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y1 = positionY1(i);
            y2 = positionY2(i);
            if (y1 > y2) {
                yt = y1;
                y1 = y2;
                y2 = yt;
            }
            w = width(i);
            if (x !== void 0 && y1 !== void 0 && y2 !== void 0 && w !== void 0) {
                x1 = x - w / 2;
                x2 = x + w / 2;
                if (!(xmin > x2 || xmax < x1 || ymin > y2 || ymax < y1)) {
                    selectedIndices.push(i);
                }
            }
        }
        return selectedIndices;
    };
    selectBarMarks = function (indices, encoders, xmin, ymin, xmax, ymax) {
        var h, height, i, l, len, positionX1, positionX2, positionY, selectedIndices, x1, x2, xt, y, y1, y2;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height;
        selectedIndices = [];
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x1 = positionX1(i);
            x2 = positionX2(i);
            y = positionY(i);
            if (x1 > x2) {
                xt = x1;
                x1 = x2;
                x2 = xt;
            }
            h = height(i);
            if (x1 !== void 0 && x2 !== void 0 && y !== void 0 && h !== void 0) {
                y1 = y - h / 2;
                y2 = y + h / 2;
                if (!(xmin > x2 || xmax < x1 || ymin > y2 || ymax < y1)) {
                    selectedIndices.push(i);
                }
            }
        }
        return selectedIndices;
    };
    createSchemaMark = function (expr, vectors) {
        var height, lineWidth, q0, q1, q2, q3, qn, ref, ref1, ref2, ref3, space, strokeColor, strokeOpacity, structure, width, x, y;
        structure = structureOf(vectors);
        switch (structure) {
        case 'String, Number, Number, Number, Number, Number':
            x = vectors[0], q0 = vectors[1], q1 = vectors[2], q2 = vectors[3], q3 = vectors[4], qn = vectors[5];
            space = new Space2D([x], [
                q0,
                q1,
                q2,
                q3,
                qn
            ]);
            width = (ref = expr.width) != null ? ref : new ConstantWidthChannel(0.8);
            ref1 = initStroke(expr.strokeColor, expr.strokeOpacity, expr.lineWidth), strokeColor = ref1[0], strokeOpacity = ref1[1], lineWidth = ref1[2];
            return new SchemaYMark(space, x, q0, q1, q2, q3, qn, width, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        case 'Number, Number, Number, Number, Number, String':
            q0 = vectors[0], q1 = vectors[1], q2 = vectors[2], q3 = vectors[3], qn = vectors[4], y = vectors[5];
            space = new Space2D([
                q0,
                q1,
                q2,
                q3,
                qn
            ], [y]);
            height = (ref2 = expr.height) != null ? ref2 : new ConstantWidthChannel(0.8);
            ref3 = initStroke(expr.strokeColor, expr.strokeOpacity, expr.lineWidth), strokeColor = ref3[0], strokeOpacity = ref3[1], lineWidth = ref3[2];
            return new SchemaXMark(space, q0, q1, q2, q3, qn, y, height, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        }
    };
    encodeSchemaXMark = function (frame, mark, axisX, axisY) {
        var height, lineWidth, q0, q1, q2, q3, qn, ref, stroke, strokeColor, strokeOpacity, tooltip, y;
        q0 = encodePosition(axisX, mark.q0);
        q1 = encodePosition(axisX, mark.q1);
        q2 = encodePosition(axisX, mark.q2);
        q3 = encodePosition(axisX, mark.q3);
        qn = encodePosition(axisX, mark.qn);
        y = encodePosition(axisY, mark.positionY);
        height = encodeSize(frame, mark.height, axisY.rect.height / axisY.domain.length);
        ref = encodeStroke(frame, mark), strokeColor = ref[0], strokeOpacity = ref[1], stroke = ref[2], lineWidth = ref[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new SchemaXEncoding(q0, q1, q2, q3, qn, y, height, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightSchemaXMarks = function (indices, encoders, g) {
        var height, i, l, len, len1, lineWidth, m, positionY, q0, q1, q2, q3, qn, stroke;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            doSchemaX(g, q0(i), q1(i), q2(i), q3(i), qn(i), positionY(i), height(i), stroke(i), 2 + (stroke ? lineWidth(i) : 1));
        }
        g.restore();
        g.save();
        g.globalCompositeOperation = 'destination-out';
        g.strokeStyle = 'black';
        for (m = 0, len1 = indices.length; m < len1; m++) {
            i = indices[m];
            doSchemaX(g, q0(i), q1(i), q2(i), q3(i), qn(i), positionY(i), height(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    maskSchemaXMarks = function (indices, encoders, g, mask) {
        var h, height, i, l, len, lineWidth, maskStyle, positionY, q0, q1, q2, q3, qn, stroke, x1, x2, y;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x1 = q0(i);
            x2 = qn(i);
            y = positionY(i);
            h = height(i);
            if (x1 !== void 0 && x2 !== void 0 && y !== void 0 && h !== void 0) {
                maskStyle = mask.put(i);
                doRectX(g, x1, x2, y, h);
                doFill(g, maskStyle);
                doStroke(g, maskStyle, lineWidth(i));
            }
        }
        return g.restore();
    };
    renderSchemaXMarks = function (indices, encoders, g) {
        var height, i, l, len, lineWidth, positionY, q0, q1, q2, q3, qn, stroke;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            doSchemaX(g, q0(i), q1(i), q2(i), q3(i), qn(i), positionY(i), height(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    selectSchemaXMarks = function (indices, encoders, xmin, ymin, xmax, ymax) {
        var h, height, i, l, len, lineWidth, positionY, q0, q1, q2, q3, qn, selectedIndices, stroke, x1, x2, xt, y, y1, y2;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        selectedIndices = [];
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x1 = q0(i);
            x2 = qn(i);
            y = positionY(i);
            if (x1 > x2) {
                xt = x1;
                x1 = x2;
                x2 = xt;
            }
            h = height(i);
            if (x1 !== void 0 && x2 !== void 0 && y !== void 0 && h !== void 0) {
                y1 = y - h / 2;
                y2 = y + h / 2;
                if (!(xmin > x2 || xmax < x1 || ymin > y2 || ymax < y1)) {
                    selectedIndices.push(i);
                }
            }
        }
        return selectedIndices;
    };
    encodeSchemaYMark = function (frame, mark, axisX, axisY) {
        var lineWidth, q0, q1, q2, q3, qn, ref, stroke, strokeColor, strokeOpacity, tooltip, width, x;
        x = encodePosition(axisX, mark.positionX);
        q0 = encodePosition(axisY, mark.q0);
        q1 = encodePosition(axisY, mark.q1);
        q2 = encodePosition(axisY, mark.q2);
        q3 = encodePosition(axisY, mark.q3);
        qn = encodePosition(axisY, mark.qn);
        width = encodeSize(frame, mark.width, axisX.rect.width / axisX.domain.length);
        ref = encodeStroke(frame, mark), strokeColor = ref[0], strokeOpacity = ref[1], stroke = ref[2], lineWidth = ref[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new SchemaYEncoding(x, q0, q1, q2, q3, qn, width, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightSchemaYMarks = function (indices, encoders, g) {
        var i, l, len, len1, lineWidth, m, positionX, q0, q1, q2, q3, qn, stroke, width;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            doSchemaY(g, positionX(i), q0(i), q1(i), q2(i), q3(i), qn(i), width(i), stroke(i), 2 + (stroke ? lineWidth(i) : 1));
        }
        g.restore();
        g.save();
        g.globalCompositeOperation = 'destination-out';
        g.strokeStyle = 'black';
        for (m = 0, len1 = indices.length; m < len1; m++) {
            i = indices[m];
            doSchemaY(g, positionX(i), q0(i), q1(i), q2(i), q3(i), qn(i), width(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    maskSchemaYMarks = function (indices, encoders, g, mask) {
        var i, l, len, lineWidth, maskStyle, positionX, q0, q1, q2, q3, qn, stroke, w, width, x, y1, y2;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y1 = q0(i);
            y2 = qn(i);
            w = width(i);
            if (x !== void 0 && y1 !== void 0 && y2 !== void 0 && w !== void 0) {
                maskStyle = mask.put(i);
                doRectY(g, x, y1, y2, w);
                doFill(g, maskStyle);
                doStroke(g, maskStyle, lineWidth(i));
            }
        }
        return g.restore();
    };
    renderSchemaYMarks = function (indices, encoders, g) {
        var i, l, len, lineWidth, positionX, q0, q1, q2, q3, qn, stroke, width;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            doSchemaY(g, positionX(i), q0(i), q1(i), q2(i), q3(i), qn(i), width(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    selectSchemaYMarks = function (indices, encoders, xmin, ymin, xmax, ymax) {
        var i, l, len, lineWidth, positionX, q0, q1, q2, q3, qn, selectedIndices, stroke, w, width, x, x1, x2, y1, y2, yt;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        selectedIndices = [];
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y1 = q0(i);
            y2 = qn(i);
            if (y1 > y2) {
                yt = y1;
                y1 = y2;
                y2 = yt;
            }
            w = width(i);
            if (x !== void 0 && y1 !== void 0 && y2 !== void 0 && w !== void 0) {
                x1 = x - w / 2;
                x2 = x + w / 2;
                if (!(xmin > x2 || xmax < x1 || ymin > y2 || ymax < y1)) {
                    selectedIndices.push(i);
                }
            }
        }
        return selectedIndices;
    };
    createPathMark = function (expr, vectors) {
        var lineWidth, positionX, positionY, ref, space, strokeColor, strokeOpacity;
        positionX = vectors[0], positionY = vectors[1];
        space = new Space2D([positionX], [positionY]);
        ref = initStroke(expr.strokeColor, expr.strokeOpacity, expr.lineWidth), strokeColor = ref[0], strokeOpacity = ref[1], lineWidth = ref[2];
        return new PathMark(space, positionX, positionY, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
    };
    encodePathMark = function (frame, mark, axisX, axisY) {
        var lineWidth, positionX, positionY, ref, stroke, strokeColor, strokeOpacity, tooltip;
        positionX = encodePosition(axisX, mark.positionX);
        positionY = encodePosition(axisY, mark.positionY);
        ref = encodeStroke(frame, mark), strokeColor = ref[0], strokeOpacity = ref[1], stroke = ref[2], lineWidth = ref[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new PathEncoding(positionX, positionY, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightPathMarks = function (indices, encoders, g) {
        var i, l, len, positionX, positionY, x, y;
        positionX = encoders.positionX, positionY = encoders.positionY;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y = positionY(i);
            g.lineWidth = 1.5;
            g.strokeStyle = 'black';
            if (x !== void 0 && y !== void 0) {
                drawCircle(g, x, y, 64);
                g.stroke();
            }
        }
        return g.restore();
    };
    maskPathMarks = function (indices, encoders, g, mask) {
        var i, l, len, positionX, positionY, x, y;
        positionX = encoders.positionX, positionY = encoders.positionY;
        g.save();
        for (l = 0, len = indices.length; l < len; l++) {
            i = indices[l];
            x = positionX(i);
            y = positionY(i);
            if (x !== void 0 && y !== void 0) {
                drawCircle(g, x, y, 64);
                g.fillStyle = mask.put(i);
                g.fill();
            }
        }
        return g.restore();
    };
    renderPathMarks = function (indices, encoders, g) {
        var _inPath, gradient, i, l, len, len1, lineWidth, m, positionX, positionY, stroke, stroke1, stroke2, x, x1, x2, y, y1, y2;
        positionX = encoders.positionX, positionY = encoders.positionY, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        if (stroke instanceof ConstantEncoder && lineWidth instanceof ConstantEncoder) {
            g.strokeStyle = stroke();
            g.lineWidth = lineWidth();
            g.save();
            _inPath = false;
            for (l = 0, len = indices.length; l < len; l++) {
                i = indices[l];
                x = positionX(i);
                y = positionY(i);
                if (x !== void 0 && y !== void 0) {
                    if (_inPath) {
                        g.lineTo(x, y);
                    } else {
                        g.beginPath();
                        _inPath = true;
                        g.moveTo(x, y);
                    }
                } else {
                    if (_inPath) {
                        g.stroke();
                    }
                    _inPath = false;
                }
            }
            return g.restore();
        } else {
            g.save();
            g.lineCap = 'round';
            _inPath = false;
            x1 = void 0;
            y1 = void 0;
            stroke1 = void 0;
            for (m = 0, len1 = indices.length; m < len1; m++) {
                i = indices[m];
                x2 = positionX(i);
                y2 = positionY(i);
                if (x2 !== void 0 && y2 !== void 0) {
                    stroke2 = stroke(i);
                    if (_inPath) {
                        if (stroke2 !== stroke1) {
                            gradient = g.createLinearGradient(x1, y1, x2, y2);
                            gradient.addColorStop(0, stroke1 || Transparent);
                            gradient.addColorStop(1, stroke2 || Transparent);
                            g.strokeStyle = gradient;
                        } else {
                            g.strokeStyle = stroke2;
                        }
                        g.lineWidth = lineWidth(i);
                        g.beginPath();
                        g.moveTo(x1, y1);
                        g.lineTo(x2, y2);
                        g.stroke();
                    }
                    _inPath = true;
                    x1 = x2;
                    y1 = y2;
                    stroke1 = stroke2;
                } else {
                    _inPath = false;
                }
            }
            return g.restore();
        }
    };
    createMark = dispatch([
        PointExpr,
        Array,
        createPointMark
    ], [
        PathExpr,
        Array,
        createPathMark
    ], [
        RectExpr,
        Array,
        createRectMark
    ], [
        SchemaExpr,
        Array,
        createSchemaMark
    ]);
    createAnnotation = dispatch([
        LineExpr,
        createLineAnnotation
    ]);
    PointGeometry = new Geometry(encodePointMark, maskPointMarks, highlightPointMarks, renderPointMarks, selectMarks);
    PathGeometry = new Geometry(encodePathMark, maskPathMarks, highlightPathMarks, renderPathMarks, selectMarks);
    ColGeometry = new Geometry(encodeColMark, maskColMarks, highlightColMarks, renderColMarks, selectColMarks);
    BarGeometry = new Geometry(encodeBarMark, maskBarMarks, highlightBarMarks, renderBarMarks, selectBarMarks);
    SchemaXGeometry = new Geometry(encodeSchemaXMark, maskSchemaXMarks, highlightSchemaXMarks, renderSchemaXMarks, selectSchemaXMarks);
    SchemaYGeometry = new Geometry(encodeSchemaYMark, maskSchemaYMarks, highlightSchemaYMarks, renderSchemaYMarks, selectSchemaYMarks);
    plot_bounds = dispatch([
        Number,
        null,
        function (width, height) {
            return new Bounds(width, void 0);
        }
    ], [
        null,
        Number,
        function (width, height) {
            return new Bounds(void 0, height);
        }
    ], [
        Number,
        Number,
        function (width, height) {
            return new Bounds(width, height);
        }
    ], [
        null,
        null,
        function () {
            return new Bounds(void 0, void 0);
        }
    ]);
    plot_domainX_HACK = dispatch([
        Number,
        Number,
        function (min, max) {
            return new DomainX(min, max);
        }
    ]);
    plot_domainY_HACK = dispatch([
        Number,
        Number,
        function (min, max) {
            return new DomainY(min, max);
        }
    ]);
    plot_from = dispatch([
        Frame,
        _.identity
    ], [
        Function,
        function (read) {
            return new Datasource(read);
        }
    ]);
    plot_value = dispatch([
        Number,
        function (value) {
            return new NumberValue(value);
        }
    ], [
        Boolean,
        function (value) {
            return new BooleanValue(value);
        }
    ], [
        Date,
        function (value) {
            return new DateValue(value);
        }
    ], [
        String,
        function (value) {
            return new StringValue(value);
        }
    ]);
    plot_range = dispatch([
        Array,
        function (a) {
            return new CategoricalRange(a);
        }
    ], [
        Number,
        function (a) {
            if (a > 0) {
                return new SequentialRange(0, a);
            } else if (a < 0) {
                return new SequentialRange(a, 0);
            } else {
                return new DivergingRange(-1, 0, 1);
            }
        }
    ], [
        String,
        function (a) {
            return new SequentialColorRange(a, 'black');
        }
    ], [
        Number,
        Number,
        function (a, b) {
            if (a <= b) {
                return new SequentialRange(a, b);
            } else {
                return new SequentialRange(b, a);
            }
        }
    ], [
        String,
        String,
        function (a, b) {
            return new SequentialColorRange(a, b);
        }
    ], [
        Number,
        Number,
        Number,
        function (a, b, c) {
            var p, q, r, ref;
            ref = _.sortBy([
                a,
                b,
                c
            ], _.identity), p = ref[0], q = ref[1], r = ref[2];
            return new DivergingRange(p, q, r);
        }
    ], [
        String,
        String,
        String,
        function (a, b, c) {
            return new DivergingColorRange(a, b, c);
        }
    ]);
    collectFields = function (args) {
        var arg, l, len, results, type;
        results = [];
        for (l = 0, len = args.length; l < len; l++) {
            arg = args[l];
            if (arg instanceof Field) {
                results.push(arg);
            } else if (TString === (type = typeOf(arg))) {
                results.push(new Field(arg));
            } else {
                throw new Error('Cannot create vector reference from [' + arg + '] of type [' + type + '].');
            }
        }
        return results;
    };
    plot_position = function () {
        var arg, args, field;
        args = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
        if (_.every(args, function (arg) {
                return arg instanceof Value;
            })) {
            return new PositionChannel(function () {
                var l, len, results;
                results = [];
                for (l = 0, len = args.length; l < len; l++) {
                    arg = args[l];
                    results.push(new ConstantCoordChannel(arg.value));
                }
                return results;
            }());
        } else {
            return new PositionChannel(function () {
                var l, len, ref, results;
                ref = collectFields(args);
                results = [];
                for (l = 0, len = ref.length; l < len; l++) {
                    field = ref[l];
                    results.push(new VariableCoordChannel(field));
                }
                return results;
            }());
        }
    };
    plot_fillColor = dispatch([
        StringValue,
        function (value) {
            return new ConstantFillColorChannel(chroma(value.value));
        }
    ], [
        String,
        function (name) {
            return new VariableFillColorChannel(new Field(name));
        }
    ], [
        Field,
        function (field) {
            return new VariableFillColorChannel(field);
        }
    ], [
        String,
        ColorRange,
        function (name, range) {
            return new VariableFillColorChannel(new Field(name), range);
        }
    ], [
        Field,
        ColorRange,
        function (field, range) {
            return new VariableFillColorChannel(field, range);
        }
    ], [
        String,
        CategoricalRange,
        function (name, range) {
            return new VariableFillColorChannel(new Field(name), range);
        }
    ], [
        Field,
        CategoricalRange,
        function (field, range) {
            return new VariableFillColorChannel(field, range);
        }
    ]);
    plot_fillOpacity = dispatch([
        NumberValue,
        function (value) {
            return new ConstantFillOpacityChannel(value.value);
        }
    ], [
        String,
        function (name) {
            return new VariableFillOpacityChannel(new Field(name));
        }
    ], [
        Field,
        function (field) {
            return new VariableFillOpacityChannel(field);
        }
    ], [
        String,
        SequentialRange,
        function (name, range) {
            return new VariableFillOpacityChannel(new Field(name), range);
        }
    ], [
        Field,
        SequentialRange,
        function (field, range) {
            return new VariableFillOpacityChannel(field, range);
        }
    ]);
    plot_strokeColor = dispatch([
        StringValue,
        function (value) {
            return new ConstantStrokeColorChannel(chroma(value.value));
        }
    ], [
        String,
        function (name) {
            return new VariableStrokeColorChannel(new Field(name));
        }
    ], [
        Field,
        function (field) {
            return new VariableStrokeColorChannel(field);
        }
    ], [
        String,
        ColorRange,
        function (name, range) {
            return new VariableStrokeColorChannel(new Field(name), range);
        }
    ], [
        Field,
        ColorRange,
        function (field, range) {
            return new VariableStrokeColorChannel(field, range);
        }
    ], [
        String,
        CategoricalRange,
        function (name, range) {
            return new VariableStrokeColorChannel(new Field(name), range);
        }
    ], [
        Field,
        CategoricalRange,
        function (field, range) {
            return new VariableStrokeColorChannel(field, range);
        }
    ]);
    plot_strokeOpacity = dispatch([
        NumberValue,
        function (value) {
            return new ConstantStrokeOpacityChannel(value.value);
        }
    ], [
        String,
        function (name) {
            return new VariableStrokeOpacityChannel(new Field(name));
        }
    ], [
        Field,
        function (field) {
            return new VariableStrokeOpacityChannel(field);
        }
    ], [
        String,
        SequentialRange,
        function (name, range) {
            return new VariableStrokeOpacityChannel(new Field(name), range);
        }
    ], [
        Field,
        SequentialRange,
        function (field, range) {
            return new VariableStrokeOpacityChannel(field, range);
        }
    ]);
    dispatch_numeric = function (constChannelClass, variableChannelClass) {
        return dispatch([
            NumberValue,
            function (value) {
                return new constChannelClass(value.value);
            }
        ], [
            String,
            function (name) {
                return new variableChannelClass(new Field(name));
            }
        ], [
            Field,
            function (field) {
                return new variableChannelClass(field);
            }
        ], [
            String,
            SequentialRange,
            function (name, range) {
                return new variableChannelClass(new Field(name), range);
            }
        ], [
            Field,
            SequentialRange,
            function (field, range) {
                return new variableChannelClass(field, range);
            }
        ]);
    };
    plot_size = dispatch_numeric(ConstantSizeChannel, VariableSizeChannel);
    plot_width = dispatch_numeric(ConstantWidthChannel, VariableWidthChannel);
    plot_height = dispatch_numeric(ConstantHeightChannel, VariableHeightChannel);
    plot_lineWidth = dispatch([
        NumberValue,
        function (value) {
            return new ConstantLineWidthChannel(value.value);
        }
    ], [
        String,
        function (name) {
            return new VariableLineWidthChannel(new Field(name));
        }
    ], [
        Field,
        function (field) {
            return new VariableLineWidthChannel(field);
        }
    ], [
        String,
        SequentialRange,
        function (name, range) {
            return new VariableLineWidthChannel(new Field(name), range);
        }
    ], [
        Field,
        SequentialRange,
        function (field, range) {
            return new VariableLineWidthChannel(field, range);
        }
    ]);
    plot_shape = dispatch([
        StringValue,
        function (value) {
            return new ConstantShapeChannel(value.value);
        }
    ], [
        String,
        function (name) {
            return new VariableShapeChannel(new Field(name));
        }
    ], [
        Field,
        function (field) {
            return new VariableShapeChannel(field);
        }
    ], [
        String,
        CategoricalRange,
        function (name, range) {
            return new VariableShapeChannel(new Field(name), range);
        }
    ], [
        Field,
        CategoricalRange,
        function (field, range) {
            return new VariableShapeChannel(field, range);
        }
    ]);
    plot_tooltip = function () {
        var args;
        args = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
        return new VariableTooltipChannel(collectFields(args));
    };
    plot_select = function () {
        var arg, args;
        args = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
        if (args.length === 1 && _.isNumber(arg = _.head(args))) {
            return new RecordExpr(arg);
        } else {
            return new SelectExpr(collectFields(args));
        }
    };
    readDataPackageSchema = function (schema) {
        var field, l, len, ref, results;
        results = [];
        for (l = 0, len = schema.length; l < len; l++) {
            field = schema[l];
            switch (field.type) {
            case 'string':
                results.push({
                    label: field.name,
                    type: 'String',
                    domain: (ref = field.lightningDomain) != null ? ref : [],
                    parse: asAny
                });
                break;
            case 'integer':
                results.push({
                    label: field.name,
                    type: 'Number',
                    parse: asInt
                });
                break;
            case 'number':
                results.push({
                    label: field.name,
                    type: 'Number',
                    parse: asReal
                });
                break;
            default:
                throw new Error('Invalid type [' + field.type + '] for schema field [' + field.name + ']');
            }
        }
        return results;
    };
    readCsvAsFrame = function (label, columns, data, hasHeader) {
        var column, index, offset, result, row, rows, value, vectors;
        result = Papa.parse(data, { skipEmptyLines: true });
        rows = result.data;
        if (hasHeader) {
            rows.shift();
        }
        vectors = function () {
            var l, len, len1, m, results;
            results = [];
            for (offset = l = 0, len = columns.length; l < len; offset = ++l) {
                column = columns[offset];
                data = new Array(rows.length);
                for (index = m = 0, len1 = rows.length; m < len1; index = ++m) {
                    row = rows[index];
                    if (void 0 !== (value = column.parse(row[offset]))) {
                        data[index] = value;
                    }
                }
                switch (column.type) {
                case 'String':
                    results.push(createFactor(column.label, column.type, data, column.domain));
                    break;
                case 'Number':
                    results.push(createVector(column.label, column.type, data, _.identity));
                    break;
                default:
                    results.push(void 0);
                }
            }
            return results;
        }();
        return createFrame(label, vectors, _.range(rows.length));
    };
    plot_computed = function (label0, start, end, step, columns) {
        return function (go) {
            var at0, expr, functor_, label, rowCount, vectors;
            rowCount = Math.floor((end - start) / step);
            at0 = function (i) {
                return start + i * step;
            };
            functor_ = function (label, expr) {
                var at;
                at = function (i) {
                    return expr(at0(i));
                };
                return createFunctor(label, label, 'Number', rowCount, at, _.identity);
            };
            vectors = function () {
                var results;
                results = [];
                for (label in columns) {
                    expr = columns[label];
                    results.push(functor_(label, expr));
                }
                return results;
            }();
            vectors.unshift(createFunctor(label0, label0, 'Number', rowCount, at0, _.identity));
            return go(null, createFrame('computed', vectors, _.range(rowCount)));
        };
    };
    plot_dataPackage = function (url) {
        return function (go) {
            return download('json', url + '/datapackage.json', function (error, dataPackage) {
                var resource, resourcePath;
                if (error) {
                    return go(error);
                } else {
                    if (resource = _.head(dataPackage.resources)) {
                        if (resourcePath = resource.path) {
                            return download('text', url + '/' + resourcePath, function (error, data) {
                                if (error) {
                                    return go(error);
                                } else {
                                    try {
                                        return go(null, readCsvAsFrame(dataPackage.name, readDataPackageSchema(resource.schema), data, true));
                                    } catch (error1) {
                                        error = error1;
                                        return go(error);
                                    }
                                }
                            });
                        } else {
                            return go(new Error('Resource is missing attribute [path].'));
                        }
                    } else {
                        return go(new Error('No resources found in data package.'));
                    }
                }
            });
        };
    };
    createExpr_ = function () {
        var expr, types;
        expr = arguments[0], types = 2 <= arguments.length ? slice1.call(arguments, 1) : [];
        return function () {
            var ops;
            ops = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
            return applyc(expr, findByTypes(ops, types));
        };
    };
    plot_point = createExpr_(PointExpr, PositionChannel, ShapeChannel, SizeChannel, FillColorChannel, FillOpacityChannel, StrokeColorChannel, StrokeOpacityChannel, LineWidthChannel, TooltipChannel);
    plot_rect = createExpr_(RectExpr, PositionChannel, WidthChannel, HeightChannel, FillColorChannel, FillOpacityChannel, StrokeColorChannel, StrokeOpacityChannel, LineWidthChannel, TooltipChannel);
    plot_path = createExpr_(PathExpr, PositionChannel, StrokeColorChannel, StrokeOpacityChannel, LineWidthChannel, TooltipChannel);
    plot_schema = createExpr_(SchemaExpr, PositionChannel, WidthChannel, HeightChannel, StrokeColorChannel, StrokeOpacityChannel, LineWidthChannel, TooltipChannel);
    plot_line = createExpr_(LineExpr, PositionChannel, StrokeColorChannel, StrokeOpacityChannel, LineWidthChannel);
    plot_parse = function (esprima, escodegen) {
        var traverse;
        traverse = function (node, f) {
            var child, i, results, results1;
            if (_.isArray(node)) {
                i = node.length;
                results = [];
                while (i--) {
                    child = node[i];
                    if (child !== null && _.isObject(child)) {
                        traverse(child, f);
                        results.push(f(child));
                    } else {
                        results.push(void 0);
                    }
                }
                return results;
            } else {
                results1 = [];
                for (i in node) {
                    if (!hasProp.call(node, i))
                        continue;
                    child = node[i];
                    if (child !== null && _.isObject(child)) {
                        traverse(child, f);
                        results1.push(f(child));
                    } else {
                        results1.push(void 0);
                    }
                }
                return results1;
            }
        };
        return function (js) {
            var ast;
            ast = esprima.parse(js);
            traverse(ast, function (node) {
                var name;
                if (node.type === 'CallExpression' && node.callee.type === 'Identifier') {
                    if (_.isFunction(plot[name = node.callee.name])) {
                        node.callee = {
                            type: 'MemberExpression',
                            computed: false,
                            object: {
                                type: 'Identifier',
                                name: 'plot'
                            },
                            property: {
                                type: 'Identifier',
                                name: name
                            }
                        };
                    }
                } else if (node.type === 'Identifier') {
                    if (_.isFunction(plot[name = node.name])) {
                        delete node.name;
                        node.type = 'MemberExpression';
                        node.computed = false;
                        node.object = {
                            type: 'Identifier',
                            name: 'plot'
                        };
                        node.property = {
                            type: 'Identifier',
                            name: name
                        };
                    }
                }
            });
            return escodegen.generate(ast);
        };
    };
    plot_settings = {
        maxCanvasSize: new Size(795, 600),
        visualizationSize: new Size(300, 300),
        axisLabelFont: '10px monospace',
        axisTickColor: '#4d4d4d',
        axisTitleFont: 'bold 10px monospace',
        axisLabelColor: '#4d4d4d',
        gridLineColor: '#eee',
        originLineColor: '#ccc'
    };
    px = function (pixels) {
        return Math.round(pixels) + 'px';
    };
    createDOMElement = function (tag, styles) {
        var el, name, style, value;
        el = document.createElement(tag);
        style = el.style;
        for (name in styles) {
            value = styles[name];
            style[name] = value;
        }
        return el;
    };
    removeDOMChildren = function (el) {
        var child;
        while (child = el.firstChild) {
            el.removeChild(child);
        }
    };
    createStylesheet = function (styles) {
        var el, headEl;
        el = document.createElement('style');
        el.type = 'text/css';
        el.innerHTML = styles;
        headEl = _.head(document.getElementsByTagName('head'));
        headEl.appendChild(el);
    };
    createTooltipTable = function (dict) {
        var label, ref, rows, table, tbody, td, th, tr, value;
        ref = diecut('table', 'tbody', 'tr', 'th', 'td'), table = ref[0], tbody = ref[1], tr = ref[2], th = ref[3], td = ref[4];
        rows = function () {
            var results;
            results = [];
            for (label in dict) {
                value = dict[label];
                results.push(tr([
                    td(label + ':'),
                    th(value)
                ]));
            }
            return results;
        }();
        return renderHtml(table(tbody(rows)));
    };
    createCanvas = function (bounds) {
        var bspr, context, dpr, element, height, ratio, width;
        width = bounds.width, height = bounds.height;
        element = document.createElement('canvas');
        context = element.getContext('2d');
        dpr = window.devicePixelRatio || 1;
        bspr = context.webkitBackingStorePixelRatio || context.mozBackingStorePixelRatio || context.msBackingStorePixelRatio || context.oBackingStorePixelRatio || context.backingStorePixelRatio || 1;
        ratio = dpr / bspr;
        element.style.position = 'absolute';
        if (dpr !== bspr) {
            element.width = width * ratio;
            element.height = height * ratio;
            context.scale(ratio, ratio);
            element.style.width = px(width);
            element.style.height = px(height);
        } else {
            element.width = width;
            element.height = height;
        }
        return new Canvas(element, context, bounds, ratio);
    };
    createViewport = function (box) {
        var baseCanvas, clip, clipCanvas, container, highlightCanvas, hoverCanvas, i, marquee, mask, maskCanvas, ref, tooltip;
        ref = function () {
            var l, results;
            results = [];
            for (i = l = 1; l <= 5; i = ++l) {
                results.push(createCanvas(box));
            }
            return results;
        }(), baseCanvas = ref[0], highlightCanvas = ref[1], hoverCanvas = ref[2], maskCanvas = ref[3], clipCanvas = ref[4];
        container = createDOMElement('div', {
            position: 'relative',
            overflow: 'visible',
            width: px(box.width),
            height: px(box.height)
        });
        container.className = 'lz';
        marquee = createDOMElement('div', {
            position: 'absolute',
            left: px(0),
            top: px(0),
            width: px(0),
            height: px(0),
            display: 'none',
            outline: '1px dotted #999',
            background: 'rgba(0, 0, 0, 0.05)'
        });
        tooltip = createDOMElement('div', {
            position: 'absolute',
            left: px(0),
            top: px(0),
            'max-width': px(0.9 * box.width),
            display: 'none'
        });
        tooltip.className = 'lz-tooltip';
        container.appendChild(baseCanvas.element);
        container.appendChild(highlightCanvas.element);
        container.appendChild(marquee);
        container.appendChild(hoverCanvas.element);
        container.appendChild(tooltip);
        mask = createMask(maskCanvas);
        clip = createClip(clipCanvas);
        return new Viewport(box, container, baseCanvas, highlightCanvas, hoverCanvas, maskCanvas, clipCanvas, marquee, tooltip, mask, clip);
    };
    getFFMouseCoords = function (e) {
        var rect, ref, target;
        target = (ref = e.target) != null ? ref : e.srcElement;
        rect = target.getBoundingClientRect();
        return [
            e.clientX - rect.left,
            e.clientY - rect.top
        ];
    };
    captureMouseEvents = function (canvasEl, marqueeEl, hover, selectWithin, selectAt) {
        var $canvas, $document, isDragging, marquee, x, x1, x2, y, y1, y2;
        $document = $(document);
        $canvas = $(canvasEl);
        marquee = marqueeEl.style;
        x = y = x1 = y1 = x2 = y2 = 0;
        isDragging = false;
        $canvas.on('mousemove', function (e) {
            var ref;
            x = e.offsetX, y = e.offsetY;
            if (!(x !== void 0 && y !== void 0)) {
                ref = getFFMouseCoords(e), x = ref[0], y = ref[1];
            }
            if (isDragging) {
                marquee.left = px(x > x1 ? x1 : x);
                marquee.top = px(y > y1 ? y1 : y);
                marquee.width = px(Math.abs(x - x1));
                return marquee.height = px(Math.abs(y - y1));
            } else {
                return hover(x, y);
            }
        });
        $canvas.on('mousedown', function (e) {
            var ref;
            e.preventDefault();
            x1 = e.offsetX, y1 = e.offsetY;
            if (!(x1 !== void 0 && y1 !== void 0)) {
                ref = getFFMouseCoords(e), x1 = ref[0], y1 = ref[1];
            }
            isDragging = true;
            marquee.display = 'block';
            marquee.left = px(x1);
            marquee.top = px(y1);
            return $document.on('mouseup', function (e) {
                var ref1;
                e.preventDefault();
                x2 = e.offsetX, y2 = e.offsetY;
                if (!(x2 !== void 0 && y2 !== void 0)) {
                    ref1 = getFFMouseCoords(e), x2 = ref1[0], y2 = ref1[1];
                }
                isDragging = false;
                marquee.display = 'none';
                marquee.width = px(0);
                marquee.height = px(0);
                $document.off('mouseup');
                if (Math.abs(x1 - x2) > 5 || Math.abs(y1 - y2) > 5) {
                    return selectWithin(x1, y1, x2, y2);
                } else {
                    return selectAt(x1, y1);
                }
            });
        });
    };
    createEventDispatcher = function () {
        var _subscribersByEvent, notify, subscribe, unsubscribe;
        _subscribersByEvent = {};
        subscribe = function (event, subscriber) {
            var subscribers;
            if (subscribers = _subscribersByEvent[event]) {
                return subscribers.push(subscriber);
            } else {
                return _subscribersByEvent[event] = [subscriber];
            }
        };
        unsubscribe = function (_event, _subscriber) {
            var i, l, len, subscriber, subscribers;
            if (_event) {
                if (_subscriber) {
                    subscribers = _subscribersByEvent[_event];
                    if (subscribers) {
                        for (i = l = 0, len = subscribers.length; l < len; i = ++l) {
                            subscriber = subscribers[i];
                            if (!(subscriber === _subscriber)) {
                                continue;
                            }
                            subscribers.splice(i, 1);
                            break;
                        }
                    }
                } else {
                    delete _subscribersByEvent[_event];
                }
            }
        };
        notify = function () {
            var args, event, l, len, subscriber, subscribers;
            event = arguments[0], args = 2 <= arguments.length ? slice1.call(arguments, 1) : [];
            if (subscribers = _subscribersByEvent[event]) {
                for (l = 0, len = subscribers.length; l < len; l++) {
                    subscriber = subscribers[l];
                    subscriber.apply(null, args);
                }
            }
        };
        return [
            subscribe,
            unsubscribe,
            notify
        ];
    };
    createVisualization = function (_box, _frame, _layers, _annotations, _axisX, _axisY, _notify) {
        var _index, _indices, _tooltipOffset, _viewport, baseCanvas, clip, clipCanvas, displayTooltip, hideTooltip, highlight, highlightCanvas, hover, hoverCanvas, marquee, mask, maskCanvas, moveTooltip, render, selectAt, selectWithin, test, tooltip, visRect;
        _viewport = createViewport(_box);
        baseCanvas = _viewport.baseCanvas, highlightCanvas = _viewport.highlightCanvas, hoverCanvas = _viewport.hoverCanvas, clipCanvas = _viewport.clipCanvas, maskCanvas = _viewport.maskCanvas, marquee = _viewport.marquee, tooltip = _viewport.tooltip, mask = _viewport.mask, clip = _viewport.clip;
        visRect = _box.regions.center;
        _indices = _frame.indices;
        _index = void 0;
        test = function (x, y) {
            var clipContext, i, l, layer, len;
            i = mask.test(x, y);
            if (i !== void 0) {
                clipContext = clipCanvas.context;
                clipContext.clearRect(0, 0, _box.width, _box.height);
                for (l = 0, len = _layers.length; l < len; l++) {
                    layer = _layers[l];
                    clipContext.save();
                    clipContext.translate(visRect.left, visRect.top);
                    layer.mask([i], layer.encoders, clipContext, clip);
                    clipContext.restore();
                    if (clip.test(x, y)) {
                        return i;
                    }
                }
            }
        };
        displayTooltip = function (x, y, data) {
            var tableEl;
            tableEl = createTooltipTable(data);
            removeDOMChildren(tooltip);
            tooltip.appendChild(tableEl);
            tooltip.style.display = 'block';
            return moveTooltip(x, y);
        };
        _tooltipOffset = 7;
        moveTooltip = function (x, y) {
            var p, q, tooltipHeight, tooltipWidth;
            if (tooltip.style.display === 'none') {
                return;
            }
            tooltipWidth = tooltip.clientWidth;
            tooltipHeight = tooltip.clientHeight;
            p = x + _tooltipOffset;
            q = y - _tooltipOffset - tooltipHeight;
            if (p + tooltipWidth > _box.width) {
                p = x - _tooltipOffset - tooltipWidth;
            }
            if (q < 0) {
                q = y + _tooltipOffset;
            }
            if (p < 0) {
                p = 0;
            }
            if (q < 0) {
                q = 0;
            }
            tooltip.style.left = px(p);
            return tooltip.style.top = px(q);
        };
        hideTooltip = function () {
            return tooltip.style.display = 'none';
        };
        hover = function (x, y) {
            var aes, encoding, hoverContext, i, l, layer, len, len1, len2, m, n, ref, ref1, tooltipData, vector;
            i = test(x, y);
            if (i !== _index) {
                _index = i;
                hoverContext = hoverCanvas.context;
                hoverContext.clearRect(0, 0, _box.width, _box.height);
                hideTooltip();
                if (i !== void 0) {
                    hoverContext.save();
                    hoverContext.translate(visRect.left, visRect.top);
                    for (l = 0, len = _layers.length; l < len; l++) {
                        layer = _layers[l];
                        layer.highlight([i], layer.encoders, hoverContext);
                    }
                    hoverContext.restore();
                    _notify('markhover', new HoverEventArg(_frame, i));
                    tooltipData = {};
                    for (m = 0, len1 = _layers.length; m < len1; m++) {
                        layer = _layers[m];
                        ref = layer.encodings;
                        for (aes in ref) {
                            encoding = ref[aes];
                            if (encoding) {
                                if (encoding instanceof VariableEncoder) {
                                    if (vector = encoding.vector) {
                                        tooltipData[vector.label] = vector.format(i);
                                    }
                                } else if (encoding instanceof TooltipEncoder) {
                                    ref1 = encoding.vectors;
                                    for (n = 0, len2 = ref1.length; n < len2; n++) {
                                        vector = ref1[n];
                                        tooltipData[vector.label] = vector.format(i);
                                    }
                                }
                            }
                        }
                    }
                    displayTooltip(x, y, tooltipData);
                }
            } else {
                moveTooltip(x, y);
            }
        };
        highlight = function (indices) {
            var highlightContext, l, layer, len;
            highlightContext = highlightCanvas.context;
            highlightContext.clearRect(0, 0, _box.width, _box.height);
            if (indices.length) {
                baseCanvas.element.style.opacity = 0.5;
                highlightContext.save();
                highlightContext.translate(visRect.left, visRect.top);
                for (l = 0, len = _layers.length; l < len; l++) {
                    layer = _layers[l];
                    layer.highlight(indices, layer.encoders, highlightContext);
                    layer.render(indices, layer.encoders, highlightContext);
                }
                highlightContext.restore();
                _notify('markselect', new SelectEventArg(_frame, indices));
            } else {
                baseCanvas.element.style.opacity = 1;
                _notify('markdeselect', new DeselectEventArg(_frame));
            }
        };
        selectAt = function (x, y) {
            var i;
            i = test(x, y);
            highlight(i !== void 0 ? [i] : []);
        };
        selectWithin = function (x1, y1, x2, y2) {
            var layer, selectedIndices, selectedIndicesByLayer, xmax, xmin, ymax, ymin;
            xmin = -visRect.left + (x1 > x2 ? x2 : x1);
            xmax = -visRect.left + (x1 > x2 ? x1 : x2);
            ymin = -visRect.top + (y1 > y2 ? y2 : y1);
            ymax = -visRect.top + (y1 > y2 ? y1 : y2);
            selectedIndicesByLayer = function () {
                var l, len, results;
                results = [];
                for (l = 0, len = _layers.length; l < len; l++) {
                    layer = _layers[l];
                    results.push(layer.select(_indices, layer.encoders, xmin, ymin, xmax, ymax));
                }
                return results;
            }();
            selectedIndices = _layers.length > 1 ? _.uniq(_.flatten(selectedIndicesByLayer, true)) : _.head(selectedIndicesByLayer);
            highlight(selectedIndices);
        };
        render = function () {
            var annotation, baseContext, l, layer, len, len1, m, maskContext;
            baseContext = baseCanvas.context;
            maskContext = maskCanvas.context;
            renderGridlinesX(baseContext, _axisX, visRect);
            renderGridlinesY(baseContext, _axisY, visRect);
            baseContext.save();
            baseContext.translate(visRect.left, visRect.top);
            maskContext.save();
            maskContext.translate(visRect.left, visRect.top);
            for (l = 0, len = _layers.length; l < len; l++) {
                layer = _layers[l];
                layer.render(_indices, layer.encoders, baseContext);
                layer.mask(_indices, layer.encoders, maskContext, mask);
            }
            for (m = 0, len1 = _annotations.length; m < len1; m++) {
                annotation = _annotations[m];
                annotation.render(annotation, _axisX, _axisY, baseContext);
            }
            maskContext.restore();
            baseContext.restore();
            renderAxisX(baseContext, _axisX, _box.regions.bottom);
            renderAxisY(baseContext, _axisY, _box.regions.left);
        };
        captureMouseEvents(hoverCanvas.element, marquee, hover, selectWithin, selectAt);
        return new Visualization(_viewport, _frame, test, highlight, hover, selectAt, selectWithin, render);
    };
    renderAxis = function (g, axis, width, height, orientation) {
        var categories, category, divisor, i, l, label, labelAnchor, labelPosition, len, len1, m, maxLabelSize, maxPosition, maxTickLabels, minPosition, position, ref, tick, tickPosition, tickStart, titleHeight;
        g.font = plot_settings.axisLabelFont;
        g.fillStyle = plot_settings.axisLabelColor;
        g.strokeStyle = plot_settings.axisTickColor;
        g.textBaseline = 'middle';
        titleHeight = __emWidth + 4;
        maxLabelSize = width - titleHeight;
        g.save();
        clipRect(g, titleHeight, 0, maxLabelSize, height);
        g.textAlign = 'right';
        tickStart = width - 5;
        labelAnchor = width - 6;
        if (axis instanceof CategoricalAxis) {
            categories = axis.guide();
            maxTickLabels = Math.floor(height / (__emWidth + 2));
            divisor = Math.floor(categories.length / maxTickLabels);
            for (i = l = 0, len = categories.length; l < len; i = ++l) {
                category = categories[i];
                position = axis.scale(category);
                tickPosition = -0.5 + Math.round(position);
                doLine(g, tickStart, tickPosition, width, tickPosition);
                if (divisor === 0 || i !== 0 && 0 === i % divisor) {
                    g.fillText(category.value, labelAnchor, position, maxLabelSize - 6);
                }
            }
            doLine(g, width - 0.5, 0, width - 0.5, height);
        } else if (axis instanceof QuantitativeAxis) {
            minPosition = 6;
            maxPosition = height - 6;
            ref = axis.guide();
            for (m = 0, len1 = ref.length; m < len1; m++) {
                tick = ref[m];
                label = tick.label;
                position = axis.scale(tick.value);
                tickPosition = Math.max(0.5, -0.5 + Math.round(position));
                doLine(g, tickStart, tickPosition, width, tickPosition);
                labelPosition = position < minPosition ? minPosition : position > maxPosition ? maxPosition : position;
                g.fillText(label, labelAnchor, labelPosition, maxLabelSize - 6);
            }
            doLine(g, width - 0.5, 0, width - 0.5, height);
        } else {
            throw new Error('Invalid axis type.');
        }
        g.restore();
        g.font = plot_settings.axisTitleFont;
        g.textAlign = 'center';
        g.translate(titleHeight / 2, height / 2);
        g.rotate(orientation * Halfπ);
        g.fillText(axis.label, 0, 0, height);
        return g.restore();
    };
    renderGridlines = function (g, axis, width, height) {
        var l, len, ref, tick, tickPosition;
        g.strokeStyle = plot_settings.gridLineColor;
        if (axis instanceof CategoricalAxis) {
            doLine(g, 0, 0.5, width, 0.5);
            doLine(g, 0, height - 0.5, width, height - 0.5);
        } else if (axis instanceof QuantitativeAxis) {
            ref = axis.guide();
            for (l = 0, len = ref.length; l < len; l++) {
                tick = ref[l];
                tickPosition = Math.max(0.5, -0.5 + Math.round(axis.scale(tick.value)));
                doLine(g, 0, tickPosition, width, tickPosition);
            }
            if (axis.domain.min <= 0 && 0 <= axis.domain.max) {
                g.strokeStyle = plot_settings.originLineColor;
                tickPosition = Math.max(0.5, -0.5 + Math.round(axis.scale(0)));
                doLine(g, 0, tickPosition, width, tickPosition);
            }
        }
    };
    renderGridlinesX = function (g, axis, rect) {
        g.save();
        g.translate(rect.left, rect.top + rect.height);
        g.rotate(-Halfπ);
        renderGridlines(g, axis, rect.height, rect.width);
        return g.restore();
    };
    renderGridlinesY = function (g, axis, rect) {
        g.save();
        g.translate(rect.left, rect.top);
        renderGridlines(g, axis, rect.width, rect.height);
        return g.restore();
    };
    renderAxisX = function (g, axis, rect) {
        g.save();
        g.translate(rect.left, rect.top + rect.height);
        g.rotate(-Halfπ);
        renderAxis(g, axis, rect.height, rect.width, 1);
        return g.restore();
    };
    renderAxisY = function (g, axis, rect) {
        g.save();
        g.translate(rect.left, rect.top);
        renderAxis(g, axis, rect.width, rect.height, -1);
        return g.restore();
    };
    renderHtml = function (htmlString) {
        var el;
        el = document.createElement('div');
        el.innerHTML = htmlString;
        return el.childNodes[0];
    };
    filterFactorDomain = function (factor, indices) {
        var category, dict, domain, index, key, l, len;
        dict = {};
        domain = [];
        for (l = 0, len = indices.length; l < len; l++) {
            index = indices[l];
            key = (category = factor.at(index)).key;
            if (!dict[key]) {
                dict[key] = true;
                domain.push(category);
            }
        }
        return domain;
    };
    createSpace1D = function (vectors, indices) {
        var _vector, domain, l, len, type, vector;
        type = null;
        domain = null;
        _vector = null;
        for (l = 0, len = vectors.length; l < len; l++) {
            vector = vectors[l];
            if (type === null) {
                type = vector.type;
                switch (type) {
                case TString:
                    _vector = vector;
                    domain = filterFactorDomain(vector, indices);
                    break;
                case TNumber:
                    domain = vector.domain;
                    break;
                default:
                    throw new Error('ni');
                }
            } else {
                if (type !== vector.type) {
                    throw new Error('Incompatible axis vector [' + vector.label + ']. Expect type [' + type + '], got [' + vector.type + ']');
                }
                switch (type) {
                case TString:
                    if (_vector !== vector) {
                        throw new Error('Incompatible categorical vector [' + vector.label + ']. Expected [' + _vector.label + '].');
                    }
                    break;
                case TNumber:
                    domain = combineExtents(domain, vector.domain);
                    break;
                default:
                    throw new Error('ni');
                }
            }
        }
        return new Space1D(type, vectors, domain);
    };
    createAxisLabel = function (vectors) {
        var labels, vector;
        labels = function () {
            var l, len, results;
            results = [];
            for (l = 0, len = vectors.length; l < len; l++) {
                vector = vectors[l];
                results.push(vector.label);
            }
            return results;
        }();
        return _.uniq(labels).join(', ');
    };
    computeApproxAxisSize = function (type, domain) {
        var axis, categories, category, l, len, len1, length, longest, m, padding, rect, ref, tick;
        rect = new Rect(0, 0, 400, 400);
        axis = createAxis(type, '', domain, new SequentialRange(0, rect.width), rect);
        padding = __emWidth + 4 + 6 + 10;
        if (axis instanceof CategoricalAxis) {
            longest = 0;
            categories = axis.guide();
            for (l = 0, len = categories.length; l < len; l++) {
                category = categories[l];
                if (longest < (length = ('' + category.value).length)) {
                    longest = length;
                }
            }
            return new Bounds(Math.ceil(longest * __emWidth + padding), Math.ceil(categories.length * (__emWidth + 8)));
        } else if (axis instanceof QuantitativeAxis) {
            longest = 0;
            categories = axis.guide();
            ref = axis.guide();
            for (m = 0, len1 = ref.length; m < len1; m++) {
                tick = ref[m];
                if (longest < (length = tick.label.length)) {
                    longest = length;
                }
            }
            return new Bounds(Math.ceil(longest * __emWidth + padding), plot_settings.visualizationSize.height);
        } else {
            throw new Error('Invalid axis type.');
        }
    };
    createAxis = function (type, label, domain, range, rect) {
        var guide, ref, scale, tickFormat, ticks;
        switch (type) {
        case TString:
            scale = createOrdinalScale(domain, range);
            guide = function () {
                return domain;
            };
            return new CategoricalAxis(type, label, scale, domain, range, rect, guide);
        case TNumber:
            ref = createNicedSequentialLinearScale(domain, range), scale = ref[0], tickFormat = ref[1], ticks = ref[2];
            guide = function (count) {
                var format, l, len, ref1, results, value;
                if (count == null) {
                    count = 10;
                }
                format = tickFormat(count);
                ref1 = ticks(count);
                results = [];
                for (l = 0, len = ref1.length; l < len; l++) {
                    value = ref1[l];
                    results.push(new Tick(value, format(value)));
                }
                return results;
            };
            return new LinearAxis(type, label, scale, domain, range, rect, guide);
        default:
            throw new Error('Unhandled axis type [' + type + '].');
        }
    };
    renderVisualization = function (_frame, ops) {
        var frame, query;
        query = createQuery(ops);
        frame = queryFrame(_frame, query);
        if (findByType(ops, SelectExpr)) {
            return renderTable(frame, ops);
        } else if (findByType(ops, RecordExpr)) {
            return renderRecord(frame, ops);
        } else {
            return renderPlot(frame, ops);
        }
    };
    renderRecord = function (frame, ops) {
        var element, escapedValue, highlight, index, name, recordExpr, ref, subscribe, table, tbody, td, th, tr, trs, unsubscribe, value, vector;
        recordExpr = findByType(ops, RecordExpr);
        index = recordExpr.index;
        ref = diecut('table.lz-record', 'tbody', 'tr', 'th', 'td'), table = ref[0], tbody = ref[1], tr = ref[2], th = ref[3], td = ref[4];
        trs = function () {
            var ref1, results;
            ref1 = frame.schema;
            results = [];
            for (name in ref1) {
                vector = ref1[name];
                value = vector.format(index);
                escapedValue = function () {
                    switch (vector.type) {
                    case TString:
                        if (value !== void 0) {
                            return value;
                        } else {
                            return MidDot;
                        }
                        break;
                    case TNumber:
                        if (value !== void 0) {
                            return _.escape(value);
                        } else {
                            return MidDot;
                        }
                        break;
                    case TObject:
                        if (value !== void 0) {
                            return value;
                        } else {
                            return MidDot;
                        }
                        break;
                    default:
                        throw new Error('Cannot render table cell of type ' + vector.type);
                    }
                }();
                results.push(tr([
                    th(_.escape(vector.label)),
                    td(escapedValue)
                ]));
            }
            return results;
        }();
        element = renderHtml(table(tbody(trs)));
        subscribe = _.noop;
        unsubscribe = _.noop;
        highlight = _.noop;
        return new Plot(element, subscribe, unsubscribe, highlight);
    };
    renderTable = function (frame, ops) {
        var element, field, highlight, i, notify, ref, ref1, selectExpr, subscribe, table, tbody, td, tdr, tds, th, thead, thr, ths, tr, trs, unsubscribe, value, vector, vectorGroups, vectors;
        selectExpr = findByType(ops, SelectExpr);
        vectorGroups = function () {
            var l, len, ref, results;
            if (selectExpr.fields.length) {
                ref = selectExpr.fields;
                results = [];
                for (l = 0, len = ref.length; l < len; l++) {
                    field = ref[l];
                    results.push(frame.evaluate(field));
                }
                return results;
            } else {
                return frame.vectors;
            }
        }();
        vectors = _.flatten(vectorGroups);
        ref = diecut('table.lz-table', 'thead', 'tbody', 'tr', 'th', 'th.lz-number', 'td', 'td.lz-number'), table = ref[0], thead = ref[1], tbody = ref[2], tr = ref[3], th = ref[4], thr = ref[5], td = ref[6], tdr = ref[7];
        ths = function () {
            var l, len, results;
            results = [];
            for (l = 0, len = vectors.length; l < len; l++) {
                vector = vectors[l];
                switch (vector.type) {
                case TNumber:
                    results.push(thr(_.escape(vector.label)));
                    break;
                default:
                    results.push(th(_.escape(vector.label)));
                }
            }
            return results;
        }();
        trs = function () {
            var l, len, ref1, results;
            ref1 = frame.indices;
            results = [];
            for (l = 0, len = ref1.length; l < len; l++) {
                i = ref1[l];
                tds = function () {
                    var len1, m, results1;
                    results1 = [];
                    for (m = 0, len1 = vectors.length; m < len1; m++) {
                        vector = vectors[m];
                        value = vector.format(i);
                        switch (vector.type) {
                        case TString:
                            results1.push(td(value !== void 0 ? value : MidDot));
                            break;
                        case TNumber:
                            results1.push(tdr(value !== void 0 ? _.escape(value) : MidDot));
                            break;
                        case TObject:
                            results1.push(td(value !== void 0 ? value : MidDot));
                            break;
                        default:
                            throw new Error('Cannot render table cell of type ' + vector.type);
                        }
                    }
                    return results1;
                }();
                results.push(tr(tds));
            }
            return results;
        }();
        element = renderHtml(table([
            thead(tr(ths)),
            tbody(trs)
        ]));
        ref1 = createEventDispatcher(), subscribe = ref1[0], unsubscribe = ref1[1], notify = ref1[2];
        $(element).on('click', function (event) {
            var $parent, $target, parentIndex, parentType, targetIndex, targetType;
            $target = $(event.target);
            $parent = $target.parent();
            parentType = $parent.prop('tagName').toLowerCase();
            targetType = $target.prop('tagName').toLowerCase();
            targetIndex = $target.index();
            parentIndex = $parent.index();
            switch (targetType) {
            case 'td':
                notify('cellselect', new CellSelectEventArg(vectors[targetIndex], frame.indices[parentIndex]));
                break;
            case 'th':
                notify('headerselect', new HeaderSelectEventArg(vectors[targetIndex]));
            }
        });
        highlight = _.noop;
        return new Plot(element, subscribe, unsubscribe, highlight);
    };
    computeAxisDomain = function (self, other, domain) {
        if (self.type === TNumber) {
            if (domain) {
                return combineExtents(self.domain, domain);
            } else {
                if (other.type === TString) {
                    return includeOrigin0(self.domain);
                } else {
                    return self.domain;
                }
            }
        } else {
            return self.domain;
        }
    };
    renderPlot = function (frame, ops) {
        var annotations, axisBoundsX, axisBoundsY, axisRectX, axisRectY, axisX, axisY, bounds, boundsHeight, boundsWidth, box, domainX, domainY, layers, marks, notify, rangeX, rangeY, ref, ref1, ref2, ref3, spaceX, spaceY, spaces, subscribe, unsubscribe, vectorsX, vectorsY, visualization;
        marks = _.map(filterByType(ops, MarkExpr), function (expr) {
            var coord, positionVectors;
            positionVectors = function () {
                var l, len, ref, results;
                ref = expr.position.coordinates;
                results = [];
                for (l = 0, len = ref.length; l < len; l++) {
                    coord = ref[l];
                    results.push(frame.evaluate(coord.field));
                }
                return results;
            }();
            return createMark(expr, _.flatten(positionVectors));
        });
        spaces = _.map(marks, function (mark) {
            return mark.space;
        });
        vectorsX = flatMap(spaces, function (space) {
            return space.x;
        });
        vectorsY = flatMap(spaces, function (space) {
            return space.y;
        });
        spaceX = createSpace1D(vectorsX, frame.indices);
        spaceY = createSpace1D(vectorsY, frame.indices);
        domainX = computeAxisDomain(spaceX, spaceY, findByType(ops, DomainX));
        domainY = computeAxisDomain(spaceY, spaceX, findByType(ops, DomainY));
        axisBoundsX = computeApproxAxisSize(spaceX.type, domainX);
        axisBoundsY = computeApproxAxisSize(spaceY.type, domainY);
        bounds = (ref = findByType(ops, Bounds)) != null ? ref : new Bounds(void 0, void 0);
        boundsWidth = (ref1 = bounds.width) != null ? ref1 : Math.min(plot_settings.maxCanvasSize.width, axisBoundsY.width + axisBoundsX.height);
        boundsHeight = (ref2 = bounds.height) != null ? ref2 : Math.min(plot_settings.maxCanvasSize.height, axisBoundsX.width + axisBoundsY.height);
        box = new Box(boundsWidth, boundsHeight, new Margin(Math.min(0.3 * plot_settings.maxCanvasSize.width, axisBoundsY.width), 0, 0, Math.min(0.3 * plot_settings.maxCanvasSize.height, axisBoundsX.width)));
        axisRectX = box.regions.bottom;
        axisRectY = box.regions.left;
        rangeX = new SequentialRange(0, axisRectX.width);
        rangeY = spaceY.type === TNumber ? new SequentialRange(axisRectY.height, 0) : new SequentialRange(0, axisRectY.height);
        axisX = createAxis(spaceX.type, createAxisLabel(vectorsX), domainX, rangeX, axisRectX);
        axisY = createAxis(spaceY.type, createAxisLabel(vectorsY), domainY, rangeY, axisRectY);
        layers = _.map(marks, function (mark) {
            var encoders, encodings, geom, k, v;
            geom = mark.geometry;
            encodings = geom.encode(frame, mark, axisX, axisY);
            encoders = {};
            for (k in encodings) {
                v = encodings[k];
                if (v != null ? v.encode : void 0) {
                    encoders[k] = v.encode;
                }
            }
            return new Layer(encodings, encoders, geom.mask, geom.highlight, geom.render, geom.select);
        });
        annotations = _.map(filterByType(ops, AnnotationExpr), function (expr) {
            return createAnnotation(expr);
        });
        ref3 = createEventDispatcher(), subscribe = ref3[0], unsubscribe = ref3[1], notify = ref3[2];
        visualization = createVisualization(box, frame, layers, annotations, axisX, axisY, notify);
        visualization.render();
        return new Plot(visualization.viewport.container, subscribe, unsubscribe, visualization.highlight);
    };
    visualize = dispatch([
        Datasource,
        Array,
        Function,
        function (ds, ops, go) {
            return ds.read(function (error, frame) {
                if (error) {
                    return go(error);
                } else {
                    return visualize(frame, ops, go);
                }
            });
        }
    ], [
        Frame,
        Array,
        Function,
        function (frame, ops, go) {
            var error;
            try {
                return go(null, renderVisualization(frame, ops));
            } catch (error1) {
                error = error1;
                return go(error);
            }
        }
    ]);
    initializeStylesheet = function () {
        return createStylesheet('.lz-tooltip {\n  background: #2c2c2c;\n  color: #fff;\n  font-size: 12px;\n}\n.lz-tooltip th, .lz-tooltip td {\n  padding: 0px 4px;\n  vertical-align: middle;\n}\n.lz-tooltip th {\n  text-align: left;\n}\n.lz-table th, .lz-table td {\n  padding: 0px 8px;\n  vertical-align: middle;\n}\n.lz-table tbody > tr:nth-child(odd) {\n  background-color: #f3f3f3;\n}\n.lz-table .lz-number {\n  text-align: right;\n}\n.lz-record th, .lz-record td {\n  padding: 0px 8px;\n  vertical-align: middle;\n}\n.lz-record th {\n  text-align: right;\n}\n.lz-record tbody > tr:nth-child(odd) {\n  background-color: #f3f3f3;\n}');
    };
    __scratchCanvas = null;
    __emWidth = 18;
    initializeScratchCanvas = function () {
        var canvas, g;
        __scratchCanvas = canvas = createCanvas(new Bounds(100, 100));
        g = canvas.context;
        g.font = plot_settings.axisLabelFont;
        return __emWidth = g.measureText('M').width;
    };
    __isLibInitialized = false;
    initializeLib = function () {
        if (!__isLibInitialized) {
            initializeStylesheet();
            initializeScratchCanvas();
            return __isLibInitialized = true;
        }
    };
    plot = function () {
        var datasource, ops;
        ops = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
        if (datasource = findByType(ops, Datasource, Frame)) {
            initializeLib();
            return function (arg) {
                var go;
                go = _.isElement(arg) ? function (error, vis) {
                    if (error) {
                        return arg.innerHTML = error.message;
                    } else {
                        return arg.appendChild(vis.element);
                    }
                } : _.isFunction(arg) ? arg : void 0;
                if (go) {
                    return visualize(datasource, _.without(ops, datasource), go);
                }
            };
        } else {
            return function () {
                var more;
                more = 1 <= arguments.length ? slice1.call(arguments, 0) : [];
                return plot.apply(null, ops.concat(more));
            };
        }
    };
    plot.VERSION = '999.999.999';
    plot.settings = plot_settings;
    plot.bounds = plot_bounds;
    plot.from = plot_from;
    plot.value = plot_value;
    plot.range = plot_range;
    plot.position = plot_position;
    plot.fillColor = plot_fillColor;
    plot.fillOpacity = plot_fillOpacity;
    plot.strokeColor = plot_strokeColor;
    plot.strokeOpacity = plot_strokeOpacity;
    plot.size = plot_size;
    plot.width = plot_width;
    plot.height = plot_height;
    plot.lineWidth = plot_lineWidth;
    plot.shape = plot_shape;
    plot.tooltip = plot_tooltip;
    plot.factor = plot_factor;
    plot.stack = plot_stack;
    plot.groupBy = plot_groupBy;
    plot.where = plot_where;
    plot.limit = plot_limit;
    plot.having = plot_having;
    plot.eq = plot_eq;
    plot.ne = plot_ne;
    plot.lt = plot_lt;
    plot.gt = plot_gt;
    plot.le = plot_le;
    plot.ge = plot_ge;
    plot.like = plot_like;
    plot.avg = plot_avg;
    plot.count = plot_count;
    plot.max = plot_max;
    plot.min = plot_min;
    plot.sum = plot_sum;
    plot.parse = plot_parse;
    plot.point = plot_point;
    plot.rect = plot_rect;
    plot.path = plot_path;
    plot.schema = plot_schema;
    plot.line = plot_line;
    plot.select = plot_select;
    plot.dataPackage = plot_dataPackage;
    plot.computed = plot_computed;
    plot.createFrame = createFrame;
    plot.createVector = createVector;
    plot.createList = createList;
    plot.createFactor = createFactor;
    plot.domainX_HACK = plot_domainX_HACK;
    plot.domainY_HACK = plot_domainY_HACK;
    if ((typeof module !== 'undefined' && module !== null ? module.exports : void 0) != null) {
        module.exports = plot;
    } else {
        window.plot = plot;
    }
}.call(this));