' Program to compute square roots by trial and error
'                                    notice: no GO TO's!
CLS                                     ' clears screen
DO                                      ' top of main loop
   INPUT "Enter a number  ", n
   IF n > 0 THEN                          ' top of if...end if block
     root = 5

     DO                                     'top of inner loop
       test = n / root
       root = (root + test) / 2
     LOOP UNTIL ABS(root - test) < .00001   'bottom of inner loop

     PRINT "Root=";
     PRINT USING " ######.####"; root

   END IF                                 'bottom of if..end if block

LOOP WHILE n > 0                        ' bottom of main loop
END

