CLS
top:
PRINT "WHAT IS THE NUMBER THAT YOU WOULD LIKE TO KNOW THE FACTORIAL OF?"
INPUT i$
IF i$ = "end" THEN
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
i = VAL(i$)
IF i < 0 THEN
 PRINT "TOO SMALL"
 GOTO top
END IF
IF i > 10 THEN
 PRINT "TOO BIG"
 GOTO top
END IF
f = 1
FOR j = 1 TO i
   f = f * j
NEXT j
PRINT f
GOTO top

