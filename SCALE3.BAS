DO WHILE INKEY$ = ""
FOR i = 0 TO 84
  s$ = STR$(i)
  ps$ = "l64" + "n" + s$
 PRINT i
 IF INKEY$ <> "" THEN GOTO 1
 PLAY ps$: CLS
NEXT i
FOR i = 84 TO 0 STEP -1
  s$ = STR$(i)
  ps$ = "l64" + "n" + s$
 PRINT i
 IF INKEY$ <> "" THEN GOTO 1
 PLAY ps$: CLS
NEXT i
LOOP
1 CLS
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

