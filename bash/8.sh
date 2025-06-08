#!/bin/bash

vals=$(env | awk -F= '/^LC_/ {print $2}' | sort -u)
num=$(echo "$vals" | wc -l)

if [ "$num" -gt 1 ]; then
    echo "ОШИБКА: Переменные локализации имеют разные значения:"
    env | grep '^LC_'
    exit 1
elif [ "$num" -eq 0 ]; then
    echo "Предупреждение: Не найдено переменных локализации LC_*"
else
    echo "Все переменные локализации LC_* имеют одинаковое значение:"
    env | grep '^LC_' | head -n1
fi
