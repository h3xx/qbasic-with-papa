CLS
0 PRINT "Is your computer's processor <1>286 <2>386 or <3>486 ?"
INPUT c
IF c = 1 OR c = 2 OR c = 3 THEN GOTO 1
GOTO 0
1 PRINT "Options: <1>Random color <2>Random placement <3>Both or <4>None"
INPUT o
IF o = 1 OR o = 2 OR o = 3 OR o = 4 THEN GOTO 2
GOTO 1
2 PRINT "Count down from what number?"
INPUT n
IF n = 1 OR n < 1 THEN
 PRINT "Too small"
 GOTO 2
 END IF
IF n > 1000000 THEN
PRINT "Too large"
GOTO 2
END IF
3 IF c = 1 THEN PRINT "What delay rate? 1000 counts by seconds. Big numbers make it go slower"
IF c = 2 THEN PRINT "What delay rate? 2500 counts by seconds. Big numbers make it go slower"
IF c = 3 THEN PRINT "What delay rate? 5000 counts by seconds. Big numbers make it go slower"
INPUT b
IF b < 2 THEN PRINT "Too small.": GOTO 3
IF b > 7000 THEN PRINT "Too large": GOTO 3
t = INT(n): r = INT(b)
4 CLS
IF t < 0 THEN
 PRINT 0
 PRINT "BLAST OFF!!!"
 END
 END IF
IF o = 1 THEN COLOR INT(RND * 14 + 1): LOCATE 13, 37
IF o = 2 THEN COLOR 7: LOCATE INT(RND * 23 + 1), INT(RND * 78 + 1)
IF o = 3 THEN COLOR INT(RND * 14 + 1): LOCATE INT(RND * 23 + 1), INT(RND * 78 + 1)
IF o = 4 THEN COLOR 7: LOCATE 13, 37
PRINT t
5 r = r - 1
IF r = 0 THEN t = t - 1: r = INT(b): GOTO 4
IF t = 0 THEN PRINT "BLAST OFF!!!": SLEEP: GOTO 6
GOTO 5
6 CLS
COLOR 7
PRINT "                          ÉËÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÍÍË»"
PRINT "                          ºÌÍËÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍËÍ¹º"
PRINT "                          ººÉÊÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÊ»ºº"
PRINT "                          ºÌ¹  ÚÄÄÄÄÄÁÄÄÄÄÄ¿  Ì¹º"
PRINT "                          ºººÚÄÙ           ÀÄ¿ººº"
PRINT "                          ººº³   XENOPHOBE   ³ººº"
PRINT "                          ººº³  ENTERPRISES  ³ººº"
PRINT "                          Ì¹Ç´      INC.     Ã¶Ì¹"
PRINT "                          ººº³  E-Mail me at ³ººº"
PRINT "                          ººº³   XENOPHOBEI  ³ººº"
PRINT "                          ºººÀÄ¿  @AOL.COM ÚÄÙººº"
PRINT "                          ºÌ¹  ÀÄÄÄÄÄÂÄÄÄÄÄÙ  Ì¹º"
PRINT "                          ººÈËÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍË¼ºº"
PRINT "                          ºÌÍÊÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÊÍ¹º"
PRINT "                          ÈÊÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÍÍÊ¼"
END

