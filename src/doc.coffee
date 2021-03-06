###
plot schema-x
schema-x
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  schema(
    position 'min', 'q1', 'q2', 'q3', 'max', factor('cyl')
  )
  from dataPackage 'data/mtcars_schema'
)
###
plot schema-y
schema-y
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  schema(
    position factor('cyl'), 'min', 'q1', 'q2', 'q3', 'max'
  )
  from dataPackage 'data/mtcars_schema'
)
###
plot point2
point, stacked
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position avg('wt'), avg('mpg')
  )
  from dataPackage 'data/mtcars'
  where 'model', like /Merc/
  groupBy factor('cyl'), factor('carb')
)

###
plot point3
point, stacked, having
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position avg('wt'), avg('mpg')
  )
  from dataPackage 'data/mtcars'
  where 'model', like /Merc/
  groupBy factor('cyl'), factor('carb')
  having avg('mpg'), gt 17
)

###
plot point
point
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-sh
point + shape
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    shape value 'triangleUp'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-sc
point + strokeColor
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    strokeColor value 'red'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-sc-so
point + strokeColor + strokeOpacity
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    strokeColor value 'red'
    strokeOpacity value 0.5
  )
  from dataPackage 'data/mtcars'
)
###
plot point-sc-so-lw
point + strokeColor + strokeOpacity + lineWidth
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    strokeColor value 'red'
    strokeOpacity value 0.5
    lineWidth value 5
  )
  from dataPackage 'data/mtcars'
)
###
plot point-fc
point + fillColor
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
  )
  from dataPackage 'data/mtcars'
)
###
plot point-fc-fo
point + fillColor + fillOpacity
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity value 0.5
  )
  from dataPackage 'data/mtcars'
)
###
plot point-fc-fo-sz
point + fillColor + fillOpacity + size
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity value 0.5
    size value 16
  )
  from dataPackage 'data/mtcars'
)
###
plot point-fc-fo-sc-so-sz-sh
point + fillColor + fillOpacity + strokeColor + strokeOpacity + size + shape
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity value 0.25
    size value 16
    strokeColor value 'purple'
    strokeOpacity value 0.5
    lineWidth value 5
    shape value 'triangleUp'
  )
  from dataPackage 'data/mtcars'
)


###
plot point-vsc
point + variable strokeColor
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    strokeColor 'qsec'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vscr
point + variable strokeColor with custom range
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    strokeColor 'qsec', range 'blue', 'red'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vfc
point + variable fillColor
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    fillColor 'qsec'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vfcr
point + variable fillColor with custom range
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    fillColor 'qsec', range 'blue', 'red'
  )
  from dataPackage 'data/mtcars'
)
###
plot point-factor-vfc
point + factor + variable fillColor
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    fillColor factor 'cyl'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-factor-vfcr
point + factor + variable fillColor with custom range
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    fillColor factor('cyl'), range ['red', 'green', 'blue']
  )
  from dataPackage 'data/mtcars'
)

###
plot point-factor-vsh
point + factor + variable shape
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    shape factor 'cyl'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-factor-vshr
point + factor + variable shape with custom range
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point(
    position 'wt', 'mpg'
    shape factor('cyl'), range ['circle', 'triangleUp', 'square']
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vsz
point + variable size
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point( 
    position 'wt', 'mpg'
    size 'qsec'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vszr
point + variable size with custom range
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point( 
    position 'wt', 'mpg'
    size 'qsec', range 4, 40
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vfo
point + variable fillOpacity
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point( 
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity 'qsec'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vfor
point + variable fillOpacity with custom range
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point( 
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity 'qsec', range 0.25, 1
  )
  from dataPackage 'data/mtcars'
)
###
plot point-vlw
point + variable lineWidth
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point( 
    position 'wt', 'mpg'
    lineWidth 'qsec'
  )
  from dataPackage 'data/mtcars'
)

###
plot point-vlwr
point + variable lineWidth with custom range
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point( 
    position 'wt', 'mpg'
    lineWidth 'qsec', range 2, 20
    size value 20
    strokeOpacity value 0.4
  )
  from dataPackage 'data/mtcars'
)


###
plot ll-point-11
point overplotting #1
Description goes here.
---
from: diamonds
tags:
 - point
 - ll
###
plot(
  point(
    position 'carat', 'price'
    fillOpacity value 1/10
  )
  from dataPackage 'data/diamonds'
)


###
plot ll-point-12
point overplotting #2
Description goes here.
---
from: diamonds
tags:
 - point
 - ll
###
plot(
  point(
    position 'carat', 'price'
    fillOpacity value 1/20
  )
  from dataPackage 'data/diamonds'
)


###
plot ll-point-13
point overplotting #3
Description goes here.
---
from: diamonds
tags:
 - point
 - ll
###
plot(
  point(
    position 'carat', 'price'
    fillOpacity value 1/100
  )
  from dataPackage 'data/diamonds'
)

###
plot two-point-layers
point - multiple layers
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  point( 
    position 'wt', 'mpg'
    fillColor value 'red'
    size value 15
  )
  point(
    position 'wt', 'mpg'
    fillColor value 'white'
    shape factor 'cyl'
  )
  from dataPackage 'data/mtcars'
)

###
plot path
path
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  path(
    position 'wt', 'mpg'
  )
  from dataPackage 'data/mtcars'
)

###
plot path-vsc
path + variable strokeColor
Description goes here.
---
tags:
 - path
 - ll
###
plot(
  path(
    position 'wt', 'mpg'
    strokeColor 'qsec'
  )
  from dataPackage 'data/mtcars'
)
###
plot path-vscr
path + variable strokeColor with custom range
Description goes here.
---
tags:
 - path
 - ll
###
plot(
  path(
    position 'wt', 'mpg'
    strokeColor 'qsec', range 'blue', 'red'
  )
  from dataPackage 'data/mtcars'
)
###
plot path-vlw
path + variable lineWidth
Description goes here.
---
tags:
 - path
 - ll
###
plot(
  path( 
    position 'wt', 'mpg'
    lineWidth 'qsec'
  )
  from dataPackage 'data/mtcars'
)
###
plot cat-path
path
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  path(
    position 'model', 'mpg'
  )
  from dataPackage 'data/mtcars'
  # where 'model', like /Merc/
)

###
plot column-chart
rect (column)
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  rect(
    position 'model', 'mpg'
  )
  from dataPackage 'data/mtcars'
  # where 'model', like /Merc/
)

###
plot bar-chart
rect (bar)
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  rect(
    position 'mpg', 'model'
  )
  from dataPackage 'data/mtcars'
  # where 'model', like /Merc/
)
###
plot record
record
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  select 5
  from dataPackage 'data/mtcars'
)

###
plot select
select
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  select() 
  from dataPackage 'data/mtcars'
)

###
plot table-where
select + where
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  select 'model', 'mpg', 'cyl', 'disp', 'hp'
  from dataPackage 'data/mtcars'
  where 'model', like /Merc/
)

###
plot table-limit
select + limit
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  select 'model', 'mpg', 'cyl', 'disp', 'hp'
  from dataPackage 'data/mtcars'
  limit 5
)

###
plot table-limit-offset
select + limit + offset
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  select 'model', 'mpg', 'cyl', 'disp', 'hp'
  from dataPackage 'data/mtcars'
  limit 10, 5
)

###
plot rect-limit-offset
rect + limit + offset
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  rect(
    position 'mpg', 'model'
  )
  from dataPackage 'data/mtcars'
  limit 10, 5
)

###
plot histogram
rect + width
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  rect(
    position 'model', 'mpg'
    width value 1
  )
  from dataPackage 'data/mtcars'
  # where 'model', like /Merc/
)

###
plot stacked-bars-0
stacked bars, 0 depth
Stacking with depth = 0 stacks everything.
###

plot(
  rect(
    position 'factor(cyl)', stack(count('cyl'), 0)
    fillColor 'factor(vs)'
  )
  from dataPackage 'data/mtcars'
  groupBy factor('cyl'), factor('vs')
)

###
plot stacked-bars-1
stacked bars, depth 1
Stacking with depth = number of "detail" factors is the common use case.
###

plot(
  rect(
    position 'factor(cyl)', stack(count('cyl'), 1)
    fillColor 'factor(vs)'
  )
  from dataPackage 'data/mtcars'
  groupBy factor('cyl'), factor('vs')
)

###
plot stacked-bars-2
stacked bars, depth 2
Stacking with depth = cube-dimension leads to occlusion (equivalent to not stacking).
###

plot(
  rect(
    position 'factor(cyl)', stack(count('cyl'), 2)
    fillColor 'factor(vs)'
  )
  from dataPackage 'data/mtcars'
  groupBy factor('cyl'), factor('vs')
)

###
plot single-stacked-bar
single stacked bar
Description goes here.
###

plot(
  rect(
    position stack(count('cyl'), 0), 'All'
    fillColor 'factor(cyl)'
  )
  from dataPackage 'data/mtcars'
  groupBy factor(value 'All'), factor('cyl')
)

###
plot stacked-bars-temp
stacked bar data select (temp)
Description goes here.
###

plot(
  select 'factor(cyl)', 'factor(vs)', count('cyl'), stack(count('cyl'), 1)
  from dataPackage 'data/mtcars'
  groupBy factor('cyl'), factor('vs')
)

###
plot all-factor
Grouping by 'All'
Description goes here.
###

plot(
  select 'All', 'factor(cyl)', count('cyl')
  from dataPackage 'data/mtcars'
  groupBy factor(value 'All'), factor('cyl')
)

###
plot path-missings
path with missing values
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  path(
    position 'name', 'brainwt'
  )
  from dataPackage 'data/msleep'
)

###
plot custom-domain
Custom Domain
Setting custom domains on axes
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'Training Speed', 'Test Set Error'
    tooltip 'Parameters'
  )
  domainY_HACK 0, 1 
  from dataPackage 'data/performance'
)

###
plot extra-tooltip-data
Extra tooltip data
Displaying additional attributes in tooltips, with custom bounds
---
tags:
 - point
 - ll
###

plot(
  point(
    position 'Training Speed', 'Test Set Error'
    tooltip 'Parameters'
  )
  from dataPackage 'data/performance'
  bounds 500, 500
)

###
plot custom-height
Custom Height
Displaying additional attributes in tooltips, with custom height
---
tags:
 - point
 - ll
###

plot(
  rect(
    position 'Test Set Error', 'Parameters'
  )
  from dataPackage 'data/performance'
  bounds null, 600
)


###
plot on-the-fly
On the fly
Plotting expressions
###
plot(
  path position 'x', 'sin'
  path position 'x', 'cos'
  from computed 'x', -Math.PI, Math.PI, 0.05,
    sin: (x) -> Math.sin x
    cos: (x) -> Math.cos x
)


###
plot annotation-line-horizontal
Horizontal annotation line
###
plot(
  point position 'wt', 'mpg'
  line(
  # position 0, y-intercept
    position (value 0), value 23
  )
  from dataPackage 'data/mtcars'
)

###
plot annotation-line-vertical
Vertical annotation line
###
plot(
  point position 'wt', 'mpg'
  line(
  # position x-intercept
    position value 3.3
  )
  from dataPackage 'data/mtcars'
)

###
plot annotation-line-slope-intercept
Annotation lines using slope, intercept
###
plot(
  point position 'wt', 'mpg'
  line(
  # position slope, y-intercept
    position value(0.5), value(14)
    strokeColor value 'red'
    strokeOpacity value 0.5
    lineWidth value 5
  )
  from dataPackage 'data/mtcars'
)

###
plot label-occlusion-test
Label Occlusion Test
###
plot(
  rect(
    position 'mpg', 'model'
  )
  from dataPackage 'data/mtcars'
  bounds null, 100
)
