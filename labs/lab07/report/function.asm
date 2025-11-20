section .data
    msg_x db 'Введите x: ', 0
    msg_a db 'Введите a: ', 0
    msg_result db 'Результат f(x) = ', 0
    newline db 10, 0

section .bss
    x resb 10
    a resb 10
    buffer resb 10

section .text
    global _start
    %include 'in_out.asm'  ; Подключаем файл с функциями ввода-вывода

_start:
    ; Ввод значения x
    mov eax, msg_x
    call sprint
    
    mov ecx, x
    mov edx, 10
    call sread
    
    ; Преобразование x из строки в число
    mov eax, x
    call atoi
    mov [x], eax
    
    ; Ввод значения a
    mov eax, msg_a
    call sprint
    
    mov ecx, a
    mov edx, 10
    call sread
    
    ; Преобразование a из строки в число
    mov eax, a
    call atoi
    mov [a], eax
    
    ; Вычисление функции f(x)
    mov ebx, [x]    ; ebx = x
    mov ecx, [a]    ; ecx = a
    
    ; Сравниваем x и a
    cmp ebx, ecx
    jge x_greater   ; Если x >= a, переходим к x_greater
    
    ; Если x < a, то f(x) = 5
    mov eax, 5
    jmp print_result

x_greater:
    ; Если x >= a, то f(x) = x - a
    sub ebx, ecx    ; ebx = x - a
    mov eax, ebx

print_result:
    ; Выводим сообщение с результатом
    push eax        ; Сохраняем результат
    mov eax, msg_result
    call sprint
    pop eax         ; Восстанавливаем результат
    
    ; Выводим число
    call iprint
    
    ; Переводим строку
    mov eax, newline
    call sprint
    
    ; Завершаем программу
    call quit
