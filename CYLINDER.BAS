CLS
PRINT "This is a program to calculate the total surface area of a cylinder."
1 PRINT "Input the radius."
INPUT r
PRINT "Input the height."
INPUT h
LET sa = ((3.14159265359# * (r ^ 2)) * 2) + (3.14159265359# * 2 * r * h)
PRINT "The surface area is"; sa; "units squared. "
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

