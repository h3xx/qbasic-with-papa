DO WHILE INKEY$ = ""
  sn$ = STR$(INT(RND * 84))
  sl$ = STR$(INT(RND * 63) + 1)
  ps$ = "n" + sn$ + " l" + sl$
 IF INKEY$ <> "" THEN GOTO 1
 PRINT ps$
 PLAY ps$: CLS
LOOP
CLS
1 PRINT "                          ���������������������˻"
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

