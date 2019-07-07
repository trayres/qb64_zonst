REM Factorial computation, in the traditional recursive style
DIM a
a = Factorial!(5)
PRINT "Factorial(5):"; a


FUNCTION Factorial! (N!)
    IF N! = 0 THEN Factorial! = 1 ELSE Factorial! = N! * Factorial!(N! - 1)
END FUNCTION
