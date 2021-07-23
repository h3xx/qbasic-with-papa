OPEN "matrix1.mat" FOR OUTPUT AS 1
WRITE #1, 80, 4
x = 0
FOR i = 1 TO 80
  WRITE #1, x, SIN(x), 1 + COS(x), SQR(x)
  x = x + .1
NEXT

