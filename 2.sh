#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 1 ]; then
    echo "Использование: $0 <путь>"
    exit 1
fi

path="$1"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
output_dir="for_2${timestamp}"

# Создаём папку для результатов
if ! mkdir -p "$output_dir"; then
    echo "Ошибка: Не удалось создать директорию"
    exit 1
fi

# Проверка существования пути
if [ ! -d "$path" ]; then
    echo "Ошибка: Путь '$path' не существует"
    exit 1
fi

find "$path" -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    # Убираем слеши из пути (чтобы получить чистое имя)
    dir_name=$(basename "$dir")

    # Считаем количество элементов (исключая . и ..)
    file_count=$(find "$dir" -type f -o -type d | grep -v "^$dir$" | wc -l)

    # Создаём файл с именем подкаталога
    printf "%d\n" "$file_count" > "$output_dir/${dir_name}.txt"
done
