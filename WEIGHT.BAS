CLS
1 PRINT "I can estimate the weight of an average adult from just knowing their height."
PRINT "Input their height in feet."
INPUT f
PRINT "Input the number of left over inches"
INPUT i
h = (12 * f) + i
LET w = (11 / 2) * h - 220
PRINT "Your weight in pounds is"; w
2 PRINT "Would you like to start again?"
INPUT q$
IF LEFT$(q$, 1) = "y" OR LEFT$(q$, 1) = "Y" THEN GOTO 1
IF LEFT$(q$, 1) = "n" OR LEFT$(q$, 1) = "N" THEN
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
GOTO 2

