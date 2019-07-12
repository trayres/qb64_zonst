6  REM ******************************************
8  REM *** (DFT3.1) GENERATE/ANALYZE WAVEFORM ***
10 REM ******************************************
12 PI=3.141592653589793#:P2=2*PI:K1=PI/8:K2=1/PI
14 DIM Y(16),FC(16),FS(16),KC(16),KS(16)
16 CLS:FOR J=0 TO 16:FC(J)=0:FS(J)=0:NEXT
20 GOSUB 108: REM - PRINT COLUMN HEADINGS
30 GOSUB 120: REM - GENERATE FUNCTION Y(X)
40 GOSUB 200: REM - PERFORM DFT
60 GOSUB 140: REM - PRINT OUT FINAL VALUES
70 PRINT:PRINT "MORE (Y/N)? ";
72 A$ = INKEY$:IF A$="" THEN 72
74 PRINT A$:IF A$="Y" THEN 16
80 END
100 REM *****************************************
102 REM *     PROGRAM SUBROUTINES               *
104 REM *****************************************
106 REM *    PRINT COLUMN HEADINGS              *
107 REM ******************************************
108 PRINT:PRINT
110 PRINT "FREQ F(COS) F(SIN) Y(COS) Y(SIN)"
112 PRINT
114 RETURN
118 REM ******************************************
120 REM *** GENERATE FUNCTION Y(X) ***
121 REM ******************************************
122 FOR I = 0 TO 15: K3 = I * K1
124 Y(I) = COS(K3) + COS(3*K3)/9 + COS(5*K3)/25 + COS(7*K3)/49
126 NEXT I
128 FOR I = 1 TO 7 STEP 2: KC(I) = 1/I^2:NEXT
130 RETURN
132 REM ******************************************
138 REM *         PRINT OUTPUT                   *
139 REM ******************************************
140 FOR Z=0 TO 15
142 PRINT USING "## ";Z;
144 PRINT USING "##.####  ";FC(Z),FS(Z),KC(Z),KS(Z)
146 NEXT Z
148 RETURN
200 REM ******************************************
202 REM * SOLVE FOR COMPONENTS
204 REM ******************************************
206 FOR J=0 TO 15: REM SOLVE EQNS FOR EACH FREQUENCY
208 FOR I = 0 TO 15: REM MULTIPLY AND SUM EACH DATA POINT
210 FC(J) = FC(J) + Y(I)*COS(J*I*K1):FS(J)=FS(J)+Y(I)*SIN(J*I*K1)
212 NEXT I
214 FC(J)=FC(J)/16: FS(J)=FS(J)/16: REM FIND MEAN VALUE
216 NEXT J
218 RETURN