CLS
1 PRINT "What should the maximum radius of the bubbles me? (1-500)"
INPUT size
IF size > 500 THEN GOTO 1
IF size < 1 THEN GOTO 1
SCREEN 12
DO WHILE INKEY$ = ""
x = INT(RND * 640 + 1)
y = INT(RND * 480 + 1)
COLOR INT(RND * 16)
CIRCLE (x, y), INT(RND * size)
LOOP
SLEEP
SCREEN 0
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
COLOR 7

