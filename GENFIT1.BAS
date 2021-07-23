'gen regfit1.mat
OPEN "regfit1.mat" FOR OUTPUT AS 1
c1 = 1: c2 = 2: c3 = 3: c4 = 4
WRITE #1, 20, 5
FOR i = 1 TO 20
  x1 = 30 * RND: x2 = 30 * RND: x3 = 30 * RND: x4 = 30 * RND
  y = c1 * x1 + c2 * x2 + c3 * x3 + c4 * x4
  WRITE #1, y, x1, x2, x3, x4
NEXT

    

