#!/bin/bash

# Проверка переменных окружения
if [ "$FOO" = "5" ] && [ "$BAR" = "1" ]; then
    echo "Ошибка: Выполнение запрещено (FOO=5 и BAR=1)"
    exit 1
fi

# Ожидание появления файла
while true; do
    if [ -n "$(ls -A . 2>/dev/null)" ]; then
        echo "Файл обнаружен"
        exit 0
    fi
    sleep 1
done 