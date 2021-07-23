' sort matrix on particular column
DIM vmat(2500)
DIM ibeg(100), iend(100)  'stack to hold partition beg. and end indices
'...................read matrix
CLS
INPUT "Enter matrix file name=", iname$
l = LEN(iname$)
IF l > 5 THEN
 x$ = MID$(iname$, l - 3, 4)
 IF x$ <> ".MAT" AND x$ <> ".mat" THEN
   iname$ = iname$ + ".MAT"
 END IF
ELSE
  iname$ = iname$ + ".MAT"
END IF
OPEN iname$ FOR INPUT AS #1
INPUT #1, im, jm 'read matrix i and j
FOR i = 1 TO im
  FOR j = 1 TO jm
    INPUT #1, vmat(i + (j - 1) * im)
  NEXT
NEXT

INPUT "Enter no. of column on which to sort the matrix=", jcol
IF jcol > jm OR jcol < 1 THEN
  PRINT "illegal column number":
  INPUT "press any key", x: STOP
END IF

INPUT "Enter output matrix file name=", oname$
l = LEN(oname$)
IF l > 5 THEN
 x$ = MID$(oname$, l - 3, 4)
 IF x$ <> ".MAT" AND x$ <> ".mat" THEN
   oname$ = oname$ + ".MAT"
 END IF
ELSE
  oname$ = oname$ + ".MAT"
END IF
OPEN oname$ FOR OUTPUT AS #2

jbias = (jcol - 1) * im  'bias to aid in indexing proper column
istack = 1: ibeg(1) = 1: iend(1) = im  'preset stack
WHILE istack <> 0
  ib = ibeg(istack): ie = iend(istack)
  istack = istack - 1 'define new chunk
  test = vmat((ib + ie) / 2 + jbias)  'define test value
  ilo = ib - 1: ihi = ie + 1
  'PRINT "ib,ie=", ib, ie: INPUT x
  DO
    DO                                       'from the low end
      IF ihi - ilo > 1 THEN   'something to work on
        IF vmat(ilo + 1 + jbias) < test THEN   'test vmat(ilo+1,jcol)
          ilo = ilo + 1
        ELSE
          EXIT DO
        END IF
      ELSE
        EXIT DO
      END IF
    LOOP

    DO                                       'from the high end
      IF ihi - ilo > 1 THEN 'something to work on
        IF vmat(ihi - 1 + jbias) > test THEN  'test vmat(ihi - 1, jcol)
          ihi = ihi - 1
        ELSE
          EXIT DO
        END IF
      ELSE
        EXIT DO
      END IF
    LOOP

    IF ihi - ilo > 2 THEN
      'advance, swap vmat(ilo,...) and vmat(ihi,...) and continue
      ilo = ilo + 1: ihi = ihi - 1
      FOR jj = 1 TO jm
        jjbias = (jj - 1) * im
        temp = vmat(ilo + jjbias)
        vmat(ilo + jjbias) = vmat(ihi + jjbias)
        vmat(ihi + jjbias) = temp
      NEXT
    ELSE
      EXIT DO
    END IF
  LOOP
  IF ilo > ib THEN
    istack = istack + 1: ibeg(istack) = ib: iend(istack) = ilo
  END IF
  IF ihi < ie THEN   'was ilo
    istack = istack + 1: ibeg(istack) = ihi: iend(istack) = ie
  END IF
WEND
'............output the matrix
WRITE #2, im, jm    ' matrix i and j
FOR i = 1 TO im
  FOR j = 1 TO jm
    WRITE #2, vmat(i + (j - 1) * im)
  NEXT

NEXT




FOR i = 1 TO im
  PRINT vmat(i + jbias)
NEXT
STOP




