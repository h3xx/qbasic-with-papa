' Regression Fit  16 October 1989
'reads matrix file
'with values m,n, then m rows of n values
' first column are measured values of dependent variable y
' next n-1 columns are measured values
' of independent variables x1, x2, x3, etc.
' calculates least squares fit to get constants c1, c2, c3, c4, etc.
' for the approximation
' y= c1*x1+c2*x2+c3*x3............
' can accept up to 100 y values in 10 independent variables.

DIM x(100, 10)  'up to 100 samples of up to 10 indep. variables
DIM y(100)  'up to 100 samples of dependent variable
DIM cmat(10, 10), cvect(10) 'matrix and vector for calculation
DIM cfinal(10) ' holds final coefficients
DIM prow(10), pcol(10)' row and col. marking vectors
DIM xmag(10), ymag 'magnitudes of up to 10 x vectors and 1 y vector
'...................read matrix
CLS
INPUT "Enter matrix file name=", mname$
l = LEN(mname$)
IF l > 5 THEN
 x$ = MID$(mname$, l - 3, 4)
 IF x$ <> ".MAT" AND x$ <> ".mat" THEN
   mname$ = mname$ + ".MAT"
 END IF
ELSE
  mname$ = mname$ + ".MAT"
END IF
PRINT mname$
OPEN mname$ FOR INPUT AS #1
INPUT #1, m, n 'read matrix m and n
IF m > 100 THEN
  PRINT "matrix i-dim. too large": STOP
END IF
IF n > 11 THEN
  PRINT "matrix j dimension too large": STOP
END IF
nm1 = n - 1
FOR i = 1 TO m
  INPUT #1, y(i)
  FOR j = 1 TO nm1
    INPUT #1, x(i, j)
  NEXT
NEXT
'-------------------compute magnitudes of vectors
sum = 0
FOR i = 1 TO m
  sum = sum + y(i) ^ 2
NEXT
ymag = SQR(sum)
FOR j = 1 TO nm1
  sum = 0
  FOR i = 1 TO m
    sum = sum + x(i, j) ^ 2
  NEXT
  xmag(j) = SQR(sum)
NEXT
'--------------------form calculation matrix = transpose([x]) * [x]
FOR i = 1 TO nm1
  FOR j = 1 TO nm1
    sum = 0
    FOR k = 1 TO m
      sum = sum + x(k, i) * x(k, j)
    NEXT
    cmat(i, j) = sum
  NEXT
NEXT
'-------------------form calculation vector = transpose([x]) * [y]
FOR i = 1 TO nm1
  sum = 0
  FOR k = 1 TO m
    sum = sum + x(k, i) * y(k)
  NEXT
  cvect(i) = sum
NEXT
' -------------------------print correlation matrix and vector
PRINT "CORRELATION MATRIX"
FOR i = 1 TO nm1
  FOR j = 1 TO nm1
    PRINT USING " .######^^^^"; cmat(i, j) / xmag(i) / xmag(j);
  NEXT
  PRINT "  ";
  PRINT USING ".######^^^^"; cvect(i) / xmag(i) / ymag
NEXT
'--------------------------solve system for c values
FOR i = 1 TO nm1
  prow(i) = 0: pcol(i) = 0'clear marking vectors
NEXT
FOR ipiv = 1 TO nm1      ' major loop for i pivots
  krow = 0
  FOR i = 1 TO nm1     'find biggest unused pivot
    FOR j = 1 TO nm1
      IF prow(i) = 0 THEN
        IF pcol(j) = 0 THEN
          IF krow = 0 THEN
            xmax = ABS(cmat(i, j)): krow = i: kcol = j
          ELSE
            xval = ABS(cmat(i, j))
            IF xval > xmax THEN
              xmax = xval: krow = i: kcol = j
            END IF
          END IF
        END IF
      END IF
    NEXT
  NEXT
  prow(krow) = kcol: pcol(kcol) = krow    'mark pivot
  vpivot = cmat(krow, kcol)
  FOR j = 1 TO nm1       'divide key row by pivot
    cmat(krow, j) = cmat(krow, j) / vpivot
  NEXT
  cvect(krow) = cvect(krow) / vpivot
  ' next, null-out other entries in key col.
  FOR i = 1 TO nm1
    IF i <> krow THEN
      ratio = cmat(i, kcol)
      FOR j = 1 TO nm1
        cmat(i, j) = cmat(i, j) - ratio * cmat(krow, j)
      NEXT
      cvect(i) = cvect(i) - ratio * cvect(krow)
    END IF
  NEXT
NEXT
FOR i = 1 TO nm1
  FOR j = 1 TO nm1
    IF prow(j) = i THEN
      cfinal(i) = cvect(j)
      PRINT "Coeff. ";
      PRINT USING "##"; i; : PRINT "=", cfinal(i)
      EXIT FOR
    END IF
  NEXT
NEXT
sum = 0
FOR i = 1 TO m
 ypred = 0
 FOR j = 1 TO nm1
  ypred = ypred + cfinal(j) * x(i, j)
 NEXT
 sum = sum + (y(i) - ypred) ^ 2
NEXT
sqrerr = SQR(sum) / m
PRINT "Error = sqroot(sum(y_predicted-y_actual)^2)/m = ", sqrerr


 


