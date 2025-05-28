#!/bin/bash

# Проверка наличия аргументов
if [ $# -eq 0 ]; then
    echo "Использование: $0 <файл1> [файл2 файл3 ...]"
    exit 1
fi

# Обработка каждого файла
for file in "$@"; do
    if [ -f "$file" ]; then
        lines=$(wc -l < "$file")
        echo "$file: $lines строк"
    else
        echo "Ошибка: Файл $file не существует"
    fi
done 