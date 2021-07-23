OPEN "contour2.mat" FOR OUTPUT AS 1
WRITE #1, 20, 20
y = 4
FOR i = 1 TO 20
  x = 1
  FOR j = 1 TO 20
    WRITE #1, SIN(.4 * x) / x * y
    x = x + .5
  NEXT
  y = y - .5
NEXT

STOP
END

