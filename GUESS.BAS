10 CLS
20 PRINT "I chose a number from 1 to 100,000. Try to guess it."
30 r = 0
40 n = RND * 99999: n = INT(n) + 1
50 INPUT g: r = r + 1
60 IF g < n THEN PRINT g; "is too small": GOTO 50
70 IF g > n THEN PRINT g; "is too big": GOTO 50
80 IF g = n THEN PRINT "CONGRATULATIONS"
90 IF r = 1 THEN PRINT "You got it in 1 guess"
100 IF r > 1 THEN PRINT "You got it in"; r; "guesses"
110 PRINT "Do you want to play again?"
120 INPUT p$
130 IF LEFT$(p$, 1) = "y" OR LEFT$(p$, 1) = "Y" THEN GOTO 10
140 IF LEFT$(p$, 1) = "n" OR LEFT$(p$, 1) = "N" THEN
 CLS
 PRINT "                          ษหอออออออออหอออออออออหป"
 PRINT "                          บฬอหอออออออสอออออออหอนบ"
 PRINT "                          บบษสอออออออัอออออออสปบบ"
 PRINT "                          บฬน  ฺฤฤฤฤฤมฤฤฤฤฤฟ  ฬนบ"
 PRINT "                          บบบฺฤู           ภฤฟบบบ"
 PRINT "                          บบบณ   XENOPHOBE   ณบบบ"
 PRINT "                          บบบณ  ENTERPRISES  ณบบบ"
 PRINT "                          ฬนวด      INC.     รถฬน"
 PRINT "                          บบบณ  E-Mail me at ณบบบ"
 PRINT "                          บบบณ   XENOPHOBEI  ณบบบ"
 PRINT "                          บบบภฤฟ  @AOL.COM ฺฤูบบบ"
 PRINT "                          บฬน  ภฤฤฤฤฤยฤฤฤฤฤู  ฬนบ"
 PRINT "                          บบศหอออออออฯอออออออหผบบ"
 PRINT "                          บฬอสอออออออหอออออออสอนบ"
 PRINT "                          ศสอออออออออสอออออออออสผ"
 END
 END IF
150 GOTO 100


