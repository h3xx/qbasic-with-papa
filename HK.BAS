5 OPEN "hk.txt" FOR OUTPUT AS #1
10 FOR i = .25 TO .5 STEP .25
20 PRINT #1, USING "####.##"; i; i * .1291
30 NEXT i
40 FOR i = 1 TO 9 STEP 1
45 PRINT #1, USING "####.##"; i; i * .1291
50 NEXT i
60 FOR i = 10 TO 75 STEP 5
70 PRINT #1, USING "####.##"; i; i * .1291
80 NEXT i
90 FOR i = 100 TO 900 STEP 50
100 PRINT #1, USING "####.##"; i; i * .1291
110 NEXT i
120 FOR i = 1000 TO 2250 STEP 250
130 PRINT #1, USING "####.##"; i; i * .1291
140 NEXT i
150 STOP







