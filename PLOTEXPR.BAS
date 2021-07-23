
'PLOTEXPR.bas, version 5 Oct. 1998
' Calculates and plots 100 values of an expression in x
'where the user provides the expression and the range of x
DIM vmat(202)
CLS
DO                       'top of main loop
  PRINT "enter expression in x"
  PRINT "(or q to quit)"
  LINE INPUT "y=", xexpr$
  IF xexpr$ = "q" THEN
    EXIT DO
  END IF
  PRINT "enter min and max values for x"
  INPUT "xmin=", xmin
  INPUT "xmax=", xmax
  ' check range
  range = xmax - xmin
  IF range < 10 ^ -10 THEN
    PRINT "range too small"
  ELSE
    n = 100: np1 = n + 1
    xstep = (xmax - xmin) / n    'calculate n increments
    x = xmin: nrows = np1: ncols = 2
    FOR ip = 1 TO np1
      GOSUB evalexpr 'calculate the value of the expression
      IF kerr <> 0 THEN
        EXIT FOR
      END IF
      y = result
      'PRINT "y=", y
      vmat(ip) = x: vmat(ip + np1) = y  '  enter into matrix
      'INPUT "press a key", k$
      x = x + xstep
    NEXT
    IF kerr = 0 THEN
      'call the plotter
      im = np1: jm = 2: xtitle$ = "plot of y=" + xexpr$: ytitle$ = "y"
      GOSUB matplot
      CLS
    END IF
  END IF
  'INPUT "press any key to continue", k$
LOOP                     'bottom of main loop
STOP

