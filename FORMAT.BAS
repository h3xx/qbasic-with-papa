CLS
PRINT "This is a program to format the disk in the drive that you specify."
PRINT "Not responsible for the formatting of a non-removable disk."
0 PRINT "What is the size of the disk?"
PRINT "<1> 160 kb, <2> 180 kb, <3> 320 kb, <4> 360 kb,"
PRINT "<5> 720 kb, <6> 1.2 mb, <7> 1.44 mb (Default), <8> 2.88 mb"
1 INPUT x
x = INT(x)
IF x > 8 OR x < 0 THEN GOTO 1
IF x = 1 THEN c$ = " /f:160"
IF x = 2 THEN c$ = " /f:180"
IF x = 3 THEN c$ = " /f:320"
IF x = 4 THEN c$ = " /f:360"
IF x = 5 THEN c$ = " /f:720"
IF x = 6 THEN c$ = " /f:1.2"
IF x = 7 OR x = 0 THEN c$ = " /f:1.44"
IF x = 8 THEN c$ = " /f:2.88"
PRINT "Please type the drive letter that you want to format."
SLEEP
d$ = INKEY$
d$ = d$ + ":"
f$ = "format " + d$ + c$
SHELL f$
PRINT "Do you want to start again?"
INPUT p$
IF LEFT$(p$, 1) = "y" OR LEFT$(p$, 1) = "Y" THEN CLS : GOTO 0
IF LEFT$(p$, 1) = "n" OR LEFT$(p$, 1) = "N" THEN
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

