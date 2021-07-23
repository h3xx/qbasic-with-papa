' program to accept expression in x and to evaluate it
DIM stack1$(50), stack2(50)  ' operator stack,  value stack
top:
CLS

PRINT "enter expression in x"
LINE INPUT "y=", expr$  'input expression
'PRINT "expression=", expr$
expr$ = "[" + expr$ + "]"
PRINT "enter value for x  "
INPUT "x=", x

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
      PRINT "pushx", "val=", cv
    ELSE        'assume token is a function name
      co$ = token$: cv = 0
      PRINT "push", co$
    END IF
    it = it + 1
    stack1$(it) = co$: stack2(it) = cv  'push op or value into stack
  ELSEIF char$ >= "0" AND char$ <= "9" OR char$ = "." THEN 'value
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
    PRINT "push", "val=", stack2(it)
  ELSEIF char$ = "[" OR char$ = "(" THEN
    it = it + 1: stack1$(it) = char$: stack2(it) = 0
    PRINT "push", char$
  ELSE    'other operators
    ktest = 1
    WHILE ktest = 1
      kpop = 0: kpush = 0
      IF char$ = "^" THEN
        po$ = stack1$(it - 1)
        IF po$ = "^" THEN
          kpop = 1
        ELSE
          kpush = 1: ktest = 0
        END IF
      ELSEIF char$ = "*" OR char$ = "/" THEN
        po$ = stack1$(it - 1)
        IF po$ = "^" OR po$ = "*" OR po$ = "/" THEN
          kpop = 1
        ELSE
          kpush = 1: ktest = 0
        END IF
      ELSEIF char$ = "+" OR char$ = "-" THEN
        po$ = stack1$(it)
        IF po$ = "[" OR po$ = "(" THEN 'unary
          it = it + 1: stack1$(it) = "v": stack2(it) = 0
          kpush = 1: ktest = 0
        ELSE
          po$ = stack1$(it - 1)
          IF po$ = "^" OR po$ = "*" OR po$ = "/" OR po$ = "+" OR po$ = "-" THEN
            kpop = 1
          ELSE
            kpush = 1: ktest = 0
          END IF
        END IF
      ELSEIF char$ = ")" OR char$ = "]" THEN
        po$ = stack1$(it - 1)
        kpop = 1
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
          PRINT "opn", opn$, "result=", c
          it = it - 2
          stack1$(it) = "v": stack2(it) = c
        ELSEIF po$ = "(" THEN
          a = stack2(it)
          opn$ = stack1$(it - 2)
          IF LEN(opn$) > 1 THEN 'test for func name
            IF opn$ = "sin" THEN
              c = SIN(a)
            ELSEIF opn$ = "cos" THEN
              c = COS(a)
            ELSEIF opn$ = "tan" THEN
              c = TAN(a)
            ELSEIF opn$ = "log" THEN
              c = LOG(a)
            ELSEIF opn$ = "SQR" THEN
              c = SQR(a)
            ELSEIF opn$ = "ABS" THEN
              c = ABS(a)
            ELSE
              iquit = ix
            END IF
            it = it - 2
            stack1$(it) = "v": stack2(it) = c:
            PRINT "opn", opn$, "result=", c
            ktest = 0
          ELSE 'assume simple parens
            it = it - 1
            stack1$(it) = "v": stack2(it) = stack2(it + 1)
            PRINT "scrub          parens"
            ktest = 0
          END IF
        ELSEIF po$ = "[" THEN
          result = stack2(it)
          it = it - 2: ktest = 0
        END IF
      END IF
      IF kpush = 1 THEN
        it = it + 1: stack1$(it) = char$: stack2(it) = 0
        PRINT "push", char$
      END IF
    WEND
    IF char$ = "]" THEN
      iquit = ix
    END IF
  END IF
WEND

IF iquit <> lx THEN
  PRINT ".....Input error"
  PRINT LEFT$(expr$, lx - 1)
  FOR i = 1 TO iquit - 1
    PRINT " ";
  NEXT
  PRINT "^"
END IF
PRINT "result=", result
IF it <> 0 THEN
  PRINT " parenthesis error"
  PRINT "the stack..........."
  FOR i = 1 TO it
    PRINT stack1$(i), stack2(i)
  NEXT
END IF
INPUT "enter q to quit or other key to continue  ", q$
IF q$ <> "q" THEN
  GOTO top
END IF
STOP