' subroutine to evaluate the expression
evalexpr:    'inputs = x, xexpr$,  output=result
DIM stack1$(50), stack2(50)  ' operator stack,  value stack
DIM names$(6)
names$(1) = "sin": names$(2) = "cos": names$(3) = "tan"
names$(4) = "log": names$(5) = "sqr": names$(6) = "abs"
expr$ = "[" + xexpr$ + "]"
lx = LEN(expr$)     ' find length
ix = 0           'set extraction index for first char.
it = 0 'clear token stack
iquit = 0
WHILE iquit = 0    'loop for each token
  token$ = ""
  ix = ix + 1: char$ = MID$(expr$, ix, 1)'extract one character
  IF char$ = " " THEN    'detn. type of char.
    ix = ix      'blank, do nothing
  ELSEIF char$ >= "a" AND char$ <= "z" THEN    'letter
    k$ = stack1$(it)
    IF k$ = "v" OR LEN(k$) > 1 THEN 'check no prev. var. or func name
      iquit = ix
    END IF
    k = 0
    WHILE k = 0
      token$ = token$ + char$
      ix = ix + 1: char$ = MID$(expr$, ix, 1)
      IF char$ < "a" OR char$ > "z" THEN
        k = 1
      END IF
    WEND
    ix = ix - 1
    IF token$ = "x" THEN   ' token is the variable x
      co$ = "v": cv = x    'current op = v, value = x
      'PRINT "pushx", "val=", cv
    ELSE        'assume token is a function name
      ktest = 0
      FOR k = 1 TO 6
        IF token$ = names$(k) THEN
          ktest = 1
        END IF
      NEXT
      IF ktest = 0 THEN
          iquit = ix          'name is not a func name
          PRINT "not a legal name"
      END IF
      co$ = token$: cv = 0
      'PRINT "push", co$
    END IF
    it = it + 1
    stack1$(it) = co$: stack2(it) = cv  'push op or value into stack
  ELSEIF char$ >= "0" AND char$ <= "9" OR char$ = "." THEN 'value
    k$ = stack1$(it)
    IF k$ = "v" OR LEN(k$) > 1 THEN 'check no prev. var. or func name
      iquit = ix
    END IF
    nd = 0: np = 0' counters for no. of digits and periods
    WHILE char$ >= "0" AND char$ <= "9" OR char$ = "."
      IF char$ = "." THEN
        np = np + 1
      ELSE
        nd = nd + 1
      END IF
      token$ = token$ + char$
      ix = ix + 1: char$ = MID$(expr$, ix, 1)
    WEND
    IF nd = 0 OR np > 1 THEN
      iquit = ix
    END IF
    IF char$ = "e" THEN
      token$ = token$ + char$
      ix = ix + 1: char$ = MID$(expr$, ix, 1)
      IF char$ = "+" OR char$ = "-" THEN
        token$ = token$ + char$
        ix = ix + 1: char$ = MID$(expr$, ix, 1)
      END IF
      nd = 0
      IF char$ >= "0" AND char$ <= "9" THEN
        WHILE char$ >= "0" AND char$ <= "9"
          token$ = token$ + char$: nd = nd + 1
          ix = ix + 1: char$ = MID$(expr$, ix, 1)
        WEND
        IF nd = 0 THEN
          iquit = ix
        END IF
        ix = ix - 1
      ELSE
        iquit = ix
      END IF
    ELSE
      ix = ix - 1
    END IF
    it = it + 1: stack1$(it) = "v": stack2(it) = VAL(token$)
    'print "push", "val=", stack2(it)
  ELSEIF char$ = "(" THEN
    IF stack1$(it) = "v" THEN
      iquit = ix
    END IF
    it = it + 1: stack1$(it) = char$: stack2(it) = 0
  ELSEIF char$ = "[" THEN
    IF ix <> 1 THEN
      iquit = ix
    END IF
    it = it + 1: stack1$(it) = char$: stack2(it) = 0
    'print "push", char$
  ELSE    'other operators
    ktest = 1
    WHILE ktest = 1
      kpop = 0: kpush = 0
      k$ = stack1$(it)
      IF char$ = "^" THEN
        IF k$ <> "v" THEN
          iquit = ix
        END IF
        po$ = stack1$(it - 1)
        IF po$ = "^" THEN
          kpop = 1
        ELSE
          kpush = 1: ktest = 0
        END IF
      ELSEIF char$ = "*" OR char$ = "/" THEN
        IF k$ <> "v" THEN
          iquit = ix
        END IF
        po$ = stack1$(it - 1)
        IF po$ = "^" OR po$ = "*" OR po$ = "/" THEN
          kpop = 1
        ELSE
          kpush = 1: ktest = 0
        END IF
      ELSEIF char$ = "+" OR char$ = "-" THEN
        IF k$ = "[" OR k$ = "(" THEN 'unary
          it = it + 1: stack1$(it) = "v": stack2(it) = 0
          kpush = 1: ktest = 0
        ELSE
          IF k$ <> "v" THEN
            iquit = ix
          END IF
          po$ = stack1$(it - 1)
          IF po$ = "^" OR po$ = "*" OR po$ = "/" OR po$ = "+" OR po$ = "-" THEN
            kpop = 1
          ELSE
            kpush = 1: ktest = 0
          END IF
        END IF
      ELSEIF char$ = ")" OR char$ = "]" THEN
        IF k$ <> "v" THEN
          iquit = ix
        END IF
        po$ = stack1$(it - 1)
        kpop = 1
      ELSE
        iquit = ix: ktest = 0
      END IF
      IF kpop = 1 THEN
        IF po$ = "^" OR po$ = "*" OR po$ = "/" OR po$ = "+" OR po$ = "-" THEN
          a = stack2(it - 2): b = stack2(it)
          IF po$ = "^" THEN
            c = a ^ b: opn$ = "exp"
          ELSEIF po$ = "*" THEN
            c = a * b: opn$ = "mul"
          ELSEIF po$ = "/" THEN
            c = a / b: opn$ = "div"
          ELSEIF po$ = "+" THEN
            c = a + b: opn$ = "add"
          ELSEIF po$ = "-" THEN
            c = a - b: opn$ = "sub"
          END IF
          'print "opn", opn$, "result=", c
          it = it - 2
          stack1$(it) = "v": stack2(it) = c
        ELSEIF po$ = "(" THEN
          a = stack2(it)
          opn$ = stack1$(it - 2)
          IF LEN(opn$) > 1 THEN 'test for func name
            FOR k = 1 TO 6
              IF opn$ = names$(k) THEN
                IF k = 1 THEN
                  c = SIN(a)
                ELSEIF k = 2 THEN
                  c = COS(a)
                ELSEIF k = 3 THEN
                  c = TAN(a)
                ELSEIF k = 4 THEN
                  c = LOG(a)
                ELSEIF k = 5 THEN
                  c = SQR(a)
                ELSEIF k = 6 THEN
                  c = ABS(a)
                ELSE
                  c = 0: iquit = ix
                END IF
              END IF
            NEXT
            it = it - 2
            stack1$(it) = "v": stack2(it) = c:
            'print "opn", opn$, "result=", c
            ktest = 0
          ELSE 'assume simple parens
            it = it - 1
            stack1$(it) = "v": stack2(it) = stack2(it + 1)
            'print "scrub          parens"
            ktest = 0
          END IF
        ELSEIF po$ = "[" THEN
          result = stack2(it)
          it = it - 2: ktest = 0
        END IF
      END IF
      IF kpush = 1 THEN
        it = it + 1: stack1$(it) = char$: stack2(it) = 0
        'print "push", char$
      END IF
    WEND
    IF char$ = "]" THEN
      iquit = ix
    END IF
  END IF
