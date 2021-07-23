OPEN "contour5.mat" FOR OUTPUT AS 1
WRITE #1, 40, 40
y = -5
FOR i = 1 TO 40
  x = -5
  FOR j = 1 TO 40
    r = SQR(x ^ 2 + y ^ 2)
    z = SIN(r) / (r + 1)
    WRITE #1, z
    x = x + .25
  NEXT
  y = y + .25
NEXT

STOP
END

