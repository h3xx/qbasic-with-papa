CLS
1 PRINT "What should the maximum radius of the bubbles me? (1-500)"
INPUT size
IF size > 500 THEN GOTO 1
IF size < 1 THEN GOTO 1
SCREEN 12
DO WHILE INKEY$ = ""
x = INT(RND * 640 + 1)
y = INT(RND * 480 + 1)
COLOR INT(RND * 16)
CIRCLE (x, y), INT(RND * size)
LOOP
SLEEP
SCREEN 0
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
COLOR 7

