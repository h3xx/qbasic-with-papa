
1 REM program to eliminate tabs tab    tab     tab
2  LINE INPUT "enter input file name="; INNAME$

3 OPEN INNAME$ FOR INPUT AS 1
4 LINE INPUT "enter output file name="; OUTNAME$
5 OPEN OUTNAME$ FOR OUTPUT AS 2
6 N = 0: RO$ = ""
15 IF NOT (EOF(1)) THEN 22
17 CLOSE 1: CLOSE 2: STOP
22 LINE INPUT #1, RI$: PRINT "."; : N = N + 1
25 IF N <> 60 THEN 31
27 PRINT : N = 0
31 L = LEN(RI$)
32 FOR K = 1 TO L
33 c$ = MID$(RI$, K, 1)
40 IF ASC(c$) = 9 THEN c$ = "?"
42 RO$ = RO$ + c$
45 NEXT K
58 PRINT #2, RO$: RO$ = "": GOTO 15

