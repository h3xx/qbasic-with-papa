' polar plot
top:
INPUT "enter value a between 50 and 200=", a
INPUT "enter value b between 0 and 12=", b
INPUT "enter value c between 0 and 50=", c
INPUT "enter value d between 0 and 50=", d
CLS
SCREEN 12

FOR theta = 0 TO 3.14159 * 2 + .1 STEP .01
  r = a * SIN(b * theta) - c * SIN(d * theta) '  the polar equation
  x = r * COS(theta): y = r * SIN(theta) ' x and y equivalents
  x = x + 320: y = 240 - y' biasing to move display to middle of screen
  IF theta <> 0 THEN
    LINE (prevx, prevy)-(x, y), 12
  END IF
  prevx = x: prevy = y
NEXT
PRINT "a,b,c,d=", a, b, c, d
INPUT "Enter q to quit or other key to continue  ", q$
IF q$ = "q" OR q$ = "Q" THEN
  STOP
END IF
CLS

GOTO top

STOP
END

