CLS
PRINT "This is a program to find the circimference of a circle."
1 PRINT "Do you want to input the <D>Diameter or the <R>Radius?"
INPUT s$
IF LEFT$(s$, 1) = "d" OR LEFT$(s$, 1) = "D" THEN
   PRINT "Input the diameter."
   INPUT d
   LET c = 3.14159265359# * d
   PRINT "The circumference is"; c
   GOTO 2
   END IF
IF LEFT$(s$, 1) = "r" OR LEFT$(s$, 1) = "R" THEN
   PRINT "Input the radius"
   INPUT r
   LET c = 2 * 3.14159265359# * d
   PRINT "The circumference is"; c
   GOTO 2
   END IF
GOTO 1
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

