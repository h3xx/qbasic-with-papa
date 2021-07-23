OPEN "parabol1.mat" FOR OUTPUT AS 1
WRITE #1, 1000, 2
FOR x = 0 TO 500
  WRITE #1, x, SQR(x)
NEXT
FOR f = 500 TO 0 STEP -1
  WRITE #1, x, -SQR(x)
NEXT
STOP
END

