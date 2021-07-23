OPEN "poly.mat" FOR OUTPUT AS 1
WRITE #1, 240, 3
dx = 3.14159 / 120: x = -20 * dx
FOR i = 1 TO 240
  y = x + 1.313E-05 * x ^ 2 - .1664 * x ^ 3 - .001306 * x ^ 4 + .01007 * x ^ 5 - .0009619 * x ^ 6
  WRITE #1, x, y, SIN(x)
  x = x + dx
NEXT

