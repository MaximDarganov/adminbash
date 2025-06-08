#!/bin/bash

echo "Пути из PATH:"; echo "-------------------------------"
IFS=':' read -ra dirs <<< "$PATH"
for dir in "${dirs[@]}"; do
    if [ -d "$dir" ]; then
        n=$(find "$dir" -maxdepth 1 -type f 2>/dev/null | wc -l)
        printf "Путь: %-40s | Файлов: %d\n" "$dir" "$n"
    else
        printf "Путь: %-40s | ОШИБКА: Директория не существует\n" "$dir"
    fi
done
