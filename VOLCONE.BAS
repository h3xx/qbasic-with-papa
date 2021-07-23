CLS
PRINT "This is a program to compute the volume of a cone."
1 PRINT "What is the radius of the open end of the cone?"
INPUT r
PRINT "What is the height of the cone?"
INPUT h
V = (1 / 3) * 3.14159265359# * (r ^ 2) * h
PRINT "The volume of the cone is"; V; "cubic units."
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

