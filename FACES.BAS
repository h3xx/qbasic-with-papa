CLS
0 PRINT "Do you want <1> Monochrome or <2> Color"
INPUT col
IF col <> INT(col) THEN GOTO 0
IF col < 1 OR col > 2 THEN GOTO 0
CLS
1 RAND = RND
IF RAND < .3333333333333333# THEN
 LOCATE INT(RND * 23 + 1), INT(RND * 80 + 1)
 PRINT " "
END IF
IF RAND < .6666666666666666# AND RAND > .3333333333333333# THEN
 IF col = 2 THEN COLOR INT(RND * 14 + 1)
 LOCATE INT(RND * 23 + 1), INT(RND * 80 + 1)
 PRINT CHR$(1)
 END IF
IF RAND <= 1 AND RAND > .6666666666666666# THEN
 IF col = 2 THEN COLOR INT(RND * 14 + 1)
 LOCATE INT(RND * 23 + 1), INT(RND * 80 + 1)
 PRINT CHR$(2)
 END IF
IF INKEY$ <> "" THEN GOTO 2
GOTO 1
2 CLS
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

