' Word-Processor to Editor Reformatter
' program to reformat a file
' from the word-processor (WRITE program) format
'(no carriage returns, except between paragraphs)
' to the text-edit (EDIT or NOTEPAD) format
' (carriage return after each line)
1 REM PROGRAM WPTOED
2 LINE INPUT "enter input file name="; INNAME$
3 OPEN INNAME$ FOR INPUT AS 1
4 LINE INPUT "enter output file name="; OUTNAME$
5 OPEN OUTNAME$ FOR OUTPUT AS 2
7 W = -1
9 IF W >= 0 AND W <= 100 THEN 15
11 INPUT "Enter column width, 1 to 100=", W: GOTO 9
15 IF NOT (EOF(1)) THEN 22
17 CLOSE 1: CLOSE 2: STOP
22 LINE INPUT #1, RECD$: PRINT "."; : N = N + 1
25 IF N <> 60 THEN 31
27 PRINT : N = 0
31 L = LEN(RECD$)
33 IF L <= W THEN 58
35 K = W: T = 0
38 IF K <= 0 OR T <> 0 THEN 48
40 IF MID$(RECD$, K, 1) = " " OR MID$(RECD$, K + 1, 1) <> " " THEN 45
42 T = K + 1
45 K = K - 1: GOTO 38
48 IF T <> 0 THEN 53
50 T = W
53 PRINT #2, MID$(RECD$, 1, T): RECD$ = MID$(RECD$, T + 1, L): L = L - T
56 GOTO 33
58 PRINT #2, RECD$: GOTO 15
32000 REM !!!!!! 0  PASS-ONE ERRORS
32001 REM !!!!!! 0  PASS-TWO ERRORS

