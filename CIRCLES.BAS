CLS
1 PRINT "What should the maximum circle radius be? (1 to 500)"
INPUT t
IF t > 500 THEN PRINT "Too large!": GOTO 1
IF t < 1 THEN PRINT "Too small!": GOTO 1
DO WHILE INKEY$ = ""
randa = INT(RND * 640)
randb = INT(RND * 480)
SCREEN 12
COLOR INT(RND * 15)
FOR x = 1 TO INT(RND * t + 1)
 CIRCLE (randa, randb), x
NEXT
LOOP
SLEEP
SCREEN 0
COLOR 7
PRINT "                           ���������������������˻"
PRINT "                           ��������������������͹�"
PRINT "                           �������������������ʻ��"
PRINT "                           �̹  �����������Ŀ  ̹�"
PRINT "                           ������           �Ŀ���"
PRINT "                           ����   XENOPHOBE   ����"
PRINT "                           ����  ENTERPRISES  ����"
PRINT "                           ̹Ǵ      INC.     ö̹"
PRINT "                           ����  E-Mail me at ����"
PRINT "                           ����   XENOPHOBEI  ����"
PRINT "                           ����Ŀ  @AOL.COM ��ٺ��"
PRINT "                           �̹  �������������  ̹�"
PRINT "                           �������������������˼��"
PRINT "                           ��������������������͹�"
PRINT "                           ���������������������ʼ"


