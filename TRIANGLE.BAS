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
GOTO 3

