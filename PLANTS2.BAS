DIM xx(2000), yy(2000), tt(2000) 'stack

ni = 0
CLS             'clear screen, set for 640 x 480, 16 colors
SCREEN 12

m = INT(VAL(RIGHT$(TIME$, 2)))  'call rnd a few (0-59) times
FOR n = 1 TO m
 i = RND
NEXT

a90 = 3.14159 / 2: a45 = 3.14159 / 4' two angles, 90 and 45 deg.
a80 = 3.14159 * 80 / 180: a20 = 3.14159 * 20 / 180
a30 = 3.14159 * 30 / 180: a120 = 3.14159 * 120 / 180
ss = 15' smallest twig size

ni = 0                            'no items in stack

FOR i = 1 TO 30                   'plant 30 seeds
  x = (INT(RND * 40) - 1) * 16
  y = 400 - RND * 60
  ni = ni + 1: tt(ni) = 1: xx(ni) = x: yy(ni) = y
NEXT

FOR p = 1 TO 1000
  i = RND * (ni - 1) + 1    'process and display random item in the stack
  t = tt(i)
  IF t = 1 THEN              'item is a seed, show and change to a sprout
    CIRCLE (xx(i), yy(i)), 1, 2
    PAINT (xx(i), yy(i)), 2, 2
    tt(i) = 2
  ELSEIF t = 2 THEN         'item is a sprout, show and convert to a bud
    
    a = a80 + RND * a20             'assign angle to it
    s = 20 + RND * 10             ' assign size to it
    x1 = xx(i): x2 = x1 + s * COS(a)
    y1 = yy(i): y2 = y1 - s * SIN(a)
    LINE (x1, y1)-(x2, y2), 2   ' display it
    xx(i) = x2: yy(i) = y2: tt(i) = 3    'change to a bud
    CIRCLE (x2, y2), 2, 4                ' display bud
    PAINT (x2, y2), 4
    LINE (x2, y2)-(x2 - 4, y2 - 4), 4
    LINE (x2, y2)-(x2 + 4, y2 - 4), 4
    LINE (x2, y2)-(x2, y2 - 4), 4

  ELSEIF t = 3 THEN        'item is a bud, convert to 2 twigs then buds
    IF ni < 2000 THEN
      a = a30 + RND * a120      ' first twig/bud, assign angle to it
      s = ss + RND * ss             ' assign size to it
      x1 = xx(i): x2 = x1 + s * COS(a)
      y1 = yy(i): y2 = y1 - s * SIN(a)
      LINE (x1, y1)-(x2, y2), 2   ' display it
      xx(i) = x2: yy(i) = y2   'change bud coodinates
      CIRCLE (x2, y2), 2, 4
      PAINT (x2, y2), 4
      LINE (x2, y2)-(x2 - 4, y2 - 4), 4
      LINE (x2, y2)-(x2 + 4, y2 - 4), 4
      LINE (x2, y2)-(x2, y2 - 4), 4
      a = a30 + RND * a120           ' second twig/bud, assign angle to it
      s = ss + RND * ss             ' assign size to it
      x2 = x1 + s * COS(a)
      y2 = y1 - s * SIN(a)
      LINE (x1, y1)-(x2, y2), 2   ' display it
      ni = ni + 1
      xx(ni) = x2: yy(ni) = y2: tt(ni) = 3
      CIRCLE (x2, y2), 2, 4
      PAINT (x2, y2), 4
      LINE (x2, y2)-(x2 - 4, y2 - 4), 4
      LINE (x2, y2)-(x2 + 4, y2 - 4), 4
      LINE (x2, y2)-(x2, y2 - 4), 4

    END IF
  END IF
  FOR d = 1 TO 100   'delay
  NEXT d

NEXT





