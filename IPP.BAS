' program to estimate ipp payout


FOR rate = .25 TO .25 STEP .05
  LPRINT "RATE=", rate
  LPRINT "N   OBAL         GROSS        TAX             CHECK         NBAL"
  bal = 66579.72
  
  FOR n = 36 TO 1 STEP -1
    sbal = bal
    gross = bal / n
    tax = gross * .131
    check = gross - tax
    bal = bal - gross
    LPRINT sbal, gross, tax, check, bal
    bal = bal * (1 + rate / 12)
  NEXT n
  INPUT "Change paper"; a$
NEXT rate
END


