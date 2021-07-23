DIM tt(3000), xx(3000), yy(3000), ss(3000), aa(3000)'stack



ni = 0
CLS             'clear screen, set for 640 x 480, 16 colors
SCREEN 12

m = INT(VAL(RIGHT$(TIME$, 2)))  'call rnd a few (0-59) times
FOR n = 1 TO m
 i = RND
NEXT


ni = 0                            'no items in stack

FOR i = 1 TO 20                   'plant 20 seeds
  x = (INT(RND * 40) - 1) * 16
  y = 0
  ni = ni + 1: tt(ni) = 1: xx(ni) = x: yy(ni) = y   'on ground, at random x
NEXT

FOR p = 1 TO 3000
  i = RND * (ni - 1) + 1    'process and display random item in the stack
  t = tt(i)
  IF t = 1 THEN              'item is a seed, show and change to a sprout
    CIRCLE (xx(i), 400 - yy(i)), 1, 2
    PAINT (xx(i), 400 - yy(i)), 2, 2
    tt(i) = 2
  ELSEIF t = 2 THEN         'item is a new sprout, show as sprout
    ax = 3.14159 / 4
    a = ax / 2 - RND * ax: aa(i) = a  'assign angle to it
    s = 10 + RND * 10: ss(i) = s           'assign size to it
    xa1 = 0: ya1 = 0
    xa2 = -s / 5: ya2 = s / 2
    xa3 = 0: ya3 = s
    xa4 = -xa2: ya4 = ya2

    sa = SIN(a): ca = COS(a)
    
    x1 = xx(i): y1 = yy(i)

    x2 = xa2 * ca - ya2 * sa + x1: y2 = xa2 * sa + ya2 * ca + y1
    x3 = xa3 * ca - ya3 * sa + x1: y3 = xa3 * sa + ya3 * ca + y1
    x4 = xa4 * ca - ya4 * sa + x1: y4 = xa4 * sa + ya4 * ca + y1
    LINE (x1, 400 - y1)-(x2, 400 - y2), 2
    LINE (x2, 400 - y2)-(x3, 400 - y3), 2
    LINE (x3, 400 - y3)-(x4, 400 - y4), 2
    LINE (x4, 400 - y4)-(x1, 400 - y1), 2
    PAINT (x1, 400 - (y1 + y3) / 2), 2, 2
    tt(i) = 3: ss(i) = s: aa(i) = a        ' change to twiglet
  ELSEIF t = 3 THEN                      'twiglet
    a = aa(i): s = ss(i)
    xa1 = 0: ya1 = 0
    xa2 = -s / 5: ya2 = s / 2
    xa3 = 0: ya3 = s
    xa4 = -xa2: ya4 = ya2
    sa = SIN(a): ca = COS(a)
    x1 = xx(i): y1 = yy(i)
    x2 = xa2 * ca - ya2 * sa + x1: y2 = xa2 * sa + ya2 * ca + y1
    x3 = xa3 * ca - ya3 * sa + x1: y3 = xa3 * sa + ya3 * ca + y1
    x4 = xa4 * ca - ya4 * sa + x1: y4 = xa4 * sa + ya4 * ca + y1
    LINE (x1, 400 - y1)-(x2, 400 - y2), 2
    LINE (x2, 400 - y2)-(x3, 400 - y3), 2
    LINE (x3, 400 - y3)-(x4, 400 - y4), 2
    LINE (x4, 400 - y4)-(x1, 400 - y1), 2
    ca = COS(a / 2): sa = SIN(a / 2)
    xa1 = -s / 30: ya1 = 0
    xa2 = xa1: ya2 = 2 * s
    xa3 = -xa1: ya3 = ya2
    xa4 = xa3: ya4 = 0
    x1 = xa1 * ca - ya1 * ca + x1: y1 = xa1 * sa + ya1 * ca + y1
    x2 = xa2 * ca - ya2 * sa + x1: y2 = xa2 * sa + ya2 * ca + y1
    x3 = xa3 * ca - ya3 * sa + x1: y3 = xa3 * sa + ya3 * ca + y1
    x4 = xa4 * ca - ya4 * sa + x1: y4 = xa4 * sa + ya4 * ca + y1
    LINE (x1, 400 - y1)-(x2, 400 - y2), 6
    LINE (x2, 400 - y2)-(x3, 400 - y3), 6
    LINE (x3, 400 - y3)-(x4, 400 - y4), 6
    LINE (x4, 400 - y4)-(x1, 400 - y1), 6
    tt(i) = 4: ss(i) = s:                          ' change to twig
  ELSE                                     'twig
    ni = ni + 1: tt(ni) = 1: xx(ni) = xx(i) + s: yy(ni) = yy(i) + s
  END IF
  FOR d = 1 TO 100   'delay
  NEXT d

NEXT





