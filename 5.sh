#!/bin/bash

# Создаем или очищаем файл для результатов
> logs.log

# Поиск и обработка .log файлов
for log_file in /var/log/*.log; do
    if [ -f "$log_file" ]; then
        last_line=$(tail -n 1 "$log_file" 2>/dev/null)
        if [ -n "$last_line" ]; then
            echo "$log_file: $last_line" >> logs.log
        fi
    fi
done

# Выводим результат
cat logs.log 