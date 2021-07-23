' men across river
  DIM p(4), w(4)
  n = 4
  CLS 'clear screen
  'set permutation vector p=(1,2,3,4)
  p(1) = 1: p(2) = 2: p(3) = 3: p(4) = 4
  lastperm = 0' logical variable set FALSE
  ' set weight vector w=(1,2,5,10)
  w(1) = 1: w(2) = 2: w(3) = 5: w(4) = 10
  
  ' loop to try each permutation
  DO UNTIL lastperm    'top of loop
    PRINT "perm=" + STR$(p(1)) + " " + STR$(p(2)) + " " + STR$(p(3)) + " " + STR$(p(4))
    ' assign weights in accordance with permutation vector
    a = w(p(1)): b = w(p(2)): c = w(p(3)): d = w(p(4))
    FOR kase = 1 TO 3  'loop to try the three scenarios
      IF a > b THEN         'across
        total = a
      ELSE
        total = b
      END IF
      total = total + a     'back
      IF a > c THEN         'across
        total = total + a
      ELSE
        total = total + c
      END IF
      IF kase = 1 THEN
        total = total + a   'back
        IF a > d THEN       'across
          total = total + a
        ELSE
          total = total + d
        END IF
      ELSEIF kase = 2 THEN
        total = total + b   'back
        IF b > d THEN       'across
          total = total + b
        ELSE
          total = total + d
        END IF
      ELSE
        total = total + c   'back
        IF c > d THEN       'across
          total = total + c
        ELSE
          total = total + d
        END IF
      END IF
      PRINT "total = " + STR$(total) + " kase = " + STR$(kase) + " weights = " + STR$(a) + " " + STR$(b) + " " + STR$(c) + " " + STR$(d); ""
    NEXT kase
    ' now advance to the next pemutation
    
    gotperm = 0   ' logical variable = FALSE
    m = n     ' try to advance stage 4
    DO UNTIL gotperm = 1
      p(m) = p(m) + 1
      IF p(m) > n THEN
        m = m - 1
        IF m = 0 THEN
          gotperm = 1: lastperm = 1
        END IF
      ELSE
        found = 0
        IF m <> 1 THEN
          FOR i = 1 TO m - 1
            IF p(m) = p(i) THEN
              found = 1
            END IF
          NEXT i
        END IF

        IF found = 0 THEN
         IF m < n THEN
          j = m
          FOR k = 1 TO n
            found = 0
            FOR i = 1 TO m
              IF p(i) = k THEN
                found = 1
              END IF
            NEXT i
            IF found = 0 THEN
              j = j + 1: p(j) = k
            END IF
          NEXT k
         END IF
         gotperm = 1
        END IF
      END IF
    LOOP   'end of loop
  LOOP   'end of loop
  STOP
        

