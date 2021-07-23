' PLOTMAT.BAS version of Nov. 15 1989
'Plot matrix, first col. = x values,
' other columns are y values. Total i x j of matrix <= 2500
DIM vmat(2500)
DIM css$(39)
DIM kolors(6)
kolors(0) = 0
kolors(1) = 12
kolors(2) = 3
kolors(3) = 9
kolors(4) = 13
kolors(5) = 10
kolors(6) = 6
'.....................set-up char. codes
css$(0) = "162747565241211216"
css$(1) = "3137"
css$(2) = "16274756541151"
css$(3) = "1627475655445352412112"
css$(4) = "171353014741"
css$(5) = "571714445352412112"
css$(6) = "564727161221415253442413"
css$(7) = "17575511"
css$(8) = "44555647271615241312214152534424"
css$(9) = "12214152535647271615244455"
css$(10) = "1115375551001353"
css$(11) = "11174756554453524111001444"
css$(12) = "5647271612214152"
css$(13) = "11174756524111"
css$(14) = "57171151001454"
css$(15) = "571711001444"
css$(16) = "56472716122141525333"
css$(17) = "1117005157001454"
css$(18) = "3137"
css$(19) = "575241211213" 'J
css$(20) = "1711005713002451"
css$(21) = "171151"
css$(22) = "1117355751"
css$(23) = "1117001652005751"
css$(24) = "162747565241211216" 'O
css$(25) = "11174756554414"
css$(26) = "162747565241211216003351"
css$(27) = "11174756554414002451"
css$(28) = "564727161524445352412112"'S
css$(29) = "1757003731"
css$(30) = "171221415257"
css$(31) = "1713315357"
css$(32) = "1711335157"
css$(33) = "171652510057561211"
css$(34) = "1716345657003431"
css$(35) = "175756121151"'Z
css$(36) = "2444003532"' plus
css$(37) = "2444" 'minus
css$(38) = "3131" 'period
css$(39) = "00" 'blank
'...................read matrix
CLS
INPUT "Enter matrix file name=", mname$
INPUT "Enter horizontal title=", htitle$
INPUT "Enter vertical title=", vtitle$
l = LEN(mname$)
IF l > 5 THEN
 x$ = MID$(mname$, l - 3, 4)
 IF x$ <> ".MAT" AND x$ <> ".mat" THEN
   mname$ = mname$ + ".MAT"
 END IF
ELSE
  mname$ = mname$ + ".MAT"
END IF
OPEN mname$ FOR INPUT AS #1
INPUT #1, im, jm 'read matrix i and j
FOR i = 1 TO im
  FOR j = 1 TO jm
    INPUT #1, vmat(i + (j - 1) * im)
  NEXT
NEXT
'...................detn. min and max values
xmin = vmat(1): xmax = xmin
ymin = vmat(1 + im): ymax = ymin
FOR i = 1 TO im
  v = vmat(i)
  IF v < xmin THEN
    xmin = v
  END IF
  IF v > xmax THEN
    xmax = v
  END IF
  FOR j = 2 TO jm
     v = vmat(i + (j - 1) * im)
     IF v < ymin THEN
       ymin = v
     END IF
     IF v > ymax THEN
       ymax = v
     END IF
  NEXT
NEXT
'..............detn. grid ranges and intervals
xrange = xmax - xmin
IF xrange < 1E-10 THEN
 PRINT "x range error"
 STOP
END IF
f = 1: ex = 0: flag% = 0
WHILE flag% = 0
  qx = f * 10 ^ ex  ' qx is x plotting quantum (interval)
  t = xrange / qx
  IF t < 4 THEN
    IF f = 1 THEN
      f = 5: ex = ex - 1 'decrease qx
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
      f = 1: ex = ex + 1'increase qx
    END IF
  ELSE
    flag% = 1
  END IF
WEND
IF xmin >= 0 THEN
 qxmin = INT(xmin / qx) * qx    ' qxmin is quantized xmin
ELSE
 qxmin = -INT(-xmin / qx) * qx
END IF
IF qxmin >= xmin THEN  'prevent xmin from touching bottom line
  qxmin = qxmin - qx
END IF
IF xmax >= 0 THEN
  qxmax = INT(xmax / qx) * qx    'qxmax is quantized xmax
ELSE
  qxmax = -INT(-xmax / qx) * qx
END IF
IF qxmax <= xmax THEN  'prevent xmax from touching top line
  qxmax = qxmax + qx
END IF
'....... nqx is number of x divisions, pqx is pixels in each
nqx = INT((qxmax - qxmin + qx / 2) / qx) 'numb. of x divisions
pqx = INT(480 / nqx) 'numb. of pixels in each x division
'........... now similar calculations for y values
yrange = ymax - ymin
IF yrange < 1E-10 THEN
 PRINT "y range error"
 STOP
