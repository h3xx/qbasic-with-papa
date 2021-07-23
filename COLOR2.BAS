CLS
SCREEN 12
FOR i = 0 TO 63 STEP 8    ' blue
 FOR j = 0 TO 63 STEP 8    ' green
  FOR k = 0 TO 63 STEP 8    ' red
   PALETTE 1, 65536 * i + 256 * j + k  'change color 1
   COLOR 1
   PRINT "xxxxxxxxxxxxxxxxxxxxxxxxxx", i, j, k
  NEXT
 NEXT
NEXT
END



