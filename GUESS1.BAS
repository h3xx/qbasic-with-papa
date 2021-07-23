10 CLS
   PRINT "I chose a number from 1 to 100,000. Try to guess it."
   r = 0
   n = RND * 99999: n = INT(n) + 1
50 INPUT g: r = r + 1
   IF g < n THEN PRINT g; "is too small": GOTO 50
   IF g > n THEN PRINT g; "is too big": GOTO 50
   IF g = n THEN PRINT "CONGRATULATIONS"
   IF r = 1 THEN PRINT "You got it in 1 guess"
100 IF r > 1 THEN PRINT "You got it in"; r; "guesses"
    PRINT "Do you want to play again?"
    INPUT p$
    IF LEFT$(p$, 1) = "y" OR LEFT$(p$, 1) = "Y" THEN GOTO 10
    IF LEFT$(p$, 1) = "n" OR LEFT$(p$, 1) = "N" THEN GOTO 160
    GOTO 100
160 END

