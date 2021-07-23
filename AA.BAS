DECLARE SUB bb ()
DECLARE SUB cc ()
DECLARE SUB dd ()
'this is program aa
CALL bb
CALL cc
CALL dd
STOP

SUB bb
  PRINT "bb"
END SUB

SUB cc
  PRINT "cc"
END SUB

SUB dd
  PRINT "dd"
END SUB

