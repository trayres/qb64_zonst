REM Factorial computation in a for loop style
DIM a
a = Factorial!(5)
PRINT "Factorial(5):"; a


FUNCTION Factorial! (N!)
    REM Declare an accumulation variable
    DIM ACC
    ACC = 1
    FOR I = 0 TO N
        IF I = 0 THEN
            ACC = ACC
        ELSE
            ACC = I * ACC
        END IF
    NEXT I
    Factorial! = ACC
END FUNCTION

