CLS
PRINT "This is a program to determine the number of bricks needed"
PRINT "in the making of a building."
1 PRINT "Input the length of the building in yards."
INPUT k
PRINT "Input the left over feet."
INPUT j
PRINT "Input the height of the building in yards."
INPUT b
PRINT "Input the left over feet."
INPUT y
l = k + (j / 3)
h = b + (y / 3)
n = 7 * l * h
n = INT(n + .5)
IF n = 1 THEN PRINT "There is only one brick needed.": GOTO 2
PRINT "The number of bricks needed is"; n
2 PRINT "Would you like to start again?"
INPUT q$
IF LEFT$(q$, 1) = "y" OR LEFT$(q$, 1) = "Y" THEN GOTO 1
IF LEFT$(q$, 1) = "n" OR LEFT$(q$, 1) = "N" THEN
 CLS
 PRINT "                          ���������������������˻"
 PRINT "                          ��������������������͹�"
 PRINT "                          �������������������ʻ��"
 PRINT "                          �̹  �����������Ŀ  ̹�"
 PRINT "                          ������           �Ŀ���"
 PRINT "                          ����   XENOPHOBE   ����"
 PRINT "                          ����  ENTERPRISES  ����"
 PRINT "                          ̹Ǵ      INC.     ö̹"
 PRINT "                          ����  E-Mail me at ����"
 PRINT "                          ����   XENOPHOBEI  ����"
 PRINT "                          ����Ŀ  @AOL.COM ��ٺ��"
 PRINT "                          �̹  �������������  ̹�"
 PRINT "                          �������������������˼��"
 PRINT "                          ��������������������͹�"
 PRINT "                          ���������������������ʼ"
 END
 END IF
GOTO 2

