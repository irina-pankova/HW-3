#!/bin/bash
REPORT="report.txt"
echo "Отчёт о содержимом директории: $(pwd)" > "$REPORT"
echo "Дата и время запуска: $(date)" >> "$REPORT"
echo "----------------------------------------" >> "$REPORT"
echo >> "$REPORT"
# --- 1. Список всех файлов и их типов ---
echo "📂 Список объектов в текущей директории:"
echo "📂 Список объектов в текущей директории:" >> "$REPORT"
for item in *; do
    if [ -d "$item" ]; then
        echo "[Каталог] $item" | tee -a "$REPORT"
    elif [ -f "$item" ]; then
        echo "[Файл] $item" | tee -a "$REPORT"
    elif [ -L "$item" ]; then
        echo "[Символическая ссылка] $item" | tee -a "$REPORT"
    else
        echo "[Другое] $item" | tee -a "$REPORT"
    fi
done
echo >> "$REPORT"
echo

# --- 2. Проверка наличия файла, переданного как аргумент ---
if [ -z "$1" ]; then
    echo "❗ Укажите имя файла как аргумент при запуске скрипта."
    echo "❗ Аргумент (имя файла) не был передан." >> "$REPORT"
else
    if [ -e "$1" ]; then
        echo "✅ Файл '$1' существует."
        echo "✅ Файл '$1' существует." >> "$REPORT"
    else
        echo "❌ Файл '$1' не найден."
        echo "❌ Файл '$1' не найден." >> "$REPORT"
    fi
fi
echo >> "$REPORT"
echo

# --- 3. Информация о каждом объекте: имя и права доступа ---
echo "🔒 Информация о каждом объекте:"
echo "🔒 Информация о каждом объекте:" >> "$REPORT"

for item in *; do
    perms=$(ls -ld "$item" | awk '{print $1}')
    echo "$item — права доступа: $perms" | tee -a "$REPORT"
done

echo >> "$REPORT"
echo "✅ Отчёт сохранён в файле: $REPORT"
