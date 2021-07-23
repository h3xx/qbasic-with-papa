CLS
1 PRINT "What should the maximum circle radius be? (1 to 500)"
INPUT t
IF t > 500 THEN PRINT "Too large!": GOTO 1
IF t < 1 THEN PRINT "Too small!": GOTO 1
DO WHILE INKEY$ = ""
randa = INT(RND * 640)
randb = INT(RND * 480)
SCREEN 12
COLOR INT(RND * 15)
FOR x = 1 TO INT(RND * t + 1)
 CIRCLE (randa, randb), x
NEXT
LOOP
SLEEP
SCREEN 0
COLOR 7
PRINT "                           ÉËÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍË»"
PRINT "                           ºÌÍËÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍËÍ¹º"
PRINT "                           ººÉÊÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÊ»ºº"
PRINT "                           ºÌ¹  ÚÄÄÄÄÄÁÄÄÄÄÄ¿  Ì¹º"
PRINT "                           ºººÚÄÙ           ÀÄ¿ººº"
PRINT "                           ººº³   XENOPHOBE   ³ººº"
PRINT "                           ººº³  ENTERPRISES  ³ººº"
PRINT "                           Ì¹Ç´      INC.     Ã¶Ì¹"
PRINT "                           ººº³  E-Mail me at ³ººº"
PRINT "                           ººº³   XENOPHOBEI  ³ººº"
PRINT "                           ºººÀÄ¿  @AOL.COM ÚÄÙººº"
PRINT "                           ºÌ¹  ÀÄÄÄÄÄÂÄÄÄÄÄÙ  Ì¹º"
PRINT "                           ººÈËÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍË¼ºº"
PRINT "                           ºÌÍÊÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÊÍ¹º"
PRINT "                           ÈÊÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÊ¼"


