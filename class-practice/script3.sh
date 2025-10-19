#!/bin/bash
read -p "Введите путь к директории: " dirpath

# Проверяем, существует ли директория
if [ -d "$dirpath" ]; then
    # Формируем имя архива с датой
    dirname=$(basename "$dirpath")
    date=$(date +%Y-%m-%d)
    archive_name="${dirname}_${date}.tar.gz"

    # Создаём архив
    tar -czf "$archive_name" -C "$(dirname "$dirpath")" "$dirname"

    echo "Архив создан: $archive_name"
else
    echo "Ошибка: директория не найдена."
fi
