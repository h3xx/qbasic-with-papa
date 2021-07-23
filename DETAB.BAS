
' program to eliminate tabs tab    tab     tab
  DIM itabs(6)
  LINE INPUT "enter input file name="; INNAME$
  OPEN INNAME$ FOR INPUT AS 1
  LINE INPUT "enter output file name="; OUTNAME$
  OPEN OUTNAME$ FOR OUTPUT AS 2
  LINE INPUT "enter positions of tabs (integers separated by commas)="; RI$
  
  L = LEN(RI$): ntabs = 0
  IF L <> 0 THEN
    n = 0
    FOR k = 1 TO L
      c$ = MID$(RI$, k, 1)
      IF c$ = "," THEN
        ntabs = ntabs + 1
        IF ntabs <= 6 THEN
          itabs(ntabs) = n: n = 0
        END IF
      ELSE
        n = n * 10 + ASC(c$) - ASC("0")
      END IF
      IF k = L THEN
        ntabs = ntabs + 1
        IF ntabs <= 6 THEN
          itabs(ntabs) = n: n = 0
        END IF
      END IF
    NEXT k
  END IF
  IF ntabs <> 0 THEN
    FOR i = 1 TO ntabs
      PRINT itabs(i)
    NEXT i
  END IF
  n = 0: RO$ = ""
top:
  IF EOF(1) THEN
    CLOSE 1: CLOSE 2: STOP
  END IF
  LINE INPUT #1, RI$: PRINT "."; : n = n + 1
  IF n = 60 THEN
    PRINT : n = 0
  END IF
  L = LEN(RI$)
  FOR k = 1 TO L
    c$ = MID$(RI$, k, 1)
    IF ASC(c$) = 9 THEN c$ = "?" 'hey!!!!!!!!!!
      RO$ = RO$ + c$
  NEXT k
  PRINT #2, RO$: RO$ = "": GOTO top

