CLS
SCREEN 12
DO WHILE INKEY$ = ""
FOR X = 1 TO 800
 COLOR INT(RND * 15)
 CIRCLE (0, 0), X
 IF INKEY$ <> "" THEN GOTO ENDLINE
NEXT
FOR y = 1 TO 800
 COLOR INT(RND * 15)
 CIRCLE (0, 480), y
 IF INKEY$ <> "" THEN GOTO ENDLINE
NEXT
FOR z = 1 TO 825
 COLOR INT(RND * 15)
 CIRCLE (640, 480), z
 IF INKEY$ <> "" THEN GOTO ENDLINE
NEXT
FOR n = 1 TO 825
 COLOR INT(RND * 15)
 CIRCLE (640, 0), n
NEXT
LOOP
ENDLINE: COLOR 7
SCREEN 0
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

