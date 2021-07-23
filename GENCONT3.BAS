OPEN "contour3.mat" FOR OUTPUT AS 1
WRITE #1, 40, 40
y = 5
FOR i = 1 TO 40
  x = 3.14159 / 2
  FOR j = 1 TO 40
    WRITE #1, SIN(x) / x * y
    x = x + .25
  NEXT
  y = y - .25
NEXT

STOP
END

