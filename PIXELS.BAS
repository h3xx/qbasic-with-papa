SCREEN 12
DO WHILE INKEY$ = ""
 FOR x = 1 TO 100000
 COLOR INT(RND * 15)
 RANDA = RND
 RANDB = RND
 LINE (RANDA * 640, RANDB * 480)-(RANDA * 640, RANDB * 480)
 IF INKEY$ <> "" THEN GOTO 1
 NEXT
 CLS
LOOP
COLOR 7
1 SCREEN 0
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

