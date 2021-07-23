CLS
SCREEN 12
m = INT(VAL(RIGHT$(TIME$, 2)))
FOR n = 1 TO m
 i = RND
NEXT
FOR n = 1 TO 20
FOR c = 0 TO 15
   'LINE (RND * 639, RND * 479)-(RND * 639, RND * 479), c
   CIRCLE (RND * 639, RND * 479), RND * 50, c
NEXT
NEXT

END



