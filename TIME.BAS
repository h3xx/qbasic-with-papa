10 CLS
20 PRINT "Count down from what number?"
30 INPUT n
40 PRINT "What delay rate? 5000 counts by seconds. Big numbers make it go slower"
50 INPUT b
60 t = INT(n): r = INT(b)
70 CLS
80 PRINT t
90 r = r - 1
100 IF r = 0 THEN t = t - 1: r = INT(b): GOTO 70
110 IF t = 0 THEN PRINT "BLAST OFF!!!": END
120 GOTO 90

