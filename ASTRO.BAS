1 SCREEN 12
PRINT "Which Letter or Number?"
INPUT letter$
IF letter$ = "a" OR letter$ = "A" THEN
 CLS
 LINE (250, 300)-(150, 3)
 LINE (150, 0)-(50, 300)
 LINE (50, 300)-(300, 100)
 END IF
IF letter$ = "l" OR letter$ = "L" THEN
 CLS
 CIRCLE (125, 300), 15
 LINE (125, 300)-(125, 60)
 CIRCLE (125, 60), 15
 LINE (125, 300)-(300, 300)
 CIRCLE (300, 300), 15
 END IF
IF letter$ = "1" THEN
 CLS
 LINE (50, 300)-(150, 0)
 LINE (150, 0)-(0, 100)
 END IF
IF letter$ = "2" THEN
 CLS
 LINE (175, 250)-(50, 300)
 LINE (50, 300)-(150, 0)
 LINE (150, 0)-(0, 100)
 END IF
INPUT dummy$
IF dummy$ = "exit" THEN
 CLS
 LINE (165, 15)-(15, 15)
 LINE (15, 15)-(15, 165)
 LINE (165, 165)-(165, 315)
 LINE (165, 315)-(15, 315)
 CIRCLE (165, 15), 15
 CIRCLE (15, 15), 15
 CIRCLE (165, 165), 15
 CIRCLE (165, 315), 15
 CIRCLE (15, 315), 15
 CIRCLE (15, 165), 15
 LOCATE 20, 60: INPUT dummy2$
 CLS
 LINE (165, 15)-(15, 15)
 LINE (15, 15)-(15, 165)
 LINE (165, 165)-(165, 315)
 LINE (165, 315)-(15, 315)
 LINE (165, 15)-(165, 165)
 LINE (15, 165)-(165, 165)
 LINE (15, 165)-(15, 315)
 CIRCLE (165, 15), 15
 CIRCLE (15, 15), 15
 CIRCLE (165, 165), 15
 CIRCLE (165, 315), 15
 CIRCLE (15, 315), 15
 CIRCLE (15, 165), 15
 END
 END IF
CLS
GOTO 1

