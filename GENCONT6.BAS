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


OPEN "contour6.mat" FOR OUTPUT AS 1
WRITE #1, 41, 41
FOR i = 1 TO 41
  y = i
  FOR j = 1 TO 41
    x = j
    z = 0
    FOR k = 1 TO nb
      rsqr = (xb(k) - x) ^ 2 + (yb(k) - y) ^ 2:
      dsqr = hb(k) ^ 2 + rsqr
      IF rsqr > 1E-10 THEN      'compute cosine of angle
        c = SQR(dsqr / rsqr)
      ELSE
        c = 1
      END IF
      z = z + cpb(k) / dsqr * c
    NEXT
    PRINT z
    WRITE #1, z
  NEXT
NEXT
STOP
END