END IF
f = 1: ex = 0: flag% = 0
WHILE flag% = 0
  qy = f * 10 ^ ex
  t = yrange / qy
  IF t < 4 THEN
    IF f = 1 THEN
      f = 5: ex = ex - 1 'decrease qy
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
      f = 1: ex = ex + 1'increase qy
    END IF
  ELSE
    flag% = 1
  END IF
WEND
IF ymin >= 0 THEN
 qymin = INT(ymin / qy) * qy
ELSE
 qymin = -INT(-ymin / qy) * qy
END IF
IF qymin >= ymin THEN  'prevent vmin from touching bottom
  qymin = qymin - qy
END IF
IF ymax >= 0 THEN
  qymax = INT(ymax / qy) * qy
ELSE
  qymax = -INT(-ymax / qy) * qy
END IF
IF qymax <= ymax THEN  'prevent vmax from touching top
  qymax = qymax + qy
END IF
nqy = INT((qymax - qymin + qy / 2) / qy) ' numb. of y divisions
pqy = INT(360 / nqy) 'numb. of pixels in each y division
'..................pxmin,pxmax,pymin,pymax are pixel vals.
'..................of the rectangle to hold the plots
'..................(assumes pixels are a x=0 to 639, y=0 to 479)
pxmin = 120
pxmax = pxmin + nqx * pqx
pymin = 80
pymax = pymin + nqy * pqy
'..............set to plot, whiten the screen
CLS
SCREEN 12
COLOR 15
LINE (0, 0)-(639, 479), 15, BF
'..............draw grid lines and values
vn = qxmin: mn = 0: ii = 1
FOR i = pxmin TO pxmax STEP pqx    ' draw verticals
  LINE (i, 480 - pymin + 5)-(i, 480 - pymax), 0, , &HF0F0
  vs$ = STR$(vn)
  xn = i - INT(LEN(vs$) * 6 / 2): yn = 480 - pymin + 20
  GOSUB numb
  vn = qxmin + ii * qx: ii = ii + 1
NEXT
vn = qymin: mn = 0: ii = 1
FOR i = pymin TO pymax STEP pqy    ' draw horizontals
  LINE (pxmin - 5, 480 - i)-(pxmax, 480 - i), 0, , &HF0F0
  xn = pxmin - 60: yn = 480 - i + 8  'x,y-start position for line value
  vs$ = STR$(vn)
  GOSUB numb
  vn = qymin + ii * qy: ii = ii + 1
NEXT
'..............add titles
vs$ = htitle$: xn = 350 - LEN(vs$) * 3: yn = 450: mn = 0: GOSUB numb
vs$ = vtitle$: xn = 30: yn = 240 - LEN(vs$) * 4: mn = 1: GOSUB numb
'..............now plot
rx = (pxmax - pxmin) / (qxmax - qxmin)
ry = (pymax - pymin) / (qymax - qymin)
FOR j = 2 TO jm
  FOR i = 1 TO im
    px1 = px2: py1 = py2
    px2 = pxmin + rx * (vmat(i) - qxmin)
    py2 = pymin + ry * (vmat(i + (j - 1) * im) - qymin)
    IF i <> 1 THEN
      LINE (px1, 480 - py1)-(px2, 480 - py2), kolors(j - 2)
      END IF
  NEXT
NEXT
INPUT x
STOP
'.....................................
' subroutine to put a char. string on the screen
'put string vs$ on screen at xn,yn, mode mn
numb: lv = LEN(vs$)
FOR in = 1 TO lv
  k = ASC(MID$(vs$, in, 1))
  IF k >= 48 AND k <= 57 THEN '0 thru 9
    k = k - 48
  ELSEIF k >= 65 AND k <= 90 THEN 'A thru Z
    k = k - 55
  ELSEIF k >= 97 AND k <= 122 THEN 'a thru z
    k = k - 87
  ELSEIF k = 43 THEN '+
    k = 36
  ELSEIF k = 45 THEN '-
    k = 37
  ELSEIF k = 46 THEN '.
    k = 38
  ELSE
    k = 39
  END IF
  cs$ = css$(k)
  xn1 = 0: yn1 = 0
  lc = LEN(cs$)
  FOR jn = 1 TO lc STEP 2
    xn2 = VAL(MID$(cs$, jn, 1))
    yn2 = VAL(MID$(cs$, jn + 1, 1))
    IF xn1 <> 0 AND xn2 <> 0 THEN
      LINE (xn + xn1, yn - yn1)-(xn + xn2, yn - yn2), 0
    END IF
    xn1 = xn2: yn1 = yn2
  NEXT jn
  IF mn = 0 THEN
    xn = xn + 6
  ELSE
    yn = yn + 8
  END IF
NEXT in
RETURN




