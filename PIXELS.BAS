SCREEN 12
DO WHILE INKEY$ = ""
 FOR x = 1 TO 100000
 COLOR INT(RND * 15)
 RANDA = RND
 RANDB = RND
 LINE (RANDA * 640, RANDB * 480)-(RANDA * 640, RANDB * 480)
 IF INKEY$ <> "" THEN GOTO 1
 NEXT
 CLS
LOOP
COLOR 7
1 SCREEN 0
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

