OPEN "contour1.mat" FOR OUTPUT AS 1
WRITE #1, 20, 20
r = 10
FOR i = 1 TO 20
  FOR j = 1 TO 20
    x = i - r: y = j - r
    IF x ^ 2 + y ^ 2 <= r ^ 2 THEN
      s = SQR(r ^ 2 - x ^ 2 - y ^ 2)
    ELSE
      s = 0
    END IF
    WRITE #1, s
  NEXT
NEXT

STOP
END

