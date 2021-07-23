CLS
PRINT "This is a program to find the range of thr remaining side of a triangle."
1 PRINT "Input the length of the first side of the triangle."
INPUT a
IF a < 0 OR a = 0 THEN
 PRINT "Too small."
 GOTO 1
 END IF
2 PRINT "Input the second side of the triangle."
INPUT b
IF b < 0 OR b = 0 THEN
 PRINT "Too small."
 GOTO 2
 END IF
d = ABS(a - b)
e = a + b
PRINT "The remaining side is greater than"; d; "but less than "; e
3 PRINT "Would you like to start again?"
INPUT q$
IF LEFT$(q$, 1) = "y" OR LEFT$(q$, 1) = "Y" THEN GOTO 1
IF LEFT$(q$, 1) = "n" OR LEFT$(q$, 1) = "N" THEN
 CLS
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
 END IF
GOTO 3

