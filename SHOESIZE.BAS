CLS
PRINT "This is a program to determine men's shoe sizes."
1 PRINT "What is the length of your foot in inches?"
INPUT f
LET s = 3 * f - 24
PRINT "Your shoe size is"; s
2 PRINT "Would you like to start again?"
INPUT q$
IF LEFT$(q$, 1) = "y" OR LEFT$(q$, 1) = "Y" THEN GOTO 1
IF LEFT$(q$, 1) = "n" OR LEFT$(q$, 1) = "N" THEN GOTO 3
GOTO 2
3 CLS
COLOR 7
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

