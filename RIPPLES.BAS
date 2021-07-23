CLS
SCREEN 12
DO WHILE INKEY$ = ""
FOR X = 1 TO 800
 COLOR INT(RND * 15)
 CIRCLE (0, 0), X
 IF INKEY$ <> "" THEN GOTO ENDLINE
NEXT
FOR y = 1 TO 800
 COLOR INT(RND * 15)
 CIRCLE (0, 480), y
 IF INKEY$ <> "" THEN GOTO ENDLINE
NEXT
FOR z = 1 TO 825
 COLOR INT(RND * 15)
 CIRCLE (640, 480), z
 IF INKEY$ <> "" THEN GOTO ENDLINE
NEXT
FOR n = 1 TO 825
 COLOR INT(RND * 15)
 CIRCLE (640, 0), n
NEXT
LOOP
ENDLINE: COLOR 7
SCREEN 0
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