WEND
kerr = 0
IF iquit <> lx THEN
  PRINT ".....Input error"
  PRINT " " + MID$(expr$, 2, lx - 2)
  FOR I = 1 TO iquit - 1
    PRINT " ";
  NEXT
  PRINT "^": kerr = 1
  RETURN
END IF
IF it <> 0 THEN
  PRINT "expression format error": kerr = 1
  RETURN
END IF
PRINT "result=", result
RETURN
'................................................
' plot the matrix
'inputs=im,jm,vmat,xtitle$,ytitle$
'output is a plot on the screen
matplot:
'DIM vmat(2500)                'moved!!!!!!!!!!!!!!!!!
DIM css$(45)
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
css$(40) = "37252231"'(
css$(41) = "37454231"')
css$(42) = "2545002343" '=
css$(43) = "1454003632002642002246"'*
css$(44) = "2147" '/
css$(45) = "133753003731"'^
xmin = vmat(1): xmax = xmin
ymin = vmat(1 + im): ymax = ymin
FOR I = 1 TO im
  v = vmat(I)
  IF v < xmin THEN
    xmin = v
  END IF
  IF v > xmax THEN
    xmax = v
  END IF
  FOR j = 2 TO jm
     v = vmat(I + (j - 1) * im)
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
 kerr = 1
 RETURN
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
 ymax = ymax + 1: ymin = ymin - 1: yrange = yrange + 2
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
FOR I = pxmin TO pxmax STEP pqx    ' draw verticals
  LINE (I, 480 - pymin + 5)-(I, 480 - pymax), 0, , &HF0F0
  IF ABS(vn) < qx / 50 THEN
    vn = 0
  END IF
  vs$ = STR$(vn)
  xn = I - INT(LEN(vs$) * 6 / 2): yn = 480 - pymin + 20
  GOSUB numb
  vn = qxmin + ii * qx: ii = ii + 1
NEXT
vn = qymin: mn = 0: ii = 1
FOR I = pymin TO pymax STEP pqy    ' draw horizontals
  LINE (pxmin - 5, 480 - I)-(pxmax, 480 - I), 0, , &HF0F0
  xn = pxmin - 60: yn = 480 - I + 8  'x,y-start position for line value
  IF ABS(vn) < qy / 50 THEN
    vn = 0
  END IF
  vs$ = STR$(vn)
  GOSUB numb
  vn = qymin + ii * qy: ii = ii + 1
NEXT
'..............add titles
vs$ = xtitle$: xn = 350 - LEN(vs$) * 3: yn = 450: mn = 0: GOSUB numb
vs$ = ytitle$: xn = 30: yn = 240 - LEN(vs$) * 4: mn = 1: GOSUB numb
'..............now plot
rx = (pxmax - pxmin) / (qxmax - qxmin)
ry = (pymax - pymin) / (qymax - qymin)
FOR j = 2 TO jm
  FOR I = 1 TO im
    px1 = px2: py1 = py2
    px2 = pxmin + rx * (vmat(I) - qxmin)
    py2 = pymin + ry * (vmat(I + (j - 1) * im) - qymin)
    IF I <> 1 THEN
      LINE (px1, 480 - py1)-(px2, 480 - py2), kolors(j - 2)
      END IF
  NEXT
NEXT
INPUT "press ENTER to continue", k$
RETURN

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
  ELSEIF k = 40 THEN
    k = 40
  ELSEIF k = 41 THEN
    k = 41
  ELSEIF k = 61 THEN
    k = 42
  ELSEIF k = 42 THEN
    k = 43
  ELSEIF k = 47 THEN
    k = 44
  ELSEIF k = 94 THEN
    k = 45
  ELSE
    k = 39   'default = blank
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



