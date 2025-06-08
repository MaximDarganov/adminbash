#!/bin/bash

# Проверяем, что есть аргументы
if [ $# -eq 0 ]; then
    echo "Использование: $0 <файл1> <файл2> ..."
    exit 1
fi

# Проверка существования файлов
for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Ошибка: Файл '$file' не существует"
    else
        line_count=$(grep -c "^" "$file")
        printf "%s: %d строк\n" "$file" "$line_count"
    fi
done
