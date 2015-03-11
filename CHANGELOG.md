# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased][unreleased]

## [0.1.13 - 2015-03-10]
### Fixed
- Fix categorical axis label rendering when adequate space is available

## [0.1.12] - 2015-03-10
### Fixed
- Occlusion handling for categorical axis labels

## [0.1.11] - 2015-03-09
### Added
- Implement line annotations
- Allow setting rendering defaults during lib init
- Allow (auto, auto) when specifying vis bounds
- Render origin line for linear axes
- Special vectors for handling computed data

### Changed
- Make dist/* files only on -m
- Rename table --> select for parity with sql
- Inline default stylesheet; with shorter prefix
- Accept element instead of element-id in plot()(...) call
- Switch to tabular data package for CSV data http://dataprotocols.org/tabular-data-package/
- Reorganize sample data directories
- Switch to diecut for HTML templating

### Fixed
- Fix event notification / dispatching
- Respect linewidth when rendering annotation
- Improve docs styles

## [0.1.10] - 2015-02-25
### Added
- Add bounds() clause to specify custom width/height for plots

## [0.1.9] - 2015-02-25
### Added
- Concat referenced libs into a single file (for deployment)

### Changed
- Switch CSV parser; support CSV files with headers

## [0.1.8] - 2015-02-24
### Added
- Add DL performance metrics example for custom tooltips
- Add tooltip attribute to all geoms
- Implement FROM REMOTE [URL] with CSV support
- Add metadata for msleep example; add example for path with missing values

### Changed
- Reconfigure data descriptors to new format HEXDEV-169

### Removed
- Remove demo wrapper script and build step HEXDEV-169

### Fixed
- Improve tooltip sizing and positioning

## [0.1.7] - 2015-02-11
### Fixed
- Apply filtered indices to factors before using on axes

## [0.1.6] - 2015-02-06
### Added
- Add LIMIT(offset, length) clause

## [0.1.5] - 2015-02-06
### Added
- Implement 'group by all'

## [0.1.4] - 2015-02-05
### Added
- Implement stacking with custom depths
- Make stacked vectors display original value when format() is called

### Changed
- Refactor frame.evaluate() to handle tuples while evaluating computed fields

## [0.1.3] - 2015-02-04
### Added
- Add single-record rendering in tabular format

## [0.1.2] - 2015-02-04
### Fixed
- Fixes for coffeescript 1.9.0 compatibility

## [0.1.1] - 2015-02-03
### Added
- Add compiled / minified dist files
- Add explicit list types to handle blobs
- Support metadata attrs on frames
- Implement text-table rendering.

### Changed
- Render raw data unescaped

### Removed
- Disable copying debug version during build

### Fixed
- Allow tooltips to bleed out of vis viewport

## [0.1.0] - 2015-01-22
### Added
- Add release script and lib version placeholder
- Include dist/ in git
- Fix uglify warnings
- Integrate uglify-js
- Add event dispatching for hover, select, deselect
- Tone down tick/label contrast
- Invert tooltip colors
- Cap max canvas size
- Lay out categorical y-axes ticks top-to-bottom
- Add additional border rule for categorical axes
- Auto-compute canvas size based on content
- Add a border rule for categorical axes
- Implement gridlines
- Auto-size axes based on content
- Fix FF bug causing hit testing failures
- Prevent axis tick anti-aliasing
- Implement axis titles
- Implement axis rendering.
- Implement margins
- Implement tooltips
- Implement schema-x marks
- Implement schema-y marks
- Add dataset for schema mark
- Fix memoization bug causing having() to fail.
- Simplify encoding-passing
- Fix path rendering failures
- Break apart specs (exprs) from marks
- Implement horizontal bar encoding, rendering, selection
- Dedupe mark encoding routines
- Dedupe mark initialization routines
- Rename rect() to bar()
- Implement rect mark marquee selection
- Adapt point/path geoms to new axis model
- Default bar widths to 80%
- Rect marks - work in progress.
- Categorical axes, rect marks - work in progress.
- Refactor var names
- Implement path geom
- Better error messages
- Rename vector operations
- Re-org source into conceptual sections
- Add code doc generation
- Update npm packages
- Group query ops into a Query
- Refactor var names
- Cache computed aggregates
- Implement HAVING clause
- Add query operators, filtering, cube/rollup operations
- Fix expression parser to handle function references
- Implement dispatching on typed arrays
- Add tests for dispatching on typed arrays
- Add schema for imdb dataset
- Group geom-specific routines into Geometry
- Rename geom -> mark
- Add example for layering multiple point geoms
- Handle multiple layers in vis routines
- House geometry routines and encodings into layers
- Make factor() create sparse arrays
- Remove raw data from vectors and factors
- Switch to sparse arrays: default missing values in vectors to undefined
- Refactor frame.indices
- Rename a few data types.
- "Variable~" for attributes that vary.
- "Constant~" for attributes that don't.
- "Vector" for 1d arrays.
- Rename geom routines
- Implement variable fill/stroke color for factors
- Add example for variable stroke color
- Implement variable fill/stroke color
- Implement variable opacity encoding
- Add http-server to browse documentation
- Implement variable line-width encoding
- Implement variable size encoding
- Fix custom ranges for shape encoding
- Change category.name to category.value
- Implement in-place R-style factor()
- Switch to column-major storage; store data inside variables
- Make field specs first-class
- Add temporary nav buttons to docs template
- Fix nomenclature for all encoders; all encoding functions are now part of encoder instances
- Refactoring; add categorical scale
- Refactor routines into Visualization
- Remove spacing between marks and keylines
- Fix hit-testing for hidpi displays
- Save/restore canvas contexts properly
- Implement marquee selection
- Implement individual mark selection
- Refactor hit-testing
- Add subtle spacing between marks and keylines
- Additional hit-test foolproofing against anti-aliasing artifacts on the mask canvas
- Always clear hover canvas before rendering
- Add highlighting for point geom
- Add hit-testing for point geom
- Add selection marquee
- House interactive layers in a Viewport
- Refactor size, shape, lineWidth encoding
- Add stricter types for value()
- Add static fillColor, fillOpacity, strokeColor, strokeOpacity, size, lineWidth encoding
- Add static size encoding
- Add static shape encoding
- Add symbol rendering routines
- Basic canvas init on doc page; sample scatterplot; more channels
- Add table building and parsing
- Add doc builder
- Add pattern matching + tests
- Add code coverage
- Add build script, integrate shorthand
- Add sample datasets
