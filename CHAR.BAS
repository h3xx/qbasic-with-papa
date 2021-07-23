OPEN "char.txt" FOR OUTPUT AS 1
FOR x = 1 TO 255
 WRITE #1, x, CHR$(x)
 PRINT x, CHR$(x)
NEXT

