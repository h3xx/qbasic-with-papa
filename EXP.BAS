CLS
PRINT "This is a program to compute exponential growth."
1 PRINT "What is the ammount at the beginning?"
INPUT b
PRINT "What are you multiplying by?"
INPUT g
PRINT "How many time periods?"
INPUT t
LET a = b * g ^ t
PRINT "The total ammount is"; a
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

