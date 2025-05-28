#!/bin/bash

# Проверка количества аргументов
if [ $# -ne 2 ]; then
    echo "Использование: $0 <имя_файла> <время_в_секундах>"
    exit 1
fi

output_file=$1
duration=$2

# Очищаем файл, если он существует
> "$output_file"

# Основной цикл
for ((i=1; i<=duration; i++)); do
    # Получаем текущую дату и время
    timestamp=$(date '+%d.%m.%y %H:%M:%S')
    
    # Получаем загрузку системы
    load=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
    
    # Записываем в файл
    echo "$timestamp $load" >> "$output_file"
    
    # Ждем секунду
    sleep 1
done

# Выводим только содержимое файла
cat "$output_file" 