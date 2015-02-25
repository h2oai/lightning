(function () {
    var All, Axis, BarEncoding, BarGeometry, BarMark, BooleanValue, Bounds, Box, Canvas, CategoricalAxis, CategoricalRange, Category, Cell, Channel, Clip, ColEncoding, ColGeometry, ColMark, ColorChannel, ColorEncoder, ColorLimit, ColorPalettes, ColorRange, ConstantEncoder, ConstantFillColorChannel, ConstantFillOpacityChannel, ConstantHeightChannel, ConstantLineWidthChannel, ConstantShapeChannel, ConstantSizeChannel, ConstantStrokeColorChannel, ConstantStrokeOpacityChannel, ConstantWidthChannel, CoordChannel, Cube, Datasource, DateValue, Degrees, DeselectEventArg, DivergingColorRange, DivergingRange, Encoder, Encoding, EpsilonSquare, Extent, Factor, Factoring, Field, Fill, FillColorChannel, FillOpacityChannel, Frame, Geometry, Group, GroupOp, Halfπ, HavingOp, HeightChannel, HoverEventArg, Layer, Level, LimitOp, LineWidthChannel, LinearAxis, List, MappedField, Margin, Mark, MarkExpr, Mask, Matcher, NumberValue, OpacityEncoder, PathEncoding, PathExpr, PathGeometry, PathMark, Plot, PointEncoding, PointExpr, PointGeometry, PointMark, PositionChannel, PositionEncoder, QuantitativeRange, Query, Radians, Range, RecordExpr, Rect, RectExpr, ReducedField, Regions, SchemaExpr, SchemaXEncoding, SchemaXGeometry, SchemaXMark, SchemaYEncoding, SchemaYGeometry, SchemaYMark, SelectEventArg, SelectOp, SequentialColorRange, SequentialRange, ShapeChannel, ShapeEncoder, ShapePalettes, Shapes, Size, SizeChannel, SizeEncoder, Space1D, Space2D, Sqrt3, StringValue, Stroke, StrokeColorChannel, StrokeOpacityChannel, TArguments, TArray, TBoolean, TDate, TError, TFunction, TNull, TNumber, TObject, TRegExp, TString, TUndefined, TableExpr, Tan30, TextMark, Tick, TooltipChannel, TooltipEncoder, Transparent, Value, VariableEncoder, VariableFillColorChannel, VariableFillOpacityChannel, VariableHeightChannel, VariableLineWidthChannel, VariableShapeChannel, VariableSizeChannel, VariableStrokeColorChannel, VariableStrokeOpacityChannel, VariableTooltipChannel, VariableWidthChannel, Vector, Viewport, Visualization, WhereOp, WidthChannel, aggregateFrame, aggregate_avg, aggregate_count, aggregate_max, aggregate_min, aggregate_sum, always, arrayElementsAreEqual, asInt, asReal, asString, buildHierarchy, byteToHex, captureMouseEvents, clampNorm, clamp_, clipRect, cloneColor, collapseHierarchy, collectFields, colorToStyle, colorToStyleA, combineExtents, compileHtmlTemplate, computeApproxAxisSize, computeAxisDomain, computeExtent, computeSchema, computeSkew0, computeSkew_, configureSchema, copy, createAggregateField, createAllFactor, createAllField, createAxis, createAxisLabel, createCanvas, createCategoricalScale, createClip, createColorScale, createDOMElement, createDivergingColorScale, createDivergingLinearScale, createEventDispatcher, createExtent, createFactor, createFactorField, createFields, createFrame, createHtmlTemplates, createLinearScale, createList, createMark, createMask, createNicedSequentialLinearScale, createOrdinalScale, createPathMark, createPointMark, createQuery, createRectMark, createSchemaMark, createSequentialColorScale, createSequentialLinearScale, createSpace1D, createStackedField, createStylesheet, createTooltipTable, createVector, createViewport, createVisualization, defaultSize, dispatch, dispatch_numeric, doFill, doLine, doRectX, doRectY, doSchemaX, doSchemaY, doStroke, download, drawCircle, drawCross, drawDiamond, drawSquare, drawTriangleDown, drawTriangleLeft, drawTriangleRight, drawTriangleUp, dumpFrame, encodeArea, encodeBarMark, encodeColMark, encodeColor, encodeConstantPosition, encodeFill, encodeHeight, encodeLineWidth, encodeOpacity, encodePathMark, encodePointMark, encodePosition, encodeSchemaXMark, encodeSchemaYMark, encodeShape, encodeSize, encodeStroke, encodeStyle, encodeTooltip, encodeWidth, encode_size, extractFactor, factorize, filterByType, filterFactorDomain, filterFrame, findByType, flatMap, getFFMouseCoords, highlightBarMarks, highlightColMarks, highlightPathMarks, highlightPointMarks, highlightSchemaXMarks, highlightSchemaYMarks, includeOrigin0, includeOrigin_, initFill, initFillAndStroke, initStroke, initializeLib, initializeScratchCanvas, initializeStylesheet, maskBarMarks, maskColMarks, maskPathMarks, maskPointMarks, maskSchemaXMarks, maskSchemaYMarks, operation, pickCategoricalColorPalette, pickCategoricalShapePalette, plot, plot__having, plot__select, plot__where, plot_aggregate, plot_avg, plot_count, plot_defaults, plot_domain, plot_eq, plot_factor, plot_fillColor, plot_fillOpacity, plot_from, plot_ge, plot_groupBy, plot_gt, plot_having, plot_height, plot_in, plot_le, plot_like, plot_limit, plot_lineWidth, plot_lt, plot_max, plot_min, plot_ne, plot_notIn, plot_parse, plot_path, plot_point, plot_position, plot_range, plot_record, plot_rect, plot_remote, plot_schema, plot_select, plot_shape, plot_size, plot_stack, plot_strokeColor, plot_strokeOpacity, plot_sum, plot_table, plot_tooltip, plot_value, plot_where, plot_width, px, quantile_, queryFrame, readCsvAsFrame, removeDOMChildren, renderAxis, renderAxisX, renderAxisY, renderBarMarks, renderColMarks, renderGridlines, renderGridlinesX, renderGridlinesY, renderHtml, renderPathMarks, renderPlot, renderPointMarks, renderRecord, renderSchemaXMarks, renderSchemaYMarks, renderTable, renderVisualization, scaleSafe_, selectBarMarks, selectColMarks, selectMarks, selectSchemaXMarks, selectSchemaYMarks, sq, structureOf, typeOf, visualize, ε, π, τ, __emWidth, __isLibInitialized, __scratchCanvas, _createVector, _htmlTemplateCache, __slice = [].slice, __extends = function (child, parent) {
            for (var key in parent) {
                if (__hasProp.call(parent, key))
                    child[key] = parent[key];
            }
            function ctor() {
                this.constructor = child;
            }
            ctor.prototype = parent.prototype;
            child.prototype = new ctor();
            child.__super__ = parent.prototype;
            return child;
        }, __hasProp = {}.hasOwnProperty;
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
        function Matcher(_at_match, _at_func) {
            this.match = _at_match;
            this.func = _at_func;
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
                        var x, _i, _len;
                        if (TArray !== typeOf(xs)) {
                            return false;
                        }
                        for (_i = 0, _len = xs.length; _i < _len; _i++) {
                            x = xs[_i];
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
                var check, i, _i, _len;
                if (args.length === 0) {
                    return false;
                }
                if (args.length !== matchers.length) {
                    return false;
                }
                for (i = _i = 0, _len = matchers.length; _i < _len; i = ++_i) {
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
            exprs = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
            matchers = _.map(exprs, function (_arg) {
                var func, patterns, _i;
                patterns = 2 <= _arg.length ? __slice.call(_arg, 0, _i = _arg.length - 1) : (_i = 0, []), func = _arg[_i++];
                return new Matcher(matchPatterns_(patterns), func);
            });
            return function () {
                var args, matcher, _i, _len;
                args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
                for (_i = 0, _len = matchers.length; _i < _len; _i++) {
                    matcher = matchers[_i];
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
    Clip = function () {
        function Clip(_at_put, _at_test) {
            this.put = _at_put;
            this.test = _at_test;
        }
        return Clip;
    }();
    Mask = function () {
        function Mask(_at_put, _at_test) {
            this.put = _at_put;
            this.test = _at_test;
        }
        return Mask;
    }();
    Size = function () {
        function Size(_at_width, _at_height) {
            this.width = _at_width;
            this.height = _at_height;
        }
        return Size;
    }();
    Rect = function () {
        function Rect(_at_left, _at_top, _at_width, _at_height) {
            this.left = _at_left;
            this.top = _at_top;
            this.width = _at_width;
            this.height = _at_height;
        }
        return Rect;
    }();
    Vector = function () {
        function Vector(_at_name, _at_label, _at_type, _at_at, _at_count, _at_domain, _at_format) {
            this.name = _at_name;
            this.label = _at_label;
            this.type = _at_type;
            this.at = _at_at;
            this.count = _at_count;
            this.domain = _at_domain;
            this.format = _at_format;
        }
        return Vector;
    }();
    Factor = function (_super) {
        __extends(Factor, _super);
        function Factor(name, label, type, at, _at_valueAt, count, domain, format) {
            this.valueAt = _at_valueAt;
            Factor.__super__.constructor.call(this, name, label, type, at, count, domain, format);
        }
        return Factor;
    }(Vector);
    List = function (_super) {
        __extends(List, _super);
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
        function Frame(_at_label, _at_vectors, _at_schema, _at_indices, _at_cube, _at_at, _at_evaluate, _at_attach, _at_metadata) {
            this.label = _at_label;
            this.vectors = _at_vectors;
            this.schema = _at_schema;
            this.indices = _at_indices;
            this.cube = _at_cube;
            this.at = _at_at;
            this.evaluate = _at_evaluate;
            this.attach = _at_attach;
            this.metadata = _at_metadata;
        }
        return Frame;
    }();
    Value = function () {
        function Value(_at_value) {
            this.value = _at_value;
        }
        return Value;
    }();
    NumberValue = function (_super) {
        __extends(NumberValue, _super);
        function NumberValue(value) {
            NumberValue.__super__.constructor.call(this, value);
        }
        return NumberValue;
    }(Value);
    StringValue = function (_super) {
        __extends(StringValue, _super);
        function StringValue(value) {
            StringValue.__super__.constructor.call(this, value);
        }
        return StringValue;
    }(Value);
    DateValue = function (_super) {
        __extends(DateValue, _super);
        function DateValue(value) {
            DateValue.__super__.constructor.call(this, value);
        }
        return DateValue;
    }(Value);
    BooleanValue = function (_super) {
        __extends(BooleanValue, _super);
        function BooleanValue(value) {
            BooleanValue.__super__.constructor.call(this, value);
        }
        return BooleanValue;
    }(Value);
    Field = function () {
        function Field(_at_name) {
            this.name = _at_name;
        }
        return Field;
    }();
    MappedField = function (_super) {
        __extends(MappedField, _super);
        function MappedField(_at_evaluate) {
            this.evaluate = _at_evaluate;
        }
        return MappedField;
    }(Field);
    ReducedField = function (_super) {
        __extends(ReducedField, _super);
        function ReducedField(_at_evaluate) {
            this.evaluate = _at_evaluate;
        }
        return ReducedField;
    }(Field);
    Fill = function () {
        function Fill(_at_color, _at_opacity) {
            this.color = _at_color;
            this.opacity = _at_opacity;
        }
        return Fill;
    }();
    Stroke = function () {
        function Stroke(_at_color, _at_opacity, _at_size) {
            this.color = _at_color;
            this.opacity = _at_opacity;
            this.size = _at_size;
        }
        return Stroke;
    }();
    TableExpr = function () {
        function TableExpr(_at_fields) {
            this.fields = _at_fields;
        }
        return TableExpr;
    }();
    RecordExpr = function () {
        function RecordExpr(_at_index) {
            this.index = _at_index;
        }
        return RecordExpr;
    }();
    MarkExpr = function () {
        function MarkExpr() {
        }
        return MarkExpr;
    }();
    PointExpr = function (_super) {
        __extends(PointExpr, _super);
        function PointExpr(_at_position, _at_shape, _at_size, _at_fillColor, _at_fillOpacity, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.position = _at_position;
            this.shape = _at_shape;
            this.size = _at_size;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return PointExpr;
    }(MarkExpr);
    PathExpr = function (_super) {
        __extends(PathExpr, _super);
        function PathExpr(_at_position, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.position = _at_position;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return PathExpr;
    }(MarkExpr);
    SchemaExpr = function (_super) {
        __extends(SchemaExpr, _super);
        function SchemaExpr(_at_position, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.position = _at_position;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return SchemaExpr;
    }(MarkExpr);
    RectExpr = function (_super) {
        __extends(RectExpr, _super);
        function RectExpr(_at_position, _at_width, _at_height, _at_fillColor, _at_fillOpacity, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.position = _at_position;
            this.width = _at_width;
            this.height = _at_height;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return RectExpr;
    }(MarkExpr);
    Mark = function () {
        function Mark() {
        }
        return Mark;
    }();
    PointMark = function (_super) {
        __extends(PointMark, _super);
        function PointMark(_at_space, _at_positionX, _at_positionY, _at_shape, _at_size, _at_fillColor, _at_fillOpacity, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.space = _at_space;
            this.positionX = _at_positionX;
            this.positionY = _at_positionY;
            this.shape = _at_shape;
            this.size = _at_size;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
            this.geometry = PointGeometry;
        }
        return PointMark;
    }(Mark);
    SchemaXMark = function (_super) {
        __extends(SchemaXMark, _super);
        function SchemaXMark(_at_space, _at_q0, _at_q1, _at_q2, _at_q3, _at_qn, _at_positionY, _at_height, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.space = _at_space;
            this.q0 = _at_q0;
            this.q1 = _at_q1;
            this.q2 = _at_q2;
            this.q3 = _at_q3;
            this.qn = _at_qn;
            this.positionY = _at_positionY;
            this.height = _at_height;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
            this.geometry = SchemaXGeometry;
        }
        return SchemaXMark;
    }(Mark);
    SchemaYMark = function (_super) {
        __extends(SchemaYMark, _super);
        function SchemaYMark(_at_space, _at_positionX, _at_q0, _at_q1, _at_q2, _at_q3, _at_qn, _at_width, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.space = _at_space;
            this.positionX = _at_positionX;
            this.q0 = _at_q0;
            this.q1 = _at_q1;
            this.q2 = _at_q2;
            this.q3 = _at_q3;
            this.qn = _at_qn;
            this.width = _at_width;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
            this.geometry = SchemaYGeometry;
        }
        return SchemaYMark;
    }(Mark);
    ColMark = function (_super) {
        __extends(ColMark, _super);
        function ColMark(_at_space, _at_positionX, _at_positionY1, _at_positionY2, _at_width, _at_fillColor, _at_fillOpacity, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.space = _at_space;
            this.positionX = _at_positionX;
            this.positionY1 = _at_positionY1;
            this.positionY2 = _at_positionY2;
            this.width = _at_width;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
            this.geometry = ColGeometry;
        }
        return ColMark;
    }(Mark);
    BarMark = function (_super) {
        __extends(BarMark, _super);
        function BarMark(_at_space, _at_positionX1, _at_positionX2, _at_positionY, _at_height, _at_fillColor, _at_fillOpacity, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.space = _at_space;
            this.positionX1 = _at_positionX1;
            this.positionX2 = _at_positionX2;
            this.positionY = _at_positionY;
            this.height = _at_height;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
            this.geometry = BarGeometry;
        }
        return BarMark;
    }(Mark);
    PathMark = function (_super) {
        __extends(PathMark, _super);
        function PathMark(_at_space, _at_positionX, _at_positionY, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.space = _at_space;
            this.positionX = _at_positionX;
            this.positionY = _at_positionY;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
            this.geometry = PathGeometry;
        }
        return PathMark;
    }(Mark);
    TextMark = function (_super) {
        __extends(TextMark, _super);
        function TextMark(_at_space, _at_positionX, _at_positionY, _at_text, _at_size, _at_fillColor, _at_fillOpacity, _at_tooltip) {
            this.space = _at_space;
            this.positionX = _at_positionX;
            this.positionY = _at_positionY;
            this.text = _at_text;
            this.size = _at_size;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.tooltip = _at_tooltip;
            this.geometry = TextGeometry;
        }
        return TextMark;
    }(Mark);
    Encoding = function () {
        function Encoding() {
        }
        return Encoding;
    }();
    PointEncoding = function (_super) {
        __extends(PointEncoding, _super);
        function PointEncoding(_at_positionX, _at_positionY, _at_shape, _at_size, _at_fill, _at_fillColor, _at_fillOpacity, _at_stroke, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.positionX = _at_positionX;
            this.positionY = _at_positionY;
            this.shape = _at_shape;
            this.size = _at_size;
            this.fill = _at_fill;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.stroke = _at_stroke;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return PointEncoding;
    }(Encoding);
    SchemaXEncoding = function (_super) {
        __extends(SchemaXEncoding, _super);
        function SchemaXEncoding(_at_q0, _at_q1, _at_q2, _at_q3, _at_qn, _at_positionY, _at_height, _at_stroke, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.q0 = _at_q0;
            this.q1 = _at_q1;
            this.q2 = _at_q2;
            this.q3 = _at_q3;
            this.qn = _at_qn;
            this.positionY = _at_positionY;
            this.height = _at_height;
            this.stroke = _at_stroke;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return SchemaXEncoding;
    }(Encoding);
    SchemaYEncoding = function (_super) {
        __extends(SchemaYEncoding, _super);
        function SchemaYEncoding(_at_positionX, _at_q0, _at_q1, _at_q2, _at_q3, _at_qn, _at_width, _at_stroke, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.positionX = _at_positionX;
            this.q0 = _at_q0;
            this.q1 = _at_q1;
            this.q2 = _at_q2;
            this.q3 = _at_q3;
            this.qn = _at_qn;
            this.width = _at_width;
            this.stroke = _at_stroke;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return SchemaYEncoding;
    }(Encoding);
    ColEncoding = function (_super) {
        __extends(ColEncoding, _super);
        function ColEncoding(_at_positionX, _at_positionY1, _at_positionY2, _at_width, _at_fill, _at_fillColor, _at_fillOpacity, _at_stroke, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.positionX = _at_positionX;
            this.positionY1 = _at_positionY1;
            this.positionY2 = _at_positionY2;
            this.width = _at_width;
            this.fill = _at_fill;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.stroke = _at_stroke;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return ColEncoding;
    }(Encoding);
    BarEncoding = function (_super) {
        __extends(BarEncoding, _super);
        function BarEncoding(_at_positionX1, _at_positionX2, _at_positionY, _at_height, _at_fill, _at_fillColor, _at_fillOpacity, _at_stroke, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.positionX1 = _at_positionX1;
            this.positionX2 = _at_positionX2;
            this.positionY = _at_positionY;
            this.height = _at_height;
            this.fill = _at_fill;
            this.fillColor = _at_fillColor;
            this.fillOpacity = _at_fillOpacity;
            this.stroke = _at_stroke;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return BarEncoding;
    }(Encoding);
    PathEncoding = function (_super) {
        __extends(PathEncoding, _super);
        function PathEncoding(_at_positionX, _at_positionY, _at_stroke, _at_strokeColor, _at_strokeOpacity, _at_lineWidth, _at_tooltip) {
            this.positionX = _at_positionX;
            this.positionY = _at_positionY;
            this.stroke = _at_stroke;
            this.strokeColor = _at_strokeColor;
            this.strokeOpacity = _at_strokeOpacity;
            this.lineWidth = _at_lineWidth;
            this.tooltip = _at_tooltip;
        }
        return PathEncoding;
    }(Encoding);
    Space2D = function () {
        function Space2D(_at_x, _at_y) {
            this.x = _at_x;
            this.y = _at_y;
        }
        return Space2D;
    }();
    Space1D = function () {
        function Space1D(_at_type, _at_vectors, _at_domain) {
            this.type = _at_type;
            this.vectors = _at_vectors;
            this.domain = _at_domain;
        }
        return Space1D;
    }();
    Axis = function () {
        function Axis() {
        }
        return Axis;
    }();
    CategoricalAxis = function (_super) {
        __extends(CategoricalAxis, _super);
        function CategoricalAxis(_at_type, _at_label, _at_scale, _at_domain, _at_range, _at_rect, _at_guide) {
            this.type = _at_type;
            this.label = _at_label;
            this.scale = _at_scale;
            this.domain = _at_domain;
            this.range = _at_range;
            this.rect = _at_rect;
            this.guide = _at_guide;
        }
        return CategoricalAxis;
    }(Axis);
    LinearAxis = function (_super) {
        __extends(LinearAxis, _super);
        function LinearAxis(_at_type, _at_label, _at_scale, _at_domain, _at_range, _at_rect, _at_guide) {
            this.type = _at_type;
            this.label = _at_label;
            this.scale = _at_scale;
            this.domain = _at_domain;
            this.range = _at_range;
            this.rect = _at_rect;
            this.guide = _at_guide;
        }
        return LinearAxis;
    }(Axis);
    Tick = function () {
        function Tick(_at_value, _at_label) {
            this.value = _at_value;
            this.label = _at_label;
        }
        return Tick;
    }();
    Encoder = function () {
        function Encoder(_at_label, _at_encode) {
            this.label = _at_label;
            this.encode = _at_encode;
        }
        return Encoder;
    }();
    ConstantEncoder = function (_super) {
        __extends(ConstantEncoder, _super);
        function ConstantEncoder(_at_value) {
            this.value = _at_value;
            ConstantEncoder.__super__.constructor.call(this, 'Constant', always(this.value));
        }
        return ConstantEncoder;
    }(Encoder);
    VariableEncoder = function (_super) {
        __extends(VariableEncoder, _super);
        function VariableEncoder(label, encode, _at_vector) {
            this.vector = _at_vector;
            VariableEncoder.__super__.constructor.call(this, label, encode);
        }
        return VariableEncoder;
    }(Encoder);
    TooltipEncoder = function (_super) {
        __extends(TooltipEncoder, _super);
        function TooltipEncoder(_at_vectors) {
            this.vectors = _at_vectors;
            TooltipEncoder.__super__.constructor.call(this, 'tooltips');
        }
        return TooltipEncoder;
    }(Encoder);
    PositionEncoder = function (_super) {
        __extends(PositionEncoder, _super);
        function PositionEncoder(label, encode, vector, _at_domain, _at_range, _at_guide) {
            this.domain = _at_domain;
            this.range = _at_range;
            this.guide = _at_guide;
            PositionEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return PositionEncoder;
    }(VariableEncoder);
    ColorEncoder = function (_super) {
        __extends(ColorEncoder, _super);
        function ColorEncoder(label, encode, vector, _at_domain, _at_range, _at_guide) {
            this.domain = _at_domain;
            this.range = _at_range;
            this.guide = _at_guide;
            ColorEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return ColorEncoder;
    }(VariableEncoder);
    OpacityEncoder = function (_super) {
        __extends(OpacityEncoder, _super);
        function OpacityEncoder(label, encode, vector, _at_domain, _at_range, _at_guide) {
            this.domain = _at_domain;
            this.range = _at_range;
            this.guide = _at_guide;
            OpacityEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return OpacityEncoder;
    }(VariableEncoder);
    SizeEncoder = function (_super) {
        __extends(SizeEncoder, _super);
        function SizeEncoder(label, encode, vector, _at_domain, _at_range, _at_guide) {
            this.domain = _at_domain;
            this.range = _at_range;
            this.guide = _at_guide;
            SizeEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return SizeEncoder;
    }(VariableEncoder);
    ShapeEncoder = function (_super) {
        __extends(ShapeEncoder, _super);
        function ShapeEncoder(label, encode, vector, _at_domain, _at_range, _at_guide) {
            this.domain = _at_domain;
            this.range = _at_range;
            this.guide = _at_guide;
            ShapeEncoder.__super__.constructor.call(this, label, encode, vector);
        }
        return ShapeEncoder;
    }(VariableEncoder);
    Channel = function () {
        function Channel() {
        }
        return Channel;
    }();
    ColorChannel = function (_super) {
        __extends(ColorChannel, _super);
        function ColorChannel() {
            return ColorChannel.__super__.constructor.apply(this, arguments);
        }
        return ColorChannel;
    }(Channel);
    CoordChannel = function (_super) {
        __extends(CoordChannel, _super);
        function CoordChannel(_at_field) {
            this.field = _at_field;
        }
        return CoordChannel;
    }(Channel);
    PositionChannel = function (_super) {
        __extends(PositionChannel, _super);
        function PositionChannel(_at_coordinates) {
            this.coordinates = _at_coordinates;
        }
        return PositionChannel;
    }(Channel);
    FillColorChannel = function (_super) {
        __extends(FillColorChannel, _super);
        function FillColorChannel() {
            return FillColorChannel.__super__.constructor.apply(this, arguments);
        }
        return FillColorChannel;
    }(Channel);
    FillOpacityChannel = function (_super) {
        __extends(FillOpacityChannel, _super);
        function FillOpacityChannel() {
            return FillOpacityChannel.__super__.constructor.apply(this, arguments);
        }
        return FillOpacityChannel;
    }(Channel);
    StrokeColorChannel = function (_super) {
        __extends(StrokeColorChannel, _super);
        function StrokeColorChannel() {
            return StrokeColorChannel.__super__.constructor.apply(this, arguments);
        }
        return StrokeColorChannel;
    }(Channel);
    StrokeOpacityChannel = function (_super) {
        __extends(StrokeOpacityChannel, _super);
        function StrokeOpacityChannel() {
            return StrokeOpacityChannel.__super__.constructor.apply(this, arguments);
        }
        return StrokeOpacityChannel;
    }(Channel);
    SizeChannel = function (_super) {
        __extends(SizeChannel, _super);
        function SizeChannel() {
            return SizeChannel.__super__.constructor.apply(this, arguments);
        }
        return SizeChannel;
    }(Channel);
    WidthChannel = function (_super) {
        __extends(WidthChannel, _super);
        function WidthChannel() {
            return WidthChannel.__super__.constructor.apply(this, arguments);
        }
        return WidthChannel;
    }(Channel);
    HeightChannel = function (_super) {
        __extends(HeightChannel, _super);
        function HeightChannel() {
            return HeightChannel.__super__.constructor.apply(this, arguments);
        }
        return HeightChannel;
    }(Channel);
    LineWidthChannel = function (_super) {
        __extends(LineWidthChannel, _super);
        function LineWidthChannel() {
            return LineWidthChannel.__super__.constructor.apply(this, arguments);
        }
        return LineWidthChannel;
    }(Channel);
    ShapeChannel = function (_super) {
        __extends(ShapeChannel, _super);
        function ShapeChannel() {
            return ShapeChannel.__super__.constructor.apply(this, arguments);
        }
        return ShapeChannel;
    }(Channel);
    TooltipChannel = function (_super) {
        __extends(TooltipChannel, _super);
        function TooltipChannel() {
            return TooltipChannel.__super__.constructor.apply(this, arguments);
        }
        return TooltipChannel;
    }(Channel);
    ConstantFillColorChannel = function (_super) {
        __extends(ConstantFillColorChannel, _super);
        function ConstantFillColorChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantFillColorChannel;
    }(FillColorChannel);
    VariableFillColorChannel = function (_super) {
        __extends(VariableFillColorChannel, _super);
        function VariableFillColorChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableFillColorChannel;
    }(FillColorChannel);
    ConstantFillOpacityChannel = function (_super) {
        __extends(ConstantFillOpacityChannel, _super);
        function ConstantFillOpacityChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantFillOpacityChannel;
    }(FillOpacityChannel);
    VariableFillOpacityChannel = function (_super) {
        __extends(VariableFillOpacityChannel, _super);
        function VariableFillOpacityChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableFillOpacityChannel;
    }(FillOpacityChannel);
    ConstantStrokeColorChannel = function (_super) {
        __extends(ConstantStrokeColorChannel, _super);
        function ConstantStrokeColorChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantStrokeColorChannel;
    }(StrokeColorChannel);
    VariableStrokeColorChannel = function (_super) {
        __extends(VariableStrokeColorChannel, _super);
        function VariableStrokeColorChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableStrokeColorChannel;
    }(StrokeColorChannel);
    ConstantStrokeOpacityChannel = function (_super) {
        __extends(ConstantStrokeOpacityChannel, _super);
        function ConstantStrokeOpacityChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantStrokeOpacityChannel;
    }(StrokeOpacityChannel);
    VariableStrokeOpacityChannel = function (_super) {
        __extends(VariableStrokeOpacityChannel, _super);
        function VariableStrokeOpacityChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableStrokeOpacityChannel;
    }(StrokeOpacityChannel);
    ConstantSizeChannel = function (_super) {
        __extends(ConstantSizeChannel, _super);
        function ConstantSizeChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantSizeChannel;
    }(SizeChannel);
    VariableSizeChannel = function (_super) {
        __extends(VariableSizeChannel, _super);
        function VariableSizeChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableSizeChannel;
    }(SizeChannel);
    ConstantWidthChannel = function (_super) {
        __extends(ConstantWidthChannel, _super);
        function ConstantWidthChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantWidthChannel;
    }(WidthChannel);
    VariableWidthChannel = function (_super) {
        __extends(VariableWidthChannel, _super);
        function VariableWidthChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableWidthChannel;
    }(WidthChannel);
    ConstantHeightChannel = function (_super) {
        __extends(ConstantHeightChannel, _super);
        function ConstantHeightChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantHeightChannel;
    }(HeightChannel);
    VariableHeightChannel = function (_super) {
        __extends(VariableHeightChannel, _super);
        function VariableHeightChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableHeightChannel;
    }(HeightChannel);
    ConstantLineWidthChannel = function (_super) {
        __extends(ConstantLineWidthChannel, _super);
        function ConstantLineWidthChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantLineWidthChannel;
    }(LineWidthChannel);
    VariableLineWidthChannel = function (_super) {
        __extends(VariableLineWidthChannel, _super);
        function VariableLineWidthChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableLineWidthChannel;
    }(LineWidthChannel);
    ConstantShapeChannel = function (_super) {
        __extends(ConstantShapeChannel, _super);
        function ConstantShapeChannel(_at_value) {
            this.value = _at_value;
        }
        return ConstantShapeChannel;
    }(ShapeChannel);
    VariableShapeChannel = function (_super) {
        __extends(VariableShapeChannel, _super);
        function VariableShapeChannel(_at_field, _at_range) {
            this.field = _at_field;
            this.range = _at_range;
        }
        return VariableShapeChannel;
    }(ShapeChannel);
    VariableTooltipChannel = function (_super) {
        __extends(VariableTooltipChannel, _super);
        function VariableTooltipChannel(_at_fields) {
            this.fields = _at_fields;
        }
        return VariableTooltipChannel;
    }(TooltipChannel);
    Extent = function () {
        function Extent(_at_min, _at_max) {
            this.min = _at_min;
            this.max = _at_max;
        }
        return Extent;
    }();
    Range = function () {
        function Range() {
        }
        return Range;
    }();
    CategoricalRange = function (_super) {
        __extends(CategoricalRange, _super);
        function CategoricalRange(_at_values) {
            this.values = _at_values;
        }
        return CategoricalRange;
    }(Range);
    QuantitativeRange = function (_super) {
        __extends(QuantitativeRange, _super);
        function QuantitativeRange() {
            return QuantitativeRange.__super__.constructor.apply(this, arguments);
        }
        return QuantitativeRange;
    }(Range);
    SequentialRange = function (_super) {
        __extends(SequentialRange, _super);
        function SequentialRange(_at_min, _at_max) {
            this.min = _at_min;
            this.max = _at_max;
        }
        return SequentialRange;
    }(QuantitativeRange);
    DivergingRange = function (_super) {
        __extends(DivergingRange, _super);
        function DivergingRange(_at_min, _at_mid, _at_max) {
            this.min = _at_min;
            this.mid = _at_mid;
            this.max = _at_max;
        }
        return DivergingRange;
    }(QuantitativeRange);
    ColorRange = function (_super) {
        __extends(ColorRange, _super);
        function ColorRange() {
            return ColorRange.__super__.constructor.apply(this, arguments);
        }
        return ColorRange;
    }(Range);
    SequentialColorRange = function (_super) {
        __extends(SequentialColorRange, _super);
        function SequentialColorRange(_at_min, _at_max) {
            this.min = _at_min;
            this.max = _at_max;
        }
        return SequentialColorRange;
    }(ColorRange);
    DivergingColorRange = function (_super) {
        __extends(DivergingColorRange, _super);
        function DivergingColorRange(_at_min, _at_mid, _at_max) {
            this.min = _at_min;
            this.mid = _at_mid;
            this.max = _at_max;
        }
        return DivergingColorRange;
    }(ColorRange);
    Geometry = function () {
        function Geometry(_at_encode, _at_mask, _at_highlight, _at_render, _at_select) {
            this.encode = _at_encode;
            this.mask = _at_mask;
            this.highlight = _at_highlight;
            this.render = _at_render;
            this.select = _at_select;
        }
        return Geometry;
    }();
    Datasource = function () {
        function Datasource(_at_read) {
            this.read = _at_read;
        }
        return Datasource;
    }();
    Canvas = function () {
        function Canvas(_at_element, _at_context, _at_bounds, _at_ratio) {
            this.element = _at_element;
            this.context = _at_context;
            this.bounds = _at_bounds;
            this.ratio = _at_ratio;
        }
        return Canvas;
    }();
    Viewport = function () {
        function Viewport(_at_box, _at_container, _at_baseCanvas, _at_highlightCanvas, _at_hoverCanvas, _at_maskCanvas, _at_clipCanvas, _at_marquee, _at_tooltip, _at_mask, _at_clip) {
            this.box = _at_box;
            this.container = _at_container;
            this.baseCanvas = _at_baseCanvas;
            this.highlightCanvas = _at_highlightCanvas;
            this.hoverCanvas = _at_hoverCanvas;
            this.maskCanvas = _at_maskCanvas;
            this.clipCanvas = _at_clipCanvas;
            this.marquee = _at_marquee;
            this.tooltip = _at_tooltip;
            this.mask = _at_mask;
            this.clip = _at_clip;
        }
        return Viewport;
    }();
    Layer = function () {
        function Layer(_at_encodings, _at_encoders, _at_mask, _at_highlight, _at_render, _at_select) {
            this.encodings = _at_encodings;
            this.encoders = _at_encoders;
            this.mask = _at_mask;
            this.highlight = _at_highlight;
            this.render = _at_render;
            this.select = _at_select;
        }
        return Layer;
    }();
    Visualization = function () {
        function Visualization(_at_viewport, _at_frame, _at_test, _at_highlight, _at_hover, _at_selectAt, _at_selectWithin, _at_render) {
            this.viewport = _at_viewport;
            this.frame = _at_frame;
            this.test = _at_test;
            this.highlight = _at_highlight;
            this.hover = _at_hover;
            this.selectAt = _at_selectAt;
            this.selectWithin = _at_selectWithin;
            this.render = _at_render;
        }
        return Visualization;
    }();
    Plot = function () {
        function Plot(_at_element, _at_subscribe, _at_unsubscribe) {
            this.element = _at_element;
            this.subscribe = _at_subscribe;
            this.unsubscribe = _at_unsubscribe;
        }
        return Plot;
    }();
    Bounds = function () {
        function Bounds(_at_width, _at_height) {
            this.width = _at_width;
            this.height = _at_height;
        }
        return Bounds;
    }();
    Regions = function () {
        function Regions(_at_center, _at_left, _at_top, _at_right, _at_bottom) {
            this.center = _at_center;
            this.left = _at_left;
            this.top = _at_top;
            this.right = _at_right;
            this.bottom = _at_bottom;
        }
        return Regions;
    }();
    Margin = function () {
        function Margin(_at_left, _at_top, _at_right, _at_bottom) {
            this.left = _at_left;
            this.top = _at_top;
            this.right = _at_right;
            this.bottom = _at_bottom;
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
        function Query(_at_select, _at_where, _at_limit, _at_group, _at_having) {
            this.select = _at_select;
            this.where = _at_where;
            this.limit = _at_limit;
            this.group = _at_group;
            this.having = _at_having;
        }
        return Query;
    }();
    Category = function () {
        function Category(_at_key, _at_value) {
            this.key = _at_key;
            this.value = _at_value;
        }
        return Category;
    }();
    All = new Category(0, 'All');
    Cube = function () {
        function Cube(_at_frame, _at_hierarchy, _at_cells, _at_dimension) {
            this.frame = _at_frame;
            this.hierarchy = _at_hierarchy;
            this.cells = _at_cells;
            this.dimension = _at_dimension;
        }
        return Cube;
    }();
    Level = function () {
        function Level(_at_category, _at_indices, _at_children) {
            this.category = _at_category;
            this.indices = _at_indices;
            this.children = _at_children;
        }
        return Level;
    }();
    Cell = function () {
        function Cell(_at_levels, _at_indices) {
            this.levels = _at_levels;
            this.indices = _at_indices;
        }
        return Cell;
    }();
    Factoring = function () {
        function Factoring(_at_at, _at_valueAt, _at_count, _at_domain, _at_format) {
            this.at = _at_at;
            this.valueAt = _at_valueAt;
            this.count = _at_count;
            this.domain = _at_domain;
            this.format = _at_format;
        }
        return Factoring;
    }();
    GroupOp = function () {
        function GroupOp(_at_fields) {
            this.fields = _at_fields;
        }
        return GroupOp;
    }();
    SelectOp = function () {
        function SelectOp(_at_name, _at_fields, _at_func) {
            this.name = _at_name;
            this.fields = _at_fields;
            this.func = _at_func;
        }
        return SelectOp;
    }();
    WhereOp = function () {
        function WhereOp(_at_fields, _at_predicate) {
            this.fields = _at_fields;
            this.predicate = _at_predicate;
        }
        return WhereOp;
    }();
    LimitOp = function () {
        function LimitOp(_at_offset, _at_length) {
            this.offset = _at_offset;
            this.length = _at_length;
        }
        return LimitOp;
    }();
    HavingOp = function () {
        function HavingOp(_at_fields, _at_predicate) {
            this.fields = _at_fields;
            this.predicate = _at_predicate;
        }
        return HavingOp;
    }();
    HoverEventArg = function () {
        function HoverEventArg(_at_vectors, _at_index) {
            this.vectors = _at_vectors;
            this.index = _at_index;
        }
        return HoverEventArg;
    }();
    SelectEventArg = function () {
        function SelectEventArg(_at_vectors, _at_indices) {
            this.vectors = _at_vectors;
            this.indices = _at_indices;
        }
        return SelectEventArg;
    }();
    DeselectEventArg = function () {
        function DeselectEventArg(_at_vectors) {
            this.vectors = _at_vectors;
        }
        return DeselectEventArg;
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
    asString = function (datum) {
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
        var x, y, ys, _i, _j, _len, _len1, _ref;
        ys = [];
        for (_i = 0, _len = xs.length; _i < _len; _i++) {
            x = xs[_i];
            _ref = f(x);
            for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
                y = _ref[_j];
                ys.push(y);
            }
        }
        return ys;
    };
    operation = function () {
        var args, f;
        f = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
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
        var i, x, _i, _len;
        if (xs && ys && xs.length === ys.length) {
            for (i = _i = 0, _len = xs.length; _i < _len; i = ++_i) {
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
        var arg, args, filtered, type, types, _i, _j, _len, _len1;
        args = arguments[0], types = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
        filtered = [];
        for (_i = 0, _len = args.length; _i < _len; _i++) {
            arg = args[_i];
            for (_j = 0, _len1 = types.length; _j < _len1; _j++) {
                type = types[_j];
                if (arg instanceof type) {
                    filtered.push(arg);
                }
            }
        }
        return filtered;
    };
    findByType = function () {
        var arg, args, type, types, _i, _j, _len, _len1;
        args = arguments[0], types = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
        for (_i = 0, _len = args.length; _i < _len; _i++) {
            arg = args[_i];
            for (_j = 0, _len1 = types.length; _j < _len1; _j++) {
                type = types[_j];
                if (arg instanceof type) {
                    return arg;
                }
            }
        }
    };
    createExtent = function (a, b) {
        if (a < b) {
            return new Extent(a, b);
        } else {
            return new Extent(b, a);
        }
    };
    computeExtent = function (array) {
        var max, min, value, _i, _len;
        min = Number.POSITIVE_INFINITY;
        max = Number.NEGATIVE_INFINITY;
        for (_i = 0, _len = array.length; _i < _len; _i++) {
            value = array[_i];
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
    factorize = function (_read, count, values) {
        var at, category, data, domain, element, format, i, length, value, valueAt, _dictionary, _i, _id;
        _id = 0;
        _dictionary = {};
        length = count();
        data = new Array(length);
        domain = function () {
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = values.length; _i < _len; _i++) {
                value = values[_i];
                _results.push(_dictionary[value] = new Category(_id++, value));
            }
            return _results;
        }();
        for (i = _i = 0; 0 <= length ? _i < length : _i > length; i = 0 <= length ? ++_i : --_i) {
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
        format = function (i) {
            return data[i].value;
        };
        return new Factoring(at, valueAt, count, domain, format);
    };
    createFactor = function (label, type, data, domain) {
        var at, count, factoring;
        count = function () {
            return data.length;
        };
        at = function (i) {
            return data[i];
        };
        factoring = factorize(at, count, domain || []);
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
        schema = _.indexBy(vectors, function (vector) {
            return vector.name;
        });
        frame = new Frame(label, vectors, schema, indices, cube, null, null, null, metadata || {});
        frame.evaluate = function (arg) {
            var field, fields, vecs, vector;
            fields = _.isArray(arg) ? arg : [arg];
            vecs = function () {
                var _i, _len, _results;
                _results = [];
                for (_i = 0, _len = fields.length; _i < _len; _i++) {
                    field = fields[_i];
                    if (field instanceof MappedField) {
                        _results.push(frame.evaluate(field.evaluate(frame)));
                    } else if (field instanceof ReducedField) {
                        if (cube) {
                            _results.push(frame.evaluate(field.evaluate(frame, cube)));
                        } else {
                            throw new Error('Cannot compute aggregate [' + field.name + '] on an unaggregated frame.');
                        }
                    } else if (field instanceof Field) {
                        if (vector = schema[field.name]) {
                            _results.push(vector);
                        } else {
                            throw new Error('Vector [' + field.name + '] does not exist in frame [' + label + '].');
                        }
                    } else {
                        throw new Error('Cannot evaluate [' + arg + '] on frame [' + label + '].');
                    }
                }
                return _results;
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
        var at, ats, i, offset, row, rows, _i, _j, _len, _len1, _ref;
        rows = new Array(frame.indices.length);
        ats = _.map(frame.vectors, function (vector) {
            if (vector instanceof Factor) {
                return vector.valueAt;
            } else {
                return vector.at;
            }
        });
        _ref = frame.indices;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            i = _ref[_i];
            rows[i] = row = new Array(frame.vectors.length);
            for (offset = _j = 0, _len1 = ats.length; _j < _len1; offset = ++_j) {
                at = ats[offset];
                row[offset] = at(i);
            }
        }
        return rows;
    };
    createQuery = function (ops) {
        return new Query(filterByType(ops, SelectOp), filterByType(ops, WhereOp), filterByType(ops, LimitOp), filterByType(ops, GroupOp), filterByType(ops, HavingOp));
    };
    createFields = function (names) {
        return _.map(names, function (name) {
            return new Field(name);
        });
    };
    createFactorField = function (field) {
        return new MappedField(function (frame) {
            var at, computedVector, data, i, length, value, vector, _i;
            vector = _.head(frame.evaluate(field));
            if (vector instanceof Factor) {
                return field;
            } else {
                length = vector.count();
                at = vector.at;
                data = new Array(length);
                for (i = _i = 0; 0 <= length ? _i < length : _i > length; i = 0 <= length ? ++_i : --_i) {
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
        function (_arg) {
            var value;
            value = _arg.value;
            return createAllField(value);
        }
    ]);
    createStackedField = function (stackedField, depth) {
        return new MappedField(function (frame) {
            var at, cells, cube, format, hi, highName, highs, i, j, k, length, levels, lo, lowName, lows, value, vector, _categories, _i, _j, _k, _len, _ref;
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
            _ref = frame.indices;
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                i = _ref[_i];
                levels = cells[i].levels;
                for (j = _j = 0; 0 <= depth ? _j < depth : _j > depth; j = 0 <= depth ? ++_j : --_j) {
                    if (_categories[j] !== levels[j].category) {
                        lo = hi = 0;
                        for (k = _k = 0; 0 <= depth ? _k < depth : _k > depth; k = 0 <= depth ? ++_k : --_k) {
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
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = array.length; _i < _len; _i++) {
                value = array[_i];
                if (value || value === 0) {
                    _results.push(value);
                }
            }
            return _results;
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
        var count, total, value, _i, _len;
        total = 0;
        count = 0;
        for (_i = 0, _len = array.length; _i < _len; _i++) {
            value = array[_i];
            if (!(value !== void 0)) {
                continue;
            }
            total += value;
            count++;
        }
        return total / count;
    };
    aggregate_count = function (array) {
        var count, value, _i, _len;
        count = 0;
        for (_i = 0, _len = array.length; _i < _len; _i++) {
            value = array[_i];
            if (value !== void 0) {
                count++;
            }
        }
        return count;
    };
    aggregate_max = function (array) {
        var max, value, _i, _len;
        max = Number.NEGATIVE_INFINITY;
        for (_i = 0, _len = array.length; _i < _len; _i++) {
            value = array[_i];
            if (value !== void 0) {
                if (value >= max) {
                    max = value;
                }
            }
        }
        return max;
    };
    aggregate_min = function (array) {
        var min, value, _i, _len;
        min = Number.POSITIVE_INFINITY;
        for (_i = 0, _len = array.length; _i < _len; _i++) {
            value = array[_i];
            if (value !== void 0) {
                if (value <= min) {
                    min = value;
                }
            }
        }
        return min;
    };
    aggregate_sum = function (array) {
        var total, value, _i, _len;
        total = 0;
        for (_i = 0, _len = array.length; _i < _len; _i++) {
            value = array[_i];
            if (value !== void 0) {
                total += value;
            }
        }
        return total;
    };
    createAggregateField = function (field, symbol, type, format, f) {
        return new ReducedField(function (frame, cube) {
            var at, cell, computedVector, data, i, j, name, value, values, vector, _i, _j, _len, _len1, _ref, _ref1;
            name = symbol + '(' + field.name + ')';
            if (frame.exists(name)) {
                return new Field(name);
            } else {
                vector = _.head(cube.frame.evaluate(field));
                at = vector.at;
                data = new Array(cube.cells.length);
                _ref = cube.cells;
                for (j = _i = 0, _len = _ref.length; _i < _len; j = ++_i) {
                    cell = _ref[j];
                    values = [];
                    _ref1 = cell.indices;
                    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
                        i = _ref1[_j];
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
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        fields = function () {
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = args.length; _i < _len; _i++) {
                arg = args[_i];
                if (arg instanceof Field) {
                    _results.push(arg);
                } else if (_.isString(arg)) {
                    _results.push(new Field(arg));
                } else {
                    throw new Error('Cannot group by [' + arg + ']');
                }
            }
            return _results;
        }();
        return new GroupOp(fields);
    };
    plot__select = dispatch([
        String,
        [String],
        Function,
        function (target, sources, func) {
            return new SelectOp(target, createFields(sources), func);
        }
    ]);
    plot_select = function () {
        var func, sources, target, _i;
        target = arguments[0], sources = 3 <= arguments.length ? __slice.call(arguments, 1, _i = arguments.length - 1) : (_i = 1, []), func = arguments[_i++];
        return plot__select(target, sources.length ? sources : [target], func);
    };
    plot__where = dispatch([
        [String],
        Function,
        function (names, func) {
            return new WhereOp(createFields(names), func);
        }
    ]);
    plot_where = function () {
        var func, names, _i;
        names = 2 <= arguments.length ? __slice.call(arguments, 0, _i = arguments.length - 1) : (_i = 0, []), func = arguments[_i++];
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
        var func, names, _i;
        names = 2 <= arguments.length ? __slice.call(arguments, 0, _i = arguments.length - 1) : (_i = 0, []), func = arguments[_i++];
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
    plot_in = function () {
        var expecteds;
        expecteds = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        return function (actual) {
            var expected, _i, _len;
            for (_i = 0, _len = expecteds.length; _i < _len; _i++) {
                expected = expecteds[_i];
                if (expected === actual) {
                    return true;
                }
            }
            return false;
        };
    };
    plot_notIn = function () {
        var expecteds;
        expecteds = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        return function (actual) {
            var expected, _i, _len;
            for (_i = 0, _len = expecteds.length; _i < _len; _i++) {
                expected = expecteds[_i];
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
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = fields.length; _i < _len; _i++) {
                field = fields[_i];
                vector = _.head(filteredFrame.evaluate(field));
                if (vector instanceof Factor) {
                    _results.push(vector);
                } else {
                    throw new Error('Cannot group by [' + field.name + ']: not a Factor.');
                }
            }
            return _results;
        }(), hierarchy = { 0: new Level(All, filteredFrame.indices, {}) }, buildHierarchy(hierarchy, factors, 0), cells = [], collapseHierarchy(hierarchy[0].children, fields.length - 1, cells, 0, new Array(fields.length)), cube = new Cube(filteredFrame, hierarchy, cells, fields.length), aggregatedFrame = aggregateFrame(filteredFrame.label + '\'', cube, factors), query.having.length ? createFrame(aggregatedFrame.label, aggregatedFrame.vectors, filterFrame(aggregatedFrame, query.having), aggregatedFrame.cube) : aggregatedFrame) : filteredFrame;
        if (query.limit.length) {
            limit = query.limit[query.limit.length - 1];
            return createFrame(resultFrame.label, resultFrame.vectors, resultFrame.indices.slice(limit.offset, limit.offset + limit.length));
        } else {
            return resultFrame;
        }
    };
    filterFrame = function (frame, ops) {
        var args, at, ats, field, i, indices, j, op, vectors, _i, _indices, _j, _k, _len, _len1, _len2;
        _indices = frame.indices;
        for (_i = 0, _len = ops.length; _i < _len; _i++) {
            op = ops[_i];
            indices = [];
            vectors = function () {
                var _j, _len1, _ref, _results;
                _ref = op.fields;
                _results = [];
                for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
                    field = _ref[_j];
                    _results.push(_.head(frame.evaluate(field)));
                }
                return _results;
            }();
            ats = _.map(vectors, function (vector) {
                if (vector instanceof Factor) {
                    return vector.valueAt;
                } else {
                    return vector.at;
                }
            });
            for (_j = 0, _len1 = _indices.length; _j < _len1; _j++) {
                i = _indices[_j];
                args = new Array(vectors.length);
                for (j = _k = 0, _len2 = ats.length; _k < _len2; j = ++_k) {
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
            var _i, _ref, _results;
            _results = [];
            for (offset = _i = 0, _ref = cube.dimension; 0 <= _ref ? _i < _ref : _i > _ref; offset = 0 <= _ref ? ++_i : --_i) {
                _results.push(extractFactor(cube, sourceFactors[offset], offset));
            }
            return _results;
        }();
        return createFrame(label, targetFactors, indices, cube);
    };
    buildHierarchy = function (hierarchy, vectors, offset) {
        var at, category, child, children, i, key, level, _i, _len, _ref;
        at = vectors[offset].at;
        for (key in hierarchy) {
            level = hierarchy[key];
            children = level.children;
            _ref = level.indices;
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                i = _ref[_i];
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
        var at, category, cell, count, data, dictionary, domain, format, i, valueAt, _i, _len, _ref;
        data = new Array(cube.cells.length);
        dictionary = {};
        domain = [];
        _ref = cube.cells;
        for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
            cell = _ref[i];
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
        var b, g, r, _ref;
        _ref = color.rgb(), r = _ref[0], g = _ref[1], b = _ref[2];
        return chroma.rgb(r, g, b);
    };
    colorToStyle = function (color) {
        return color.css();
    };
    colorToStyleA = function (color, alpha) {
        return cloneColor(color).alpha(alpha).css();
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
        scale = d3.scale.linear().domain([
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
        var category, offset, rangeMin, _dictionary, _i, _index, _len;
        _index = 0;
        _dictionary = {};
        for (_i = 0, _len = domain.length; _i < _len; _i++) {
            category = domain[_i];
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
        return scaleSafe_(d3.scale.linear().domain([
            domain.min,
            domain.max
        ]).range([
            range.min,
            range.max
        ]));
    };
    createDivergingLinearScale = function (domain, range) {
        return scaleSafe_(d3.scale.linear().domain([
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
            var a, b, g, r, _ref;
            _ref = context.getImageData(x * ratio, y * ratio, 1, 1).data, r = _ref[0], g = _ref[1], b = _ref[2], a = _ref[3];
            return r === 255 && g === 255 && b === 255 && a === 255;
        };
        return new Clip(put, test);
    };
    createMask = function (canvas) {
        var context, dict, put, ratio, test, _color;
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
            var a, b, color, g, r, _ref;
            _ref = context.getImageData(x * ratio, y * ratio, 1, 1).data, r = _ref[0], g = _ref[1], b = _ref[2], a = _ref[3];
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
                var color, opacity;
                color = colorAt(i);
                opacity = opacityAt(i);
                if (0 <= opacity && opacity < 1) {
                    return colorToStyleA(color, opacity);
                } else {
                    return colorToStyle(color);
                }
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
                var _i, _len, _ref, _results;
                _ref = channel.fields;
                _results = [];
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    field = _ref[_i];
                    _results.push(_.head(frame.evaluate(field)));
                }
                return _results;
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
        var hasFill, hasStroke, _ref, _ref1;
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
            _ref = initFill(fillColor, fillOpacity), fillColor = _ref[0], fillOpacity = _ref[1];
        }
        if (hasStroke) {
            _ref1 = initStroke(strokeColor, strokeOpacity, lineWidth), strokeColor = _ref1[0], strokeOpacity = _ref1[1], lineWidth = _ref1[2];
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
    createPointMark = function (expr, vectors) {
        var fillColor, fillOpacity, lineWidth, positionX, positionY, shape, size, space, strokeColor, strokeOpacity, _ref, _ref1, _ref2;
        positionX = vectors[0], positionY = vectors[1];
        space = new Space2D([positionX], [positionY]);
        shape = (_ref = expr.shape) != null ? _ref : new ConstantShapeChannel('circle');
        size = (_ref1 = expr.size) != null ? _ref1 : new ConstantSizeChannel(defaultSize);
        _ref2 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, false, true), fillColor = _ref2[0], fillOpacity = _ref2[1], strokeColor = _ref2[2], strokeOpacity = _ref2[3], lineWidth = _ref2[4];
        return new PointMark(space, positionX, positionY, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
    };
    encodePointMark = function (frame, mark, axisX, axisY) {
        var fill, fillColor, fillOpacity, lineWidth, positionX, positionY, shape, size, stroke, strokeColor, strokeOpacity, tooltip, _ref, _ref1;
        positionX = encodePosition(axisX, mark.positionX);
        positionY = encodePosition(axisY, mark.positionY);
        shape = encodeShape(frame, mark.shape);
        size = encodeArea(frame, mark.size);
        _ref = encodeFill(frame, mark), fillColor = _ref[0], fillOpacity = _ref[1], fill = _ref[2];
        _ref1 = encodeStroke(frame, mark), strokeColor = _ref1[0], strokeOpacity = _ref1[1], stroke = _ref1[2], lineWidth = _ref1[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new PointEncoding(positionX, positionY, shape, size, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightPointMarks = function (indices, encoders, g) {
        var fill, i, lineWidth, positionX, positionY, shape, size, stroke, x, y, _i, _j, _len, _len1;
        positionX = encoders.positionX, positionY = encoders.positionY, shape = encoders.shape, size = encoders.size, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        for (_j = 0, _len1 = indices.length; _j < _len1; _j++) {
            i = indices[_j];
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
        var i, lineWidth, maskStyle, positionX, positionY, shape, size, stroke, x, y, _i, _len;
        positionX = encoders.positionX, positionY = encoders.positionY, shape = encoders.shape, size = encoders.size, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var fill, i, lineWidth, positionX, positionY, shape, size, stroke, x, y, _i, _len;
        positionX = encoders.positionX, positionY = encoders.positionY, shape = encoders.shape, size = encoders.size, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var i, positionX, positionY, selectedIndices, x, y, _i, _len;
        positionX = encoders.positionX, positionY = encoders.positionY;
        selectedIndices = [];
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var fillColor, fillOpacity, height, lineWidth, positionX, positionX1, positionX2, positionY, positionY1, positionY2, space, strokeColor, strokeOpacity, structure, width, _ref, _ref1, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7;
        structure = structureOf(vectors);
        switch (structure) {
        case 'String, Number':
            positionX = vectors[0], positionY2 = vectors[1];
            space = new Space2D([positionX], [positionY2]);
            width = (_ref = expr.width) != null ? _ref : new ConstantWidthChannel(0.8);
            _ref1 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = _ref1[0], fillOpacity = _ref1[1], strokeColor = _ref1[2], strokeOpacity = _ref1[3], lineWidth = _ref1[4];
            return new ColMark(space, positionX, void 0, positionY2, width, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        case 'String, Number, Number':
            positionX = vectors[0], positionY1 = vectors[1], positionY2 = vectors[2];
            space = new Space2D([positionX], [
                positionY1,
                positionY2
            ]);
            width = (_ref2 = expr.width) != null ? _ref2 : new ConstantWidthChannel(0.8);
            _ref3 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = _ref3[0], fillOpacity = _ref3[1], strokeColor = _ref3[2], strokeOpacity = _ref3[3], lineWidth = _ref3[4];
            return new ColMark(space, positionX, positionY1, positionY2, width, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        case 'Number, String':
            positionX2 = vectors[0], positionY = vectors[1];
            space = new Space2D([positionX2], [positionY]);
            height = (_ref4 = expr.height) != null ? _ref4 : new ConstantHeightChannel(0.8);
            _ref5 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = _ref5[0], fillOpacity = _ref5[1], strokeColor = _ref5[2], strokeOpacity = _ref5[3], lineWidth = _ref5[4];
            return new BarMark(space, void 0, positionX2, positionY, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        case 'Number, Number, String':
            positionX1 = vectors[0], positionX2 = vectors[1], positionY = vectors[2];
            space = new Space2D([
                positionX1,
                positionX2
            ], [positionY]);
            height = (_ref6 = expr.height) != null ? _ref6 : new ConstantHeightChannel(0.8);
            _ref7 = initFillAndStroke(expr.fillColor, expr.fillOpacity, expr.strokeColor, expr.strokeOpacity, expr.lineWidth, true, false), fillColor = _ref7[0], fillOpacity = _ref7[1], strokeColor = _ref7[2], strokeOpacity = _ref7[3], lineWidth = _ref7[4];
            return new BarMark(space, positionX1, positionX2, positionY, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        default:
            throw new Error('Cannot create rect marks with vectors of type [' + structure + ']');
        }
    };
    encodeColMark = function (frame, mark, axisX, axisY) {
        var fill, fillColor, fillOpacity, lineWidth, positionX, positionY1, positionY2, stroke, strokeColor, strokeOpacity, tooltip, width, _ref, _ref1;
        positionX = encodePosition(axisX, mark.positionX);
        positionY1 = mark.positionY1 ? encodePosition(axisY, mark.positionY1) : encodeConstantPosition(axisY, 0);
        positionY2 = encodePosition(axisY, mark.positionY2);
        width = encodeSize(frame, mark.width, axisX.rect.width / axisX.domain.length);
        _ref = encodeFill(frame, mark), fillColor = _ref[0], fillOpacity = _ref[1], fill = _ref[2];
        _ref1 = encodeStroke(frame, mark), strokeColor = _ref1[0], strokeOpacity = _ref1[1], stroke = _ref1[2], lineWidth = _ref1[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new ColEncoding(positionX, positionY1, positionY2, width, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    encodeBarMark = function (frame, mark, axisX, axisY) {
        var fill, fillColor, fillOpacity, height, lineWidth, positionX1, positionX2, positionY, stroke, strokeColor, strokeOpacity, tooltip, x1, x2, y, _ref, _ref1, _ref2;
        switch (mark.space.x.length) {
        case 1:
            x2 = mark.space.x[0];
            positionX1 = encodeConstantPosition(axisX, 0);
            positionX2 = encodePosition(axisX, x2);
            break;
        default:
            _ref = mark.space.x, x1 = _ref[0], x2 = _ref[1];
            positionX1 = encodePosition(axisX, x1);
            positionX2 = encodePosition(axisX, x2);
        }
        y = mark.space.y[0];
        positionY = encodePosition(axisY, y);
        height = encodeSize(frame, mark.height, axisY.rect.height / axisY.domain.length);
        _ref1 = encodeFill(frame, mark), fillColor = _ref1[0], fillOpacity = _ref1[1], fill = _ref1[2];
        _ref2 = encodeStroke(frame, mark), strokeColor = _ref2[0], strokeOpacity = _ref2[1], stroke = _ref2[2], lineWidth = _ref2[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new BarEncoding(positionX1, positionX2, positionY, height, fill, fillColor, fillOpacity, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightColMarks = function (indices, encoders, g) {
        var fill, i, lineWidth, positionX, positionY1, positionY2, stroke, w, width, x, y1, y2, _i, _j, _len, _len1;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        for (_j = 0, _len1 = indices.length; _j < _len1; _j++) {
            i = indices[_j];
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
        var fill, h, height, i, lineWidth, positionX1, positionX2, positionY, stroke, x1, x2, y, _i, _j, _len, _len1;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        for (_j = 0, _len1 = indices.length; _j < _len1; _j++) {
            i = indices[_j];
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
        var i, lineWidth, maskStyle, positionX, positionY1, positionY2, stroke, w, width, x, y1, y2, _i, _len;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var h, height, i, lineWidth, maskStyle, positionX1, positionX2, positionY, stroke, x1, x2, y, _i, _len;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var fill, i, lineWidth, positionX, positionY1, positionY2, stroke, w, width, x, y1, y2, _i, _len;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var fill, h, height, i, lineWidth, positionX1, positionX2, positionY, stroke, x1, x2, y, _i, _len;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height, fill = encoders.fill, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var i, positionX, positionY1, positionY2, selectedIndices, w, width, x, x1, x2, y1, y2, yt, _i, _len;
        positionX = encoders.positionX, positionY1 = encoders.positionY1, positionY2 = encoders.positionY2, width = encoders.width;
        selectedIndices = [];
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var h, height, i, positionX1, positionX2, positionY, selectedIndices, x1, x2, xt, y, y1, y2, _i, _len;
        positionX1 = encoders.positionX1, positionX2 = encoders.positionX2, positionY = encoders.positionY, height = encoders.height;
        selectedIndices = [];
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var height, lineWidth, q0, q1, q2, q3, qn, space, strokeColor, strokeOpacity, structure, width, x, y, _ref, _ref1, _ref2, _ref3;
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
            width = (_ref = expr.width) != null ? _ref : new ConstantWidthChannel(0.8);
            _ref1 = initStroke(expr.strokeColor, expr.strokeOpacity, expr.lineWidth), strokeColor = _ref1[0], strokeOpacity = _ref1[1], lineWidth = _ref1[2];
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
            height = (_ref2 = expr.height) != null ? _ref2 : new ConstantWidthChannel(0.8);
            _ref3 = initStroke(expr.strokeColor, expr.strokeOpacity, expr.lineWidth), strokeColor = _ref3[0], strokeOpacity = _ref3[1], lineWidth = _ref3[2];
            return new SchemaXMark(space, q0, q1, q2, q3, qn, y, height, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
        }
    };
    encodeSchemaXMark = function (frame, mark, axisX, axisY) {
        var height, lineWidth, q0, q1, q2, q3, qn, stroke, strokeColor, strokeOpacity, tooltip, y, _ref;
        q0 = encodePosition(axisX, mark.q0);
        q1 = encodePosition(axisX, mark.q1);
        q2 = encodePosition(axisX, mark.q2);
        q3 = encodePosition(axisX, mark.q3);
        qn = encodePosition(axisX, mark.qn);
        y = encodePosition(axisY, mark.positionY);
        height = encodeSize(frame, mark.height, axisY.rect.height / axisY.domain.length);
        _ref = encodeStroke(frame, mark), strokeColor = _ref[0], strokeOpacity = _ref[1], stroke = _ref[2], lineWidth = _ref[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new SchemaXEncoding(q0, q1, q2, q3, qn, y, height, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightSchemaXMarks = function (indices, encoders, g) {
        var height, i, lineWidth, positionY, q0, q1, q2, q3, qn, stroke, _i, _j, _len, _len1;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
            doSchemaX(g, q0(i), q1(i), q2(i), q3(i), qn(i), positionY(i), height(i), stroke(i), 2 + (stroke ? lineWidth(i) : 1));
        }
        g.restore();
        g.save();
        g.globalCompositeOperation = 'destination-out';
        g.strokeStyle = 'black';
        for (_j = 0, _len1 = indices.length; _j < _len1; _j++) {
            i = indices[_j];
            doSchemaX(g, q0(i), q1(i), q2(i), q3(i), qn(i), positionY(i), height(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    maskSchemaXMarks = function (indices, encoders, g, mask) {
        var h, height, i, lineWidth, maskStyle, positionY, q0, q1, q2, q3, qn, stroke, x1, x2, y, _i, _len;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var height, i, lineWidth, positionY, q0, q1, q2, q3, qn, stroke, _i, _len;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
            doSchemaX(g, q0(i), q1(i), q2(i), q3(i), qn(i), positionY(i), height(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    selectSchemaXMarks = function (indices, encoders, xmin, ymin, xmax, ymax) {
        var h, height, i, lineWidth, positionY, q0, q1, q2, q3, qn, selectedIndices, stroke, x1, x2, xt, y, y1, y2, _i, _len;
        positionY = encoders.positionY, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, height = encoders.height, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        selectedIndices = [];
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var lineWidth, q0, q1, q2, q3, qn, stroke, strokeColor, strokeOpacity, tooltip, width, x, _ref;
        x = encodePosition(axisX, mark.positionX);
        q0 = encodePosition(axisY, mark.q0);
        q1 = encodePosition(axisY, mark.q1);
        q2 = encodePosition(axisY, mark.q2);
        q3 = encodePosition(axisY, mark.q3);
        qn = encodePosition(axisY, mark.qn);
        width = encodeSize(frame, mark.width, axisX.rect.width / axisX.domain.length);
        _ref = encodeStroke(frame, mark), strokeColor = _ref[0], strokeOpacity = _ref[1], stroke = _ref[2], lineWidth = _ref[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new SchemaYEncoding(x, q0, q1, q2, q3, qn, width, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightSchemaYMarks = function (indices, encoders, g) {
        var i, lineWidth, positionX, q0, q1, q2, q3, qn, stroke, width, _i, _j, _len, _len1;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
            doSchemaY(g, positionX(i), q0(i), q1(i), q2(i), q3(i), qn(i), width(i), stroke(i), 2 + (stroke ? lineWidth(i) : 1));
        }
        g.restore();
        g.save();
        g.globalCompositeOperation = 'destination-out';
        g.strokeStyle = 'black';
        for (_j = 0, _len1 = indices.length; _j < _len1; _j++) {
            i = indices[_j];
            doSchemaY(g, positionX(i), q0(i), q1(i), q2(i), q3(i), qn(i), width(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    maskSchemaYMarks = function (indices, encoders, g, mask) {
        var i, lineWidth, maskStyle, positionX, q0, q1, q2, q3, qn, stroke, w, width, x, y1, y2, _i, _len;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var i, lineWidth, positionX, q0, q1, q2, q3, qn, stroke, width, _i, _len;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
            doSchemaY(g, positionX(i), q0(i), q1(i), q2(i), q3(i), qn(i), width(i), stroke(i), lineWidth(i));
        }
        return g.restore();
    };
    selectSchemaYMarks = function (indices, encoders, xmin, ymin, xmax, ymax) {
        var i, lineWidth, positionX, q0, q1, q2, q3, qn, selectedIndices, stroke, w, width, x, x1, x2, y1, y2, yt, _i, _len;
        positionX = encoders.positionX, q0 = encoders.q0, q1 = encoders.q1, q2 = encoders.q2, q3 = encoders.q3, qn = encoders.qn, width = encoders.width, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        selectedIndices = [];
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var lineWidth, positionX, positionY, space, strokeColor, strokeOpacity, _ref;
        positionX = vectors[0], positionY = vectors[1];
        space = new Space2D([positionX], [positionY]);
        _ref = initStroke(expr.strokeColor, expr.strokeOpacity, expr.lineWidth), strokeColor = _ref[0], strokeOpacity = _ref[1], lineWidth = _ref[2];
        return new PathMark(space, positionX, positionY, strokeColor, strokeOpacity, lineWidth, expr.tooltip);
    };
    encodePathMark = function (frame, mark, axisX, axisY) {
        var lineWidth, positionX, positionY, stroke, strokeColor, strokeOpacity, tooltip, _ref;
        positionX = encodePosition(axisX, mark.positionX);
        positionY = encodePosition(axisY, mark.positionY);
        _ref = encodeStroke(frame, mark), strokeColor = _ref[0], strokeOpacity = _ref[1], stroke = _ref[2], lineWidth = _ref[3];
        tooltip = encodeTooltip(frame, mark.tooltip);
        return new PathEncoding(positionX, positionY, stroke, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    highlightPathMarks = function (indices, encoders, g) {
        var i, positionX, positionY, x, y, _i, _len;
        positionX = encoders.positionX, positionY = encoders.positionY;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var i, positionX, positionY, x, y, _i, _len;
        positionX = encoders.positionX, positionY = encoders.positionY;
        g.save();
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            i = indices[_i];
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
        var gradient, i, lineWidth, positionX, positionY, stroke, stroke1, stroke2, x, x1, x2, y, y1, y2, _i, _inPath, _j, _len, _len1;
        positionX = encoders.positionX, positionY = encoders.positionY, stroke = encoders.stroke, lineWidth = encoders.lineWidth;
        if (stroke instanceof ConstantEncoder && lineWidth instanceof ConstantEncoder) {
            g.strokeStyle = stroke();
            g.lineWidth = lineWidth();
            g.save();
            _inPath = false;
            for (_i = 0, _len = indices.length; _i < _len; _i++) {
                i = indices[_i];
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
            for (_j = 0, _len1 = indices.length; _j < _len1; _j++) {
                i = indices[_j];
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
    PointGeometry = new Geometry(encodePointMark, maskPointMarks, highlightPointMarks, renderPointMarks, selectMarks);
    PathGeometry = new Geometry(encodePathMark, maskPathMarks, highlightPathMarks, renderPathMarks, selectMarks);
    ColGeometry = new Geometry(encodeColMark, maskColMarks, highlightColMarks, renderColMarks, selectColMarks);
    BarGeometry = new Geometry(encodeBarMark, maskBarMarks, highlightBarMarks, renderBarMarks, selectBarMarks);
    SchemaXGeometry = new Geometry(encodeSchemaXMark, maskSchemaXMarks, highlightSchemaXMarks, renderSchemaXMarks, selectSchemaXMarks);
    SchemaYGeometry = new Geometry(encodeSchemaYMark, maskSchemaYMarks, highlightSchemaYMarks, renderSchemaYMarks, selectSchemaYMarks);
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
    plot_domain = function () {
        var values;
        values = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    };
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
            var p, q, r, _ref;
            _ref = _.sortBy([
                a,
                b,
                c
            ], _.identity), p = _ref[0], q = _ref[1], r = _ref[2];
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
        var arg, type, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = args.length; _i < _len; _i++) {
            arg = args[_i];
            if (arg instanceof Field) {
                _results.push(arg);
            } else if (TString === (type = typeOf(arg))) {
                _results.push(new Field(arg));
            } else {
                throw new Error('Cannot create vector reference from [' + arg + '] of type [' + type + '].');
            }
        }
        return _results;
    };
    plot_position = function () {
        var args, field;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        return new PositionChannel(function () {
            var _i, _len, _ref, _results;
            _ref = collectFields(args);
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                field = _ref[_i];
                _results.push(new CoordChannel(field));
            }
            return _results;
        }());
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
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        return new VariableTooltipChannel(collectFields(args));
    };
    plot_table = function () {
        var args;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        return new TableExpr(collectFields(args));
    };
    plot_record = function (index) {
        if (index == null) {
            index = 0;
        }
        return new RecordExpr(index);
    };
    configureSchema = function (schema) {
        var label, obj, _results;
        _results = [];
        for (label in schema) {
            obj = schema[label];
            if (_.isString(obj)) {
                switch (obj) {
                case 'string':
                    _results.push({
                        label: label,
                        type: 'String',
                        domain: [],
                        parse: asString
                    });
                    break;
                case 'int':
                    _results.push({
                        label: label,
                        type: 'Number',
                        parse: asInt
                    });
                    break;
                case 'real':
                    _results.push({
                        label: label,
                        type: 'Number',
                        parse: asReal
                    });
                    break;
                default:
                    throw new Error('Invalid type ' + obj + ' for schema field ' + label);
                }
            } else if (_.isArray(obj)) {
                _results.push({
                    label: label,
                    type: 'String',
                    domain: obj,
                    parse: asString
                });
            } else {
                throw new Error('Invalid type ' + obj + ' for schema field ' + label);
            }
        }
        return _results;
    };
    readCsvAsFrame = function (label, columns, data, hasHeader) {
        var column, index, offset, result, row, rows, value, vectors;
        result = Papa.parse(data, { skipEmptyLines: true });
        rows = result.data;
        console.debug(rows);
        if (hasHeader) {
            rows.shift();
        }
        vectors = function () {
            var _i, _j, _len, _len1, _results;
            _results = [];
            for (offset = _i = 0, _len = columns.length; _i < _len; offset = ++_i) {
                column = columns[offset];
                data = new Array(rows.length);
                for (index = _j = 0, _len1 = rows.length; _j < _len1; index = ++_j) {
                    row = rows[index];
                    if (void 0 !== (value = column.parse(row[offset]))) {
                        data[index] = value;
                    }
                }
                switch (column.type) {
                case 'String':
                    _results.push(plot.createFactor(column.label, column.type, data, column.domain));
                    break;
                case 'Number':
                    _results.push(plot.createVector(column.label, column.type, data, _.identity));
                    break;
                default:
                    _results.push(void 0);
                }
            }
            return _results;
        }();
        return createFrame(label, vectors, _.range(rows.length));
    };
    plot_remote = function (url) {
        return function (go) {
            return download('json', url + '.json', function (error, descriptor) {
                if (error) {
                    return go(error);
                } else {
                    switch (descriptor.format) {
                    case 'csv':
                        return download('text', descriptor.location, function (error, data) {
                            if (error) {
                                return go(error);
                            } else {
                                try {
                                    return go(null, readCsvAsFrame(descriptor.name, configureSchema(descriptor.schema), data, descriptor.header ? true : false));
                                } catch (_error) {
                                    error = _error;
                                    return go(error);
                                }
                            }
                        });
                    default:
                        return go(new Error('Unsupported format [' + descriptor.format + ']'));
                    }
                }
            });
        };
    };
    plot_point = function () {
        var fillColor, fillOpacity, lineWidth, ops, position, shape, size, strokeColor, strokeOpacity, tooltip;
        ops = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        position = findByType(ops, PositionChannel);
        shape = findByType(ops, ShapeChannel);
        size = findByType(ops, SizeChannel);
        fillColor = findByType(ops, FillColorChannel);
        fillOpacity = findByType(ops, FillOpacityChannel);
        strokeColor = findByType(ops, StrokeColorChannel);
        strokeOpacity = findByType(ops, StrokeOpacityChannel);
        lineWidth = findByType(ops, LineWidthChannel);
        tooltip = findByType(ops, TooltipChannel);
        return new PointExpr(position, shape, size, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    plot_rect = function () {
        var fillColor, fillOpacity, height, lineWidth, ops, position, strokeColor, strokeOpacity, tooltip, width;
        ops = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        position = findByType(ops, PositionChannel);
        width = findByType(ops, WidthChannel);
        height = findByType(ops, HeightChannel);
        fillColor = findByType(ops, FillColorChannel);
        fillOpacity = findByType(ops, FillOpacityChannel);
        strokeColor = findByType(ops, StrokeColorChannel);
        strokeOpacity = findByType(ops, StrokeOpacityChannel);
        lineWidth = findByType(ops, LineWidthChannel);
        tooltip = findByType(ops, TooltipChannel);
        return new RectExpr(position, width, height, fillColor, fillOpacity, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    plot_path = function () {
        var lineWidth, ops, position, strokeColor, strokeOpacity, tooltip;
        ops = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        position = findByType(ops, PositionChannel);
        strokeColor = findByType(ops, StrokeColorChannel);
        strokeOpacity = findByType(ops, StrokeOpacityChannel);
        lineWidth = findByType(ops, LineWidthChannel);
        tooltip = findByType(ops, TooltipChannel);
        return new PathExpr(position, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    plot_schema = function () {
        var height, lineWidth, ops, position, strokeColor, strokeOpacity, tooltip, width;
        ops = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        position = findByType(ops, PositionChannel);
        width = findByType(ops, WidthChannel);
        height = findByType(ops, HeightChannel);
        strokeColor = findByType(ops, StrokeColorChannel);
        strokeOpacity = findByType(ops, StrokeOpacityChannel);
        lineWidth = findByType(ops, LineWidthChannel);
        tooltip = findByType(ops, TooltipChannel);
        return new SchemaExpr(position, width, height, strokeColor, strokeOpacity, lineWidth, tooltip);
    };
    plot_parse = function (esprima, escodegen) {
        var traverse;
        traverse = function (node, f) {
            var child, i, _results, _results1;
            if (_.isArray(node)) {
                i = node.length;
                _results = [];
                while (i--) {
                    child = node[i];
                    if (child !== null && _.isObject(child)) {
                        traverse(child, f);
                        _results.push(f(child));
                    } else {
                        _results.push(void 0);
                    }
                }
                return _results;
            } else {
                _results1 = [];
                for (i in node) {
                    if (!__hasProp.call(node, i))
                        continue;
                    child = node[i];
                    if (child !== null && _.isObject(child)) {
                        traverse(child, f);
                        _results1.push(f(child));
                    } else {
                        _results1.push(void 0);
                    }
                }
                return _results1;
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
    plot_defaults = {
        maxCanvasSize: new Size(795, 600),
        visualizationSize: new Size(300, 300),
        axisLabelFont: '10px monospace',
        axisTickColor: '#4d4d4d',
        axisTitleFont: 'bold 10px monospace',
        axisLabelColor: '#4d4d4d',
        gridLineColor: '#eee'
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
        var el, headEl, lines, property, selector, sheet, style, value;
        sheet = function () {
            var _results;
            _results = [];
            for (selector in styles) {
                style = styles[selector];
                lines = function () {
                    var _results1;
                    _results1 = [];
                    for (property in style) {
                        value = style[property];
                        _results1.push(property + ':' + value);
                    }
                    return _results1;
                }();
                _results.push(selector + '{' + lines.join(';') + ';}');
            }
            return _results;
        }();
        el = document.createElement('style');
        el.type = 'text/css';
        el.innerHTML = sheet.join('\n');
        headEl = _.head(document.getElementsByTagName('head'));
        headEl.appendChild(el);
    };
    createTooltipTable = function (dict) {
        var label, table, tbody, td, th, tr, value;
        table = document.createElement('table');
        table.appendChild(tbody = document.createElement('tbody'));
        for (label in dict) {
            value = dict[label];
            tbody.appendChild(tr = document.createElement('tr'));
            tr.appendChild(td = document.createElement('td'));
            td.appendChild(document.createTextNode(label + ':'));
            tr.appendChild(th = document.createElement('th'));
            th.appendChild(document.createTextNode(value));
        }
        return table;
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
        var baseCanvas, clip, clipCanvas, container, highlightCanvas, hoverCanvas, i, marquee, mask, maskCanvas, tooltip, _ref;
        _ref = function () {
            var _i, _results;
            _results = [];
            for (i = _i = 1; _i <= 5; i = ++_i) {
                _results.push(createCanvas(box));
            }
            return _results;
        }(), baseCanvas = _ref[0], highlightCanvas = _ref[1], hoverCanvas = _ref[2], maskCanvas = _ref[3], clipCanvas = _ref[4];
        container = createDOMElement('div', {
            position: 'relative',
            overflow: 'visible',
            width: px(box.width),
            height: px(box.height)
        });
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
        tooltip.className = 'lightning-tooltip';
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
        var rect, target, _ref;
        target = (_ref = e.target) != null ? _ref : e.srcElement;
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
            var _ref;
            x = e.offsetX, y = e.offsetY;
            if (!(x !== void 0 && y !== void 0)) {
                _ref = getFFMouseCoords(e), x = _ref[0], y = _ref[1];
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
            var _ref;
            e.preventDefault();
            x1 = e.offsetX, y1 = e.offsetY;
            if (!(x1 !== void 0 && y1 !== void 0)) {
                _ref = getFFMouseCoords(e), x1 = _ref[0], y1 = _ref[1];
            }
            isDragging = true;
            marquee.display = 'block';
            marquee.left = px(x1);
            marquee.top = px(y1);
            return $document.on('mouseup', function (e) {
                var _ref1;
                e.preventDefault();
                x2 = e.offsetX, y2 = e.offsetY;
                if (!(x2 !== void 0 && y2 !== void 0)) {
                    _ref1 = getFFMouseCoords(e), x2 = _ref1[0], y2 = _ref1[1];
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
        var subscribe, unsubscribe, _subscribersByEvent;
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
            var i, subscriber, subscribers, _i, _len;
            if (_event) {
                if (_subscriber) {
                    subscribers = _subscribersByEvent[_event];
                    if (subscribers) {
                        for (i = _i = 0, _len = subscribers.length; _i < _len; i = ++_i) {
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
        dispatch = function () {
            var args, event, subscriber, subscribers, _i, _len;
            event = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
            if (subscribers = _subscribersByEvent[event]) {
                for (_i = 0, _len = subscribers.length; _i < _len; _i++) {
                    subscriber = subscribers[_i];
                    subscriber.apply(null, args);
                }
            }
        };
        return [
            subscribe,
            unsubscribe,
            dispatch
        ];
    };
    createVisualization = function (_box, _frame, _layers, _axisX, _axisY, _dispatch) {
        var baseCanvas, clip, clipCanvas, displayTooltip, hideTooltip, highlight, highlightCanvas, hover, hoverCanvas, marquee, mask, maskCanvas, moveTooltip, render, selectAt, selectWithin, test, tooltip, visRect, _index, _indices, _tooltipOffset, _viewport;
        _viewport = createViewport(_box);
        baseCanvas = _viewport.baseCanvas, highlightCanvas = _viewport.highlightCanvas, hoverCanvas = _viewport.hoverCanvas, clipCanvas = _viewport.clipCanvas, maskCanvas = _viewport.maskCanvas, marquee = _viewport.marquee, tooltip = _viewport.tooltip, mask = _viewport.mask, clip = _viewport.clip;
        visRect = _box.regions.center;
        _indices = _frame.indices;
        _index = void 0;
        test = function (x, y) {
            var clipContext, i, layer, _i, _len;
            i = mask.test(x, y);
            if (i !== void 0) {
                clipContext = clipCanvas.context;
                clipContext.clearRect(0, 0, _box.width, _box.height);
                for (_i = 0, _len = _layers.length; _i < _len; _i++) {
                    layer = _layers[_i];
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
            var aes, encoding, hoverContext, i, layer, tooltipData, vector, _i, _j, _k, _len, _len1, _len2, _ref, _ref1;
            i = test(x, y);
            if (i !== _index) {
                _index = i;
                hoverContext = hoverCanvas.context;
                hoverContext.clearRect(0, 0, _box.width, _box.height);
                hideTooltip();
                if (i !== void 0) {
                    hoverContext.save();
                    hoverContext.translate(visRect.left, visRect.top);
                    for (_i = 0, _len = _layers.length; _i < _len; _i++) {
                        layer = _layers[_i];
                        layer.highlight([i], layer.encoders, hoverContext);
                    }
                    hoverContext.restore();
                    _dispatch('hover', new HoverEventArg(_frame.vectors, i));
                    tooltipData = {};
                    for (_j = 0, _len1 = _layers.length; _j < _len1; _j++) {
                        layer = _layers[_j];
                        _ref = layer.encodings;
                        for (aes in _ref) {
                            encoding = _ref[aes];
                            if (encoding) {
                                if (encoding instanceof VariableEncoder) {
                                    if (vector = encoding.vector) {
                                        tooltipData[vector.label] = vector.format(i);
                                    }
                                } else if (encoding instanceof TooltipEncoder) {
                                    _ref1 = encoding.vectors;
                                    for (_k = 0, _len2 = _ref1.length; _k < _len2; _k++) {
                                        vector = _ref1[_k];
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
            var highlightContext, layer, _i, _len;
            highlightContext = highlightCanvas.context;
            highlightContext.clearRect(0, 0, _box.width, _box.height);
            if (indices.length) {
                baseCanvas.element.style.opacity = 0.5;
                highlightContext.save();
                highlightContext.translate(visRect.left, visRect.top);
                for (_i = 0, _len = _layers.length; _i < _len; _i++) {
                    layer = _layers[_i];
                    layer.highlight(indices, layer.encoders, highlightContext);
                    layer.render(indices, layer.encoders, highlightContext);
                }
                highlightContext.restore();
            } else {
                baseCanvas.element.style.opacity = 1;
            }
        };
        selectAt = function (x, y) {
            var i;
            i = test(x, y);
            if (i !== void 0) {
                highlight([i]);
                _dispatch('select', new SelectEventArg(_frame.vectors, [i]));
            } else {
                highlight([]);
                _dispatch('deselect', new DeselectEventArg(_frame.vectors));
            }
        };
        selectWithin = function (x1, y1, x2, y2) {
            var layer, selectedIndices, xmax, xmin, ymax, ymin, _i, _len;
            xmin = -visRect.left + (x1 > x2 ? x2 : x1);
            xmax = -visRect.left + (x1 > x2 ? x1 : x2);
            ymin = -visRect.top + (y1 > y2 ? y2 : y1);
            ymax = -visRect.top + (y1 > y2 ? y1 : y2);
            for (_i = 0, _len = _layers.length; _i < _len; _i++) {
                layer = _layers[_i];
                selectedIndices = layer.select(_indices, layer.encoders, xmin, ymin, xmax, ymax);
                highlight(selectedIndices);
                if (selectedIndices.length) {
                    _dispatch('select', new SelectEventArg(_frame.vectors, selectedIndices));
                } else {
                    _dispatch('deselect', new DeselectEventArg(_frame.vectors));
                }
            }
        };
        render = function () {
            var baseContext, layer, maskContext, _i, _len;
            baseContext = baseCanvas.context;
            maskContext = maskCanvas.context;
            renderGridlinesX(baseContext, _axisX, visRect);
            renderGridlinesY(baseContext, _axisY, visRect);
            baseContext.save();
            baseContext.translate(visRect.left, visRect.top);
            maskContext.save();
            maskContext.translate(visRect.left, visRect.top);
            for (_i = 0, _len = _layers.length; _i < _len; _i++) {
                layer = _layers[_i];
                layer.render(_indices, layer.encoders, baseContext);
                layer.mask(_indices, layer.encoders, maskContext, mask);
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
        var category, label, labelAnchor, labelPosition, maxLabelSize, maxPosition, minPosition, position, tick, tickPosition, tickStart, titleHeight, _i, _j, _len, _len1, _ref, _ref1;
        g.font = plot_defaults.axisLabelFont;
        g.fillStyle = plot_defaults.axisLabelColor;
        g.strokeStyle = plot_defaults.axisTickColor;
        g.textBaseline = 'middle';
        titleHeight = __emWidth + 4;
        maxLabelSize = width - titleHeight;
        g.save();
        clipRect(g, titleHeight, 0, maxLabelSize, height);
        g.textAlign = 'right';
        tickStart = width - 5;
        labelAnchor = width - 6;
        if (axis instanceof CategoricalAxis) {
            _ref = axis.guide();
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                category = _ref[_i];
                label = category.value;
                position = axis.scale(category);
                tickPosition = -0.5 + Math.round(position);
                doLine(g, tickStart, tickPosition, width, tickPosition);
                g.fillText(label, labelAnchor, position, maxLabelSize - 6);
            }
            doLine(g, width - 0.5, 0, width - 0.5, height);
        } else if (axis instanceof LinearAxis) {
            minPosition = 6;
            maxPosition = height - 6;
            _ref1 = axis.guide();
            for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
                tick = _ref1[_j];
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
        g.font = plot_defaults.axisTitleFont;
        g.textAlign = 'center';
        g.translate(titleHeight / 2, height / 2);
        g.rotate(orientation * Halfπ);
        g.fillText(axis.label, 0, 0, height);
        return g.restore();
    };
    renderGridlines = function (g, axis, width, height) {
        var tick, tickPosition, _i, _len, _ref;
        g.strokeStyle = plot_defaults.gridLineColor;
        if (axis instanceof CategoricalAxis) {
            doLine(g, 0, 0.5, width, 0.5);
            doLine(g, 0, height - 0.5, width, height - 0.5);
        } else if (axis instanceof LinearAxis) {
            _ref = axis.guide();
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                tick = _ref[_i];
                tickPosition = Math.max(0.5, -0.5 + Math.round(axis.scale(tick.value)));
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
    compileHtmlTemplate = function (template, type) {
        var attrs, beginTag, classes, closeTag, id, index, name, tmpl, _ref;
        if (0 <= (index = template.indexOf(' '))) {
            tmpl = template.substr(0, index);
            attrs = template.substr(index);
        } else {
            tmpl = template;
        }
        _ref = tmpl.split(/\.+/g), name = _ref[0], classes = 2 <= _ref.length ? __slice.call(_ref, 1) : [];
        if (0 === name.indexOf('#')) {
            id = name.substr(1);
            name = 'div';
        }
        if (name === '') {
            name = 'div';
        }
        beginTag = '<' + name;
        if (id) {
            beginTag += ' id=\'' + id + '\'';
        }
        if (classes.length) {
            beginTag += ' class=\'' + classes.join(' ') + '\'';
        }
        if (attrs) {
            beginTag += attrs;
        }
        beginTag += '>';
        closeTag = '</' + name + '>';
        if (type === '=') {
            return function (content) {
                return beginTag + (content !== null && content !== void 0 ? content : '') + closeTag;
            };
        } else if (type === '+') {
            return function (content, arg0) {
                var tag;
                tag = beginTag.replace('{0}', arg0);
                return tag + content + closeTag;
            };
        } else {
            return function (contents) {
                return beginTag + contents.join('') + closeTag;
            };
        }
    };
    _htmlTemplateCache = {};
    createHtmlTemplates = function () {
        var cached, template, templates, type, _i, _len, _results;
        templates = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        _results = [];
        for (_i = 0, _len = templates.length; _i < _len; _i++) {
            template = templates[_i];
            if (cached = _htmlTemplateCache[template]) {
                _results.push(cached);
            } else {
                type = template.charAt(0);
                if (type === '=' || type === '+') {
                    _results.push(_htmlTemplateCache[template] = compileHtmlTemplate(template.substr(1), type));
                } else {
                    _results.push(_htmlTemplateCache[template] = compileHtmlTemplate(template));
                }
            }
        }
        return _results;
    };
    renderHtml = function (htmlString) {
        var el;
        el = document.createElement('div');
        el.innerHTML = htmlString;
        return el.childNodes[0];
    };
    filterFactorDomain = function (factor, indices) {
        var category, dict, domain, index, key, _i, _len;
        dict = {};
        domain = [];
        for (_i = 0, _len = indices.length; _i < _len; _i++) {
            index = indices[_i];
            key = (category = factor.at(index)).key;
            if (!dict[key]) {
                dict[key] = true;
                domain.push(category);
            }
        }
        return domain;
    };
    createSpace1D = function (vectors, indices) {
        var domain, type, vector, _i, _len, _vector;
        type = null;
        domain = null;
        _vector = null;
        for (_i = 0, _len = vectors.length; _i < _len; _i++) {
            vector = vectors[_i];
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
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = vectors.length; _i < _len; _i++) {
                vector = vectors[_i];
                _results.push(vector.label);
            }
            return _results;
        }();
        return _.unique(labels).join(', ');
    };
    computeApproxAxisSize = function (type, domain) {
        var axis, categories, category, length, longest, padding, rect, tick, _i, _j, _len, _len1, _ref;
        rect = new Rect(0, 0, 400, 400);
        axis = createAxis(type, '', domain, new SequentialRange(0, rect.width), rect);
        padding = __emWidth + 4 + 6 + 10;
        if (axis instanceof CategoricalAxis) {
            longest = 0;
            categories = axis.guide();
            for (_i = 0, _len = categories.length; _i < _len; _i++) {
                category = categories[_i];
                if (longest < (length = ('' + category.value).length)) {
                    longest = length;
                }
            }
            return new Bounds(Math.ceil(longest * __emWidth + padding), Math.ceil(categories.length * (__emWidth + 8)));
        } else if (axis instanceof LinearAxis) {
            longest = 0;
            categories = axis.guide();
            _ref = axis.guide();
            for (_j = 0, _len1 = _ref.length; _j < _len1; _j++) {
                tick = _ref[_j];
                if (longest < (length = tick.label.length)) {
                    longest = length;
                }
            }
            return new Bounds(Math.ceil(longest * __emWidth + padding), plot_defaults.visualizationSize.height);
        } else {
            throw new Error('Invalid axis type.');
        }
    };
    createAxis = function (type, label, domain, range, rect) {
        var guide, scale, tickFormat, ticks, _ref;
        switch (type) {
        case TString:
            scale = createOrdinalScale(domain, range);
            guide = function () {
                return domain;
            };
            return new CategoricalAxis(type, label, scale, domain, range, rect, guide);
        case TNumber:
            _ref = createNicedSequentialLinearScale(domain, range), scale = _ref[0], tickFormat = _ref[1], ticks = _ref[2];
            guide = function (count) {
                var format, value, _i, _len, _ref1, _results;
                if (count == null) {
                    count = 10;
                }
                format = tickFormat(count);
                _ref1 = ticks(count);
                _results = [];
                for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
                    value = _ref1[_i];
                    _results.push(new Tick(value, format(value)));
                }
                return _results;
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
        if (findByType(ops, TableExpr)) {
            return renderTable(frame, ops);
        } else if (findByType(ops, RecordExpr)) {
            return renderRecord(frame, ops);
        } else {
            return renderPlot(frame, ops);
        }
    };
    renderRecord = function (frame, ops) {
        var element, escapedValue, index, name, recordExpr, subscribe, table, tbody, td, th, tr, trs, unsubscribe, value, vector, _ref;
        recordExpr = findByType(ops, RecordExpr);
        index = recordExpr.index;
        _ref = createHtmlTemplates('=table.lightning-record', 'tbody', 'tr', '=th', '=td'), table = _ref[0], tbody = _ref[1], tr = _ref[2], th = _ref[3], td = _ref[4];
        trs = function () {
            var _ref1, _results;
            _ref1 = frame.schema;
            _results = [];
            for (name in _ref1) {
                vector = _ref1[name];
                value = vector.format(index);
                escapedValue = function () {
                    switch (vector.type) {
                    case TString:
                        if (value !== void 0) {
                            return _.escape(value);
                        } else {
                            return '-';
                        }
                        break;
                    case TNumber:
                        if (value !== void 0) {
                            return _.escape(value);
                        } else {
                            return '-';
                        }
                        break;
                    case TObject:
                        if (value !== void 0) {
                            return value;
                        } else {
                            return '-';
                        }
                        break;
                    default:
                        throw new Error('Cannot render table cell of type ' + vector.type);
                    }
                }();
                _results.push(tr([
                    th(_.escape(vector.label)),
                    td(escapedValue)
                ]));
            }
            return _results;
        }();
        element = renderHtml(table(tbody(trs)));
        subscribe = _.noop;
        unsubscribe = _.noop;
        return new Plot(element, subscribe, unsubscribe);
    };
    renderTable = function (frame, ops) {
        var element, field, i, subscribe, table, tableExpr, tbody, td, tdr, tds, th, thead, thr, ths, tr, trs, unsubscribe, value, vector, vectorGroups, vectors, _ref;
        tableExpr = findByType(ops, TableExpr);
        vectorGroups = function () {
            var _i, _len, _ref, _results;
            if (tableExpr.fields.length) {
                _ref = tableExpr.fields;
                _results = [];
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    field = _ref[_i];
                    _results.push(frame.evaluate(field));
                }
                return _results;
            } else {
                return frame.vectors;
            }
        }();
        vectors = _.flatten(vectorGroups);
        _ref = createHtmlTemplates('table.lightning-table', '=thead', 'tbody', 'tr', '=th', '=th.lightning-number', '=td', '=td.lightning-number'), table = _ref[0], thead = _ref[1], tbody = _ref[2], tr = _ref[3], th = _ref[4], thr = _ref[5], td = _ref[6], tdr = _ref[7];
        ths = function () {
            var _i, _len, _results;
            _results = [];
            for (_i = 0, _len = vectors.length; _i < _len; _i++) {
                vector = vectors[_i];
                switch (vector.type) {
                case TNumber:
                    _results.push(thr(_.escape(vector.label)));
                    break;
                default:
                    _results.push(th(_.escape(vector.label)));
                }
            }
            return _results;
        }();
        trs = function () {
            var _i, _len, _ref1, _results;
            _ref1 = frame.indices;
            _results = [];
            for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
                i = _ref1[_i];
                tds = function () {
                    var _j, _len1, _results1;
                    _results1 = [];
                    for (_j = 0, _len1 = vectors.length; _j < _len1; _j++) {
                        vector = vectors[_j];
                        value = vector.format(i);
                        switch (vector.type) {
                        case TString:
                            _results1.push(td(value !== void 0 ? _.escape(value) : '-'));
                            break;
                        case TNumber:
                            _results1.push(tdr(value !== void 0 ? _.escape(value) : '-'));
                            break;
                        case TObject:
                            _results1.push(td(value !== void 0 ? value : '-'));
                            break;
                        default:
                            throw new Error('Cannot render table cell of type ' + vector.type);
                        }
                    }
                    return _results1;
                }();
                _results.push(tr(tds));
            }
            return _results;
        }();
        element = renderHtml(table([
            thead(tr(ths)),
            tbody(trs)
        ]));
        subscribe = _.noop;
        unsubscribe = _.noop;
        return new Plot(element, subscribe, unsubscribe);
    };
    computeAxisDomain = function (self, other) {
        if (self.type === TNumber) {
            if (other.type === TString) {
                return includeOrigin0(self.domain);
            } else {
                return self.domain;
            }
        } else {
            return self.domain;
        }
    };
    renderPlot = function (frame, ops) {
        var axisBoundsX, axisBoundsY, axisRectX, axisRectY, axisX, axisY, bounds, box, domainX, domainY, layers, marks, rangeX, rangeY, spaceX, spaceY, spaces, subscribe, unsubscribe, vectorsX, vectorsY, visualization, _ref, _ref1;
        marks = _.map(filterByType(ops, MarkExpr), function (expr) {
            var coord, positionVectors;
            positionVectors = function () {
                var _i, _len, _ref, _results;
                _ref = expr.position.coordinates;
                _results = [];
                for (_i = 0, _len = _ref.length; _i < _len; _i++) {
                    coord = _ref[_i];
                    _results.push(frame.evaluate(coord.field));
                }
                return _results;
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
        domainX = computeAxisDomain(spaceX, spaceY);
        domainY = computeAxisDomain(spaceY, spaceX);
        axisBoundsX = computeApproxAxisSize(spaceX.type, domainX);
        axisBoundsY = computeApproxAxisSize(spaceY.type, domainY);
        bounds = (_ref = findByType(ops, Bounds)) != null ? _ref : new Bounds(Math.min(plot_defaults.maxCanvasSize.width, axisBoundsY.width + axisBoundsX.height), Math.min(plot_defaults.maxCanvasSize.height, axisBoundsX.width + axisBoundsY.height));
        box = new Box(bounds.width, bounds.height, new Margin(Math.min(0.3 * plot_defaults.maxCanvasSize.width, axisBoundsY.width), 0, 0, Math.min(0.3 * plot_defaults.maxCanvasSize.height, axisBoundsX.width)));
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
        _ref1 = createEventDispatcher(), subscribe = _ref1[0], unsubscribe = _ref1[1], dispatch = _ref1[2];
        visualization = createVisualization(box, frame, layers, axisX, axisY, dispatch);
        visualization.render();
        return new Plot(visualization.viewport.container, subscribe, unsubscribe);
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
            } catch (_error) {
                error = _error;
                return go(error);
            }
        }
    ]);
    initializeStylesheet = function () {
        return createStylesheet({
            '.lightning-tooltip': {
                background: '#2c2c2c',
                color: '#fff',
                'font-size': '12px'
            },
            '.lightning-tooltip th, .lightning-tooltip td': {
                padding: '0px 4px',
                'vertical-align': 'middle'
            },
            '.lightning-tooltip th': { 'text-align': 'left' },
            '.lightning-table th, .lightning-table td': {
                padding: '0px 8px',
                'vertical-align': 'middle'
            },
            '.lightning-table tbody > tr:nth-child(odd)': { 'background-color': '#f3f3f3' },
            '.lightning-table .lightning-number': { 'text-align': 'right' },
            '.lightning-record th, .lightning-record td': {
                padding: '0px 8px',
                'vertical-align': 'middle'
            },
            '.lightning-record th': { 'text-align': 'right' },
            '.lightning-record tbody > tr:nth-child(odd)': { 'background-color': '#f3f3f3' }
        });
    };
    __scratchCanvas = null;
    __emWidth = 18;
    initializeScratchCanvas = function () {
        var canvas, g;
        __scratchCanvas = canvas = createCanvas(new Bounds(100, 100));
        g = canvas.context;
        g.font = plot_defaults.axisLabelFont;
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
        ops = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        if (datasource = findByType(ops, Datasource, Frame)) {
            initializeLib();
            return function (go) {
                return visualize(datasource, _.without(ops, datasource), go);
            };
        } else {
            return function () {
                var more;
                more = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
                return plot.apply(null, ops.concat(more));
            };
        }
    };
    plot.VERSION = '999.999.999';
    plot.from = plot_from;
    plot.value = plot_value;
    plot.domain = plot_domain;
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
    plot.select = plot_select;
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
    plot.table = plot_table;
    plot.record = plot_record;
    plot.remote = plot_remote;
    plot.createFrame = createFrame;
    plot.createVector = createVector;
    plot.createList = createList;
    plot.createFactor = createFactor;
    if ((typeof module !== 'undefined' && module !== null ? module.exports : void 0) != null) {
        module.exports = plot;
    } else {
        window.plot = plot;
    }
}.call(this));