section .data
    a dd 95
    b dd 2
    c dd 61
    msg db "Наименьшее число: ", 0
    newline db 10, 0

section .text
    global _start
    %include 'in_out.asm'  ; Подключаем файл с функциями ввода-вывода

_start:
    ; Сначала предполагаем, что a - наименьшее
    mov eax, [a]
    mov ebx, [b]
    mov ecx, [c]
    
    ; Сравниваем a и b
    cmp eax, ebx
    jle compare_c  ; Если a <= b, переходим к сравнению с c
    mov eax, ebx   ; Иначе наименьшее = b

compare_c:
    ; Сравниваем текущее наименьшее (eax) с c
    cmp eax, ecx
    jle print_result  ; Если текущее <= c, переходим к выводу
    mov eax, ecx      ; Иначе наименьшее = c

print_result:
    ; Выводим сообщение
    push eax          ; Сохраняем результат
    mov eax, msg
    call sprint
    pop eax           ; Восстанавливаем результат
    
    ; Выводим наименьшее число
    call iprint
    
    ; Переводим строку
    mov eax, newline
    call sprint
    
    ; Завершаем программу
    call quit
