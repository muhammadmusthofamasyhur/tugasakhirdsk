DATA SEGMENT 
    
    PESAN1 DB '--PROGRAM MENAMPILKAN WAKTU--$'
    PESAN DB '                                                   SEKARANG WAKTU MENUNJUKKAN: $'
    
    JAM DB ?
    MENIT DB ?
    DETIK DB ?

DATA ENDS

CODE SEGMENT 
    
    ASSUME CS:CODE, DS:DATA
    START: 
    MOV AX, DATA
    MOV DS, AX

    MOV AH,2CH          ; untuk mendapatkan sistem waktu
    INT 21H

    MOV JAM, CH          ; CH -> jam
    MOV MENIT, CX         ; CX -> menit
    MOV DETIK, DH       ; DH -> detik
   
    
    
    LEA DX, PESAN1        ; menampilkan pesan1
    MOV AH, 09H
    INT 21H
    LEA DX, PESAN        ; menampilkan pesan
    MOV AH, 09H
    INT 21H

    MOV AL, CH          
    AAM                 
    MOV BX, AX
    CALL DISPLAY        ; menampilkan jam
    MOV DL, ':'         ; menampilkan ':' setelah menampilkan jam
    MOV AH, 02H
    INT 21H
    
    MOV AL, CX
    AAM
    MOV BX, AX
    CALL DISPLAY        ; menampilkan menit
    MOV DL, ':'         ; menampilkan ':' setelah menampilkan menit
    MOV AH, 02H
    INT 21H
    
    MOV AL, DETIK
    AAM
    MOV BX, AX
    CALL DISPLAY        ; menampilkan detik
    MOV DL, '.'         ; menampilkan '.' setelah menampilkan detik
    MOV AH, 4CH
    INT 21H
    
  
   

    

    
    
    DISPLAY PROC NEAR   ; prosedur untuk menampilkan waktu
        MOV DL, BH
        ADD DL, 30H     ; menampilkan nilai BH
        MOV AH, 02H
        INT 21H
        MOV DL, BL
        ADD DL, 30H     ; menampilkan nilai BL
        MOV AH, 02H
        INT 21H
        RET
    DISPLAY ENDP  
    
CODE ENDS

END START