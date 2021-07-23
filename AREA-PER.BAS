CLS
PRINT "This is a program to find the area and perimeter of a rectangle."
1 PRINT "What is the length?"
INPUT l
IF l < 0 THEN GOTO 1
2 PRINT "What is the width?"
INPUT w
IF w < 0 THEN GOTO 2
LET a = l * w
LET p = (2 * l) + (2 * w)
PRINT "The area is"; a; "units squared"
PRINT "The perimeter is"; p; "units"
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

