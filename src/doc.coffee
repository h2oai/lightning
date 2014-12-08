###
plot ll-point-0
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
  )
)
###
plot ll-point-1
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
    fillColor color 'red'
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
plot ll-point-3
Sample plot
Description goes here.
---
tags:
 - point
 - ll
###

plot(
  bounds 640, 480
  data csv 'mtcars'
  point(
    position 'wt', 'mpg'
    fillColor color 'black'
    fillOpacity 'qsec'
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
    fillColor color 'black'
    shape 'cyl', range ['circle', 'triangle', 'square']
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
    fillColor color 'black'
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
    strokeColor color 'black'
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
    strokeColor color 'black'
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
    fillColor color 'red'
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
    fillColor color 'red'
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
    fillColor color 'black'
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
    fillColor color 'black'
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
    fillColor color 'black'
    fillOpacity opacity 1/100
  )
)

