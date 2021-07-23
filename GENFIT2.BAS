'gen regfit2.mat for polyfit to sin wave
OPEN "regfit2.mat" FOR OUTPUT AS 1

WRITE #1, 100, 7
x = 0: dx = 3.14159 / 200
FOR i = 1 TO 100
  WRITE #1, SIN(x), x, x ^ 2, x ^ 3, x ^ 4, x ^ 5, x ^ 6
  x = x + dx
NEXT

    

