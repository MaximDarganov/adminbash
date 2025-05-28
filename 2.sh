#!/bin/bash

# Проверка аргумента
if [ $# -ne 1 ]; then
    echo "Использование: $0 <путь_к_каталогу>"
    exit 1
fi

target_dir=$1

# Проверка существования каталога
if [ ! -d "$target_dir" ]; then
    echo "Ошибка: Каталог $target_dir не существует"
    exit 1
fi

# Обработка каждого подкаталога
for dir in "$target_dir"/*/; do
    if [ -d "$dir" ]; then
        dir_name=$(basename "$dir")
        count=$(find "$dir" -type f | wc -l)
        echo "$dir_name: $count файлов"
    fi
done 