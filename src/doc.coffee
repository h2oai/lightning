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
  from csv 'mtcars_schema'
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
  from csv 'mtcars_schema'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'diamonds'
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
  from csv 'diamonds'
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
  from csv 'diamonds'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  record 5
  from csv 'mtcars'
)

###
plot table
table
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  table() 
  from csv 'mtcars'
)

###
plot table-where
table + where
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  table 'model', 'mpg', 'cyl', 'disp', 'hp'
  from csv 'mtcars'
  where 'model', like /Merc/
)

###
plot table-limit
table + limit
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  table 'model', 'mpg', 'cyl', 'disp', 'hp'
  from csv 'mtcars'
  limit 5
)

###
plot table-limit-offset
table + limit + offset
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  table 'model', 'mpg', 'cyl', 'disp', 'hp'
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
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
  from csv 'mtcars'
  groupBy factor(value 'All'), factor('cyl')
)

###
plot stacked-bars-temp
stacked bar data table (temp)
Description goes here.
###

plot(
  table 'factor(cyl)', 'factor(vs)', count('cyl'), stack(count('cyl'), 1)
  from csv 'mtcars'
  groupBy factor('cyl'), factor('vs')
)

###
plot all-factor
Grouping by 'All'
Description goes here.
###

plot(
  table 'All', 'factor(cyl)', count('cyl')
  from csv 'mtcars'
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
  from csv 'msleep'
)
