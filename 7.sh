#!/bin/bash

# Разбиваем PATH на массив
IFS=':' read -ra paths <<< "$PATH"

# Проверяем каждый путь
for path in "${paths[@]}"; do
    if [ -d "$path" ]; then
        count=$(find "$path" -type f 2>/dev/null | wc -l)
        echo "$path: $count файлов"
    fi
done 