#!/bin/sh

if [ "$FOO" = "5" ] && [ "$BAR" = "1" ]; then
    echo "Ошибка: Выполнение скрипта запрещено"
    exit 1
fi

ls > initial_files.txt

echo "Ожидание нового файла... (Ctrl+C для выхода)"

while :; do
    for f in *; do
        [ -d "$f" ] && continue
        if ! grep -Fxq "$f" initial_files.txt; then
            echo "Обнаружен новый файл: $f"
            exit 0
        fi
    done
    sleep 1
done
