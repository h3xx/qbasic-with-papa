10 CLS
20 PRINT "This is a program to find the density of an object"
30 PRINT "How many grams is the mass (weight) of the object?"
40 INPUT m
50 PRINT "How many cubic centimeters are in the volume of the object?"
60 INPUT a
70 d = m / a
80 IF d = 1 THEN PRINT "The density of the object is 1 gram per cubic centimeter"
90 IF d > 1 OR d < 1 THEN PRINT "The density of the object is"; d; "grams per cubic centimeter"
100 PRINT "Do you want to start again?"
110 INPUT p$
120 IF LEFT$(p$, 1) = "y" OR LEFT$(p$, 1) = "Y" THEN GOTO 10
130 IF LEFT$(p$, 1) = "n" OR LEFT$(p$, 1) = "N" THEN
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
140 GOTO 100


