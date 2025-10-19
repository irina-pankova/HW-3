#!/bin/bash
read -p "Введите имя файла: " filename

if [ -f "$filename" ]; then
    line_count=$(wc -l < "$filename")
    echo "Количество строк в файле: $line_count"
else
    echo "Файл не найден."
fi
