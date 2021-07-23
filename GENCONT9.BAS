' draws contour map of illumination of a set of light bulbs
' on a flat surface
DIM cpb(6) 'candlepowers
DIM hb(6)  'heights off of surface
DIM xb(6)  'x locns. of bulbs  (like j, but real value)
DIM yb(6)  'y locns. of bulbs  (like i. but real value)

'set-up 5 bulbs
nb = 5
cpb(1) = 4: hb(1) = 20: xb(1) = 20: yb(1) = 20
cpb(2) = 1: hb(2) = 4: xb(2) = 35: yb(2) = 22
cpb(3) = 3: hb(3) = 36: xb(3) = 32: yb(3) = 30
cpb(4) = 6: hb(4) = 43: xb(4) = 18: yb(4) = 37
cpb(5) = 5: hb(5) = 30: xb(5) = 10: yb(5) = 10


OPEN "contour9.mat" FOR OUTPUT AS 1
WRITE #1, 41, 41
FOR i = 1 TO 41
  y = i
  FOR j = 1 TO 41
    x = j
    z = SIN(x) + SIN(y / 2) + SIN(SQR(x ^ 2 + y ^ 2))
    PRINT z
    WRITE #1, z
  NEXT
NEXT
STOP
END

