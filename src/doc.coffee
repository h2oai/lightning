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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    shape value 'triangleUp'
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    strokeColor value 'red'
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    strokeColor value 'red'
    strokeOpacity value 0.5
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    strokeColor value 'red'
    strokeOpacity value 0.5
    lineWidth value 5
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity value 0.5
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity value 0.5
    size value 2 
  )
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
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    fillOpacity value 0.25
    size value 2 
    strokeColor value 'purple'
    strokeOpacity value 0.5
    lineWidth value 5
    shape value 'triangleUp'
  )
)

###
plot ll-point-2
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor 'qsec', range '#13263a', '#47a0ea'
  )
)


###
plot ll-point-4
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor 'cyl', range ['red', 'green', 'blue']
  )
)


###
plot ll-point-5
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor value 'black'
    shape 'cyl', range ['circle', 'triangleUp', 'square']
  )
)


###
plot ll-point-6
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  data csv 'mtcars'
  point( 
    position 'wt', 'mpg'
    fillColor value 'black'
    size 'qsec'
  )
)


###
plot ll-point-7
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    strokeColor value 'black'
    shape 'cyl', range ['circle', 'triangle', 'square']
  )
)


###
plot ll-point-8
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    strokeColor value 'black'
    size 'qsec'
  )
)


###
plot ll-point-9
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    size value 3
  )
)


###
plot ll-point-10
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###
plot(
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor value 'red'
    size value 3
    shape shapes.square
  )
)


###
plot ll-point-11
Sample plot
Description goes here.
---
data: diamonds
tags:
 - point
 - ll
###
plot(
  data csv 'diamonds'
  point(
    position 'carat', 'price'
    fillColor value 'black'
    fillOpacity opacity 1/10
  )
)


###
plot ll-point-12
Sample plot
Description goes here.
---
data: diamonds
tags:
 - point
 - ll
###
plot(
  data csv 'diamonds'
  point(
    position 'carat', 'price'
    fillColor value 'black'
    fillOpacity opacity 1/20
  )
)


###
plot ll-point-13
Sample plot
Description goes here.
---
data: diamonds
tags:
 - point
 - ll
###
plot(
  data csv 'diamonds'
  point(
    position 'carat', 'price'
    fillColor value 'black'
    fillOpacity opacity 1/100
  )
)

