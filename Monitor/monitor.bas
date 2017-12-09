10 PRINT" +-----------------------------------+"
20 PRINT" !        SIMPLE MONITOR V0.2        !"
30 PRINT" !    (C)2017 IR. MARC DENDOOVEN     !"
40 PRINT" +-----------------------------------+"
100 H4$=""
150 INPUT H4$:IF H4$="" THEN 180
160 H4$=LEFT$(H4$,4)
170 GOSUB 2200:A=H4
180 FOR R=0 TO 56 STEP 8
190 H4=A+R:PRINT:GOSUB 1200:PRINT": ";
200 FOR K=0 TO 7
210 H2=PEEK(A+K+R):GOSUB 1100:PRINT" ";
220 NEXT K
230 FOR K=0 TO 7
240 P=PEEK(A+K+R)
250 PR=( P>=32 AND P<128 ) OR ( P>159 AND P<192 )
260 IF PR THEN PRINTCHR$(P);
270 IF NOT PR THEN PRINT".";
280 NEXT K
290 NEXT R
300 PRINT
310 A=A+64
320 GOTO 100
1000 REM *** PRINT HEX DIGIT FROM H1
1010 IF H1<10 THEN PRINT CHR$(H1+ASC("0"));
1020 IF H1>9 THEN PRINT CHR$(H1+ASC("A")-10);
1030 RETURN
1100 REM *** PRINT HEX PAIR FROM H2
1110 H1=INT(H2/16):GOSUB 1000
1120 H1=H2-H1*16:GOSUB 1000
1130 RETURN
1200 REM *** PRINT HEX QUAD FROM H4
1210 H2=INT(H4/256):GOSUB 1100
1220 H2=H4-H2*256:GOSUB 1100
1230 RETURN
2000 REM *** HEX DIGIT FROM H1$ TO H1
2010 IF H1$<="9" AND H1$>="0" THEN H1=VAL(H1$)
2020 IF H1$<="F" AND H1$>="A" THEN H1=ASC(H1$)-ASC("A")+10
2030 RETURN
2100 REM *** HEX PAIR FROM H2$ TO H2
2110 H1$=LEFT$(H2$,1):GOSUB 2000
2120 H2=H1*16
2130 H1$=RIGHT$(H2$,1):GOSUB 2000
2140 H2=H2+H1
2150 RETURN
2200 REM *** HEX QUAD FROM H4$ TO H4
2210 H2$=LEFT$(H4$,2):GOSUB 2100
2220 H4=H2*256
2230 H2$=RIGHT$(H4$,2):GOSUB 2100
2240 H4=H4+H2
2250 RETURN
