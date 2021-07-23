OPEN "sines.mat" FOR OUTPUT AS 1
WRITE #1, 360, 2
FOR x = 0 TO 360
  WRITE #1, x, SIN(x * 3.14159 / 180)
NEXT
STOP
END

