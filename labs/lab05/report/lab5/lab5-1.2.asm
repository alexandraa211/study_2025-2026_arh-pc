section .data
    msg db 'Введите строку: ',0
    len_msg equ $-msg
    
section .bss
    input resb 100     ; буфер для ввода строки
    len_input equ $-input

section .text
    global _start

_start:
    ; Вывод приглашения "Введите строку:"
    mov eax, 4         ; системный вызов write
    mov ebx, 1         ; файловый дескриптор stdout
    mov ecx, msg       ; указатель на сообщение
    mov edx, len_msg   ; длина сообщения
    int 0x80
    
    ; Ввод строки с клавиатуры
    mov eax, 3         ; системный вызов read
    mov ebx, 0         ; файловый дескриптор stdin
    mov ecx, input     ; буфер для ввода
    mov edx, len_input ; максимальная длина
    int 0x80
    
    ; Сохраняем длину введенной строки
    mov esi, eax
    
    ; Вывод введенной строки
    mov eax, 4         ; системный вызов write
    mov ebx, 1         ; stdout
    mov ecx, input     ; введенная строка
    mov edx, esi       ; длина введенной строки
    int 0x80
    
    ; Завершение программы
    mov eax, 1         ; системный вызов exit
    mov ebx, 0         ; код возврата
    int 0x80
