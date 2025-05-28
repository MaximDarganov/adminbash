#!/bin/bash

# Инициализация переменных
first_value=""
error=0
found_vars=0

# Поиск и проверка переменных локализации
for var in $(env | grep "^LC_" | cut -d= -f1); do
    found_vars=1
    value="${!var}"
    
    if [ -z "$first_value" ]; then
        first_value="$value"
    elif [ "$value" != "$first_value" ]; then
        error=1
        echo "Ошибка: $var=$value отличается от $first_value"
    fi
done

# Вывод результата
if [ $found_vars -eq 0 ]; then
    echo "Переменные локализации не найдены"
    exit 0
elif [ $error -eq 0 ]; then
    echo "Все переменные локализации имеют значение: $first_value"
else
    exit 1
fi 