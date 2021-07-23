' Program to test graphics

CLS
PALETTE 8, 9

SCREEN 12
VIEW SCREEN (10, 10)-(300, 180), , 1
CLS
FOR i = 0 TO 20
  LINE (15 + 3 * i, 15 + 3 * i)-(295 - 3 * i, 175 - 3 * i), i, B
NEXT i

LOCATE 6, 13:
PRINT "Boxes to View ";
LOCATE 15, 10
PRINT "Ain't that pretty!";


