%include 'in_out.asm'

SECTION .data
    msg db 'Введите строку: ',0h

SECTION .bss
    input resb 100     ; буфер для ввода строки

SECTION .text
    global _start

_start:
    ; Вывод приглашения "Введите строку:"
    mov eax, msg
    call sprint        ; вывод без перевода строки
    
    ; Ввод строки с клавиатуры
    mov ecx, input     ; буфер для ввода
    mov edx, 100       ; максимальная длина
    call sread         ; вызов подпрограммы ввода
    
    ; Вывод введенной строки
    mov eax, input
    call sprintLF      ; вывод с переводом строки
    
    ; Завершение программы
    call quit
