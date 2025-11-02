#!/bin/bash
# изменить имена всех файлов в директории на строчные буквы
cd "/Users/irinapankova/Desktop/git_class/HW-3/практика к семинару от 22 10/for_task_5"
touch FILE1.txt FILE2.txt FILE3.txt FILE4.txt FILE5.txt

# Скрипт переводит имена всех файлов в текущей директории в нижний регистр
cd "/Users/irinapankova/Desktop/git_class/HW-3/практика к семинару от 22 10/for_task_5"
for file in *; do
  # Проверяем, что это файл (а не папка)
  if [ -f "$file" ]; then
    lower=$(echo "$file" | tr '[:upper:]' '[:lower:]')
    # Если новое имя отличается — переименовываем
    if [ "$file" != "$lower" ]; then
      mv "$file" "$lower"
      echo "✅ Переименовано: $file → $lower"
    fi
  fi
done
