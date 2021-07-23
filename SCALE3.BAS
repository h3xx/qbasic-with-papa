DO WHILE INKEY$ = ""
FOR i = 0 TO 84
  s$ = STR$(i)
  ps$ = "l64" + "n" + s$
 PRINT i
 IF INKEY$ <> "" THEN GOTO 1
 PLAY ps$: CLS
NEXT i
FOR i = 84 TO 0 STEP -1
  s$ = STR$(i)
  ps$ = "l64" + "n" + s$
 PRINT i
 IF INKEY$ <> "" THEN GOTO 1
 PLAY ps$: CLS
NEXT i
LOOP
1 CLS
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

