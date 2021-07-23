' PLOTCONT.BAS  16 October 1989
'reads matrix file
'with values m,n, then m rows of n values
'plots contour lines for matrix values
DIM vmat(50, 50)  'the input matrix
DIM vpx(5), vpy(5) 'temp. storage four up to 4 points for a square
eps = 1E-10
'...................read matrix
CLS
INPUT "Enter matrix file name=", mname$
l = LEN(mname$)
IF l > 5 THEN
 x$ = MID$(mname$, l - 3, 4)
 IF x$ <> ".MAT" OR x$ <> ".mat" THEN
   mname$ = mname$ + ".MAT"
 END IF
ELSE
  mname$ = mname$ + ".MAT"
END IF
OPEN mname$ FOR INPUT AS #1
INPUT #1, m, n 'read matrix m and n
FOR i = 1 TO m
  FOR j = 1 TO n
    INPUT #1, vmat(i, j)
  NEXT
NEXT
'...................detn. min and max values
vmin = vmat(1, 1): vmax = vmin
FOR i = 1 TO m
  FOR j = 1 TO n
    v = vmat(i, j)
    IF v < vmin THEN
      vmin = v
    END IF
    IF v > vmax THEN
      vmax = v
    END IF
  NEXT
NEXT
PRINT "vmin,vmax=", vmin, vmax:
vrange = vmax - vmin
IF vrange < eps THEN
  PRINT "range of values too small": STOP
END IF

'.................... detn. v quantum
f = 1: ex = 0: flag% = 0
WHILE flag% = 0
  vq = f * 10 ^ ex  ' vq is x contour quantum (interval)
  t = vrange / vq
  IF t < 4 THEN
    IF f = 1 THEN
      f = 5: ex = ex - 1 'decrease vq
    ELSEIF f = 2 THEN
      f = 1:
    ELSE 'f=5
      f = 2
    END IF
  ELSEIF t > 10 THEN
    IF f = 1 THEN
      f = 2
    ELSEIF f = 2 THEN
      f = 5
    ELSE
      f = 1: ex = ex + 1'increase vq
    END IF
  ELSE
    flag% = 1
  END IF
WEND
'PRINT "vq=", vq
'...................detn. quantized contour range
IF vmin >= 0 THEN
  vqmin = INT(vmin / vq) * vq    ' vqmin is quantized vmin
ELSE
  vqmin = -INT(-vmin / vq) * vq
END IF
IF vqmin > vmin THEN
  vqmin = vqmin - vq
END IF
IF vqmax >= 0 THEN
   vqmax = INT(vmax / vq) * vq    'vqmax is quantized vmax
ELSE
  vqmax = -INT(-vmax / vq) * vq
END IF
IF vqmax < vmax THEN
  vqmax = vqmax + vq
END IF
'PRINT "vqmin,vqmax=", vqmin, vqmax: INPUT k$
'...................draw grid
CLS
SCREEN 12
COLOR 15
LINE (0, 0)-(639, 479), 15, BF
mm1 = m - 1: nm1 = n - 1
rm = mm1: rn = nm1: rmn = rm / rn'detn. ratio m to n
IF rmn >= 400! / 560! THEN
  p = INT(400 / rm)
ELSE
  p = INT(560 / rn)
END IF
'PRINT "p=", p
px = 80: py = 30
FOR i = 1 TO m               'draw horizontals
  LINE (px, py)-(px + nm1 * p, py), 0, , &HAAAA
  py = py + p
NEXT
px = 80: py = 30
FOR j = 1 TO n
  LINE (px, py)-(px, py + mm1 * p), 0, , &HAAAA
  px = px + p
NEXT
'..........................process
vc = vqmin: ivc = 2
DO WHILE vc <= vqmax                      ' loop for each v quantum
  COLOR ivc
  PRINT USING "##.##^^^^"; vc
  FOR i = 1 TO mm1
    FOR j = 1 TO nm1
      a = vmat(i, j): b = vmat(i, j + 1): c = vmat(i + 1, j + 1): d = vmat(i + 1, j)
      np = 0
      IF a <= vc AND vc <= b OR a >= vc AND vc >= b THEN 'check vc in range of top of square
        IF ABS(a - b) < eps THEN
          np = np + 1: vpx(np) = 0: vpy(np) = 0
        ELSE
          np = np + 1:
          vpx(np) = p * (vc - a) / (b - a): vpy(np) = 0
        END IF
      END IF
      IF b <= vc AND vc <= c OR b >= vc AND vc >= c THEN 'check vc in range of right of square
        IF ABS(b - c) < eps THEN
          np = np + 1: vpx(np) = p: vpy(np) = 0
        ELSE
          np = np + 1:
          vpx(np) = p: vpy(np) = p * (vc - b) / (c - b)
          'PRINT "vpy=", vpy(np): INPUT k$
        END IF
      END IF
      IF c <= vc AND vc <= d OR c >= vc AND vc >= d THEN 'check vc in range of bottom of square
        IF ABS(c - d) < eps THEN
          np = np + 1: vpx(np) = p: vpy(np) = p
        ELSE
          np = np + 1:
          vpx(np) = p * (vc - d) / (c - d): vpy(np) = p
        END IF
      END IF
      IF d <= vc AND vc <= a OR d >= vc AND vc >= a THEN 'check vc in range of left of square
        IF ABS(d - a) < eps THEN
          np = np + 1: vpx(np) = 0: vpy(np) = p
        ELSE
          np = np + 1:
          vpx(np) = 0: vpy(np) = p * (vc - a) / (d - a)
        END IF
      END IF
      IF np > 2 THEN
        np = np + 1: vpx(np) = vpx(1): vpy(np) = vpy(1)
      END IF
      xcorner = 80 + p * (j - 1): ycorner = 30 + p * (i - 1)
      FOR k = 2 TO np
        x1 = xcorner + vpx(k - 1): y1 = ycorner + vpy(k - 1)
        x2 = xcorner + vpx(k): y2 = ycorner + vpy(k)
        LINE (x1, y1)-(x2, y2), ivc
      NEXT
    NEXT
  NEXT
  vc = vc + vq: ivc = ivc + 1:
  IF ivc > 14 THEN
    ivc = 2
  END IF
LOOP
COLOR 11



