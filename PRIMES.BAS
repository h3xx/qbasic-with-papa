' prime no. program
CLS 'clear screen
FOR n = 3 TO 2000
  FOR d = 2 TO n - 1
    IF INT(n / d) * d = n THEN
      GOTO fail
    END IF
  NEXT d
  PRINT n
fail:
NEXT n
STOP


