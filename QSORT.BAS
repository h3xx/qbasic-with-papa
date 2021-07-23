' qsort matrix on particular column

DIM a(50)                'matrix to be sorted
DIM istack1(100), istack2(100)  'index stack
CLS
FOR i = 1 TO 50           'fill matrix with random nos.
  a(i) = RND * 200
NEXT

imax = 50            'no. of vals in matrix
ist = 1: istack1(1) = 1: istack2(1) = imax  'set up stack
WHILE ist <> 0
  ib = istack1(ist): ie = istack2(ist)
  ist = ist - 1 'define new chunk
  test = a((ib + ie) / 2)'define test value
  ilo = ib: ihi = ie
  DO
    DO                                       'from the low end
      IF ihi >= ilo THEN  'something to work on
        IF a(ilo) < test THEN
          ilo = ilo + 1
        ELSE
          EXIT DO
        END IF
      ELSE
        EXIT DO
      END IF
    LOOP

    DO                                       'from the high end
      IF ihi >= ilo THEN  'something to work on
        IF a(ihi) > test THEN
          ihi = ihi - 1
        ELSE
          EXIT DO
        END IF
      ELSE
        EXIT DO
      END IF
    LOOP

    IF ihi > ilo THEN
      'advance, swap and continue
      temp = a(ilo): a(ilo) = a(ihi):
      a(ihi) = temp
      ilo = ilo + 1: ihi = ihi - 1
    ELSE
      EXIT DO
    END IF
  LOOP
  IF ilo > ib + 1 THEN
    ist = ist + 1: istack1(ist) = ib: istack2(ist) = ilo - 1
  END IF
  IF ihi < ie - 1 THEN
    ist = ist + 1: istack1(ist) = ihi + 1: istack2(ist) = ie
  END IF
WEND
FOR i = 1 TO 50
  PRINT a(i)
NEXT

STOP




