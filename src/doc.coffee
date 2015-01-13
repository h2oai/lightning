###
plot cat-path
bar
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
Simple column chart.
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  bar(
    position 'model', 'mpg'
  )
  from csv 'mtcars'
  # where 'model', like /Merc/
)

###
plot bar-chart
Simple bar chart.
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  bar(
    position 'mpg', 'model'
  )
  from csv 'mtcars'
  # where 'model', like /Merc/
)


###
plot point2
point
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
  group factor('cyl'), factor('carb')
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
Sample plot
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
Sample plot
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
Sample plot
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
Multiple point layers
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
plot line
Line
Line
---
tags:
 - line
###
plot(
  line(
    position 'year', 'number'
  )
  from csv 'movies'
  where 'movie', ne '' 
  where 'mpaa', eq 'PG-13'
  group 'year'
  having 'number', le 10
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
