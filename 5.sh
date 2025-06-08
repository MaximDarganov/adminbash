#!/bin/bash

out_file="logs.log"
: > "$out_file"

for f in $(find /var/log -maxdepth 1 -type f -name "*.log"); do
    tail -n 1 "$f" 2>/dev/null >> "$out_file"
done

echo "Последние строки из файлов .log сохранены в $out_file"
