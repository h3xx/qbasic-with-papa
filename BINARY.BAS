CLS
0 PRINT "Do you want <1> Monochrome or <2> Color"
INPUT col
IF col <> INT(col) THEN GOTO 0
IF col < 1 OR col > 2 THEN GOTO 0
CLS
1 RAND = RND
IF RAND < .3333333333333333# THEN
 LOCATE INT(RND * 23 + 1), INT(RND * 80 + 1)
 PRINT " "
END IF
IF RAND < .6666666666666666# AND RAND > .3333333333333333# THEN
 IF col = 2 THEN COLOR INT(RND * 14 + 1)
 LOCATE INT(RND * 23 + 1), INT(RND * 80 + 1)
 PRINT "1"
 END IF
IF RAND <= 1 AND RAND > .6666666666666666# THEN
 IF col = 2 THEN COLOR INT(RND * 14 + 1)
 LOCATE INT(RND * 23 + 1), INT(RND * 80 + 1)
 PRINT "0"
 END IF
IF INKEY$ <> "" THEN GOTO 2
GOTO 1
2 CLS
COLOR 7
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

