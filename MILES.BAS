
10 REM program to convert miles to feet
 PRINT "what is your name?"
 INPUT me$
 IF me$ = "Dan" OR me$ = "Irv" THEN
    PRINT "What, you again?"
 END IF

 PRINT me$
 PRINT "WHAT IS LENGTH IN MILES?"
20 INPUT nmiles
25 IF nmiles < 0 THEN GOTO 50
30 nfeet = 5280 * nmiles
40 PRINT "THE NUMBER OF FEET IS"; nfeet
45 GOTO 10
50 END

