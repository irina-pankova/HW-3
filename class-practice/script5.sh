#!/bin/bash
read -p "Введите путь к директории: " dirpath

# Проверяем, существует ли директория
if [ -d "$dirpath" ]; then
    # Переходим в директорию
    cd "$dirpath" || exit

    # Проходим по всем файлам в директории
    for file in *; do
        if [ -f "$file" ]; then
            mv "$file" "backup_$file"
        fi
    done

    echo "Префиксы успешно добавлены ко всем файлам в $dirpath"
else
    echo "Ошибка: директория не найдена."
fi
