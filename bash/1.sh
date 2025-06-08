#!/bin/bash

# Проверка аргументов
# Не хочу чтобы можно было дописать строчки в файлики с заданием
if [ $# -ne 2 ] || [[ "$1" =~ ^[1-8]\.sh$ ]]; then
    echo "Использование: $0 <имя_файла_для_записи> <время_в_секундах>"
    exit 1
fi

output_file=$1
duration=$2

target_time=$(($(date +%s) + duration))

while [ $(date +%s) -lt $target_time ]; do
    current_time=$(date "+[%d.%m.%y %H:%M]")
    system_load=$(cat /proc/loadavg | cut -d' ' -f1-3)
    printf "%s = %s\n" "$current_time" "$system_load" >> "$output_file"
    sleep 1
done
