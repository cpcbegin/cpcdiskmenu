10 REM Ejemplo Menu para seleccionar diversos programas en disquete.
20 MODE 1
30 PEN 1:PAPER 0
40 DIM B$(20)
50 cabecera$="MY OWN COMPILATION #1"
60 X%=19-LEN(cabecera$)/2 
70 ESPACIOS%=4+LEN(cabecera$)
80 PAPER 3
90 FOR Y%=1 TO 3
100 LOCATE X%,Y%:PRINT SPACE$(ESPACIOS%)
110 NEXT Y%
120 LOCATE X%,2
130 PRINT"  "+cabecera$
140 PAPER 0:READ Z%:FOR I%=1 TO Z%:READ a$,b$(i%):LOCATE 5,I%*(2+(z%>10))+5:PEN 2:PRINT USING"##";i%;:PRINT") ";:PEN 1:PRINT a$:NEXT i%
150 REM PEN 3:LOCATE 11,25:PRINT CHR$(164)+" 2019, MENSAJE COPYRIGHT";
160 opcion%=1
170 LOCATE 5,opcion%*(2+(z%>10))+5:PEN 0:PAPER 2:PRINT USING"##";opcion%;:PRINT") ";:a$="":WHILE a$="":a$=INKEY$:WEND 
180 IF a$=CHR$(241) OR a$=CHR$(10) THEN LOCATE 5,opcion%*(2+(z%>10))+5:PAPER 0:PEN 2:PRINT USING"##";opcion%;:PRINT") ";:opcion%=opcion%+1:IF opcion%=Z%+1 THEN opcion%=Z%
190 IF a$=CHR$(240) OR a$=CHR$(11) THEN LOCATE 5,opcion%*(2+(z%>10))+5:PAPER 0:PEN 2:PRINT USING"##";opcion%;:PRINT") ";:opcion%=opcion%-1:IF opcion%=0 THEN opcion%=1
200 IF VAL("0"+a$)>0 THEN opcion%=VAL(a$):GOTO 230
210 IF a$<>CHR$(13) AND a$<>"X" AND a$<>"Z" AND a$<>" " THEN a$="":GOTO 170 ELSE 230
220 PRINT"Cargando..."b$(opcion%)
230 GOSUB 240:PEN 1:PAPER 0:RUN B$(OPCION%)
240 FOR j%=1 TO z%
250 PEN 2:PAPER 0 
260 IF opcion%=j% THEN PRINT CHR$(24);
270 LOCATE 5,j%*(2+(z%>10))+5:PRINT USING"##";j%;:PRINT") ";
280 NEXT j%
290 RETURN
300 'Use this syntax in DATA line:
310 'DATA number of programs,description 1,access 1,description 2,access 2,...
320 DATA 5,"MY TOOL",MYTOOL.BAS,"MY GAME",MYGAME.BAS,"MY DEMO",MYDEMO.BAS,"MY APP",MYAPP.BAS,"OTHER STUFF",STUFF.BAS
330 REM CHANGE LINES 50 AND 320 WITH YOUR OWN DATA
340 REM YOU CAN USE CURSORS, MAIN JOYSTICK OR TYPE THE NUMBER OF OPTIONS
350 REM SELECT WITH SPACE OR ANY FIRE


