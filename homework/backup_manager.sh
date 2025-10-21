#!/bin/bash

# Проверка наличия аргумента
if [ -z "$1" ]; then
  echo "❌ Укажите директорию для резервного копирования."
  exit 1
fi

SOURCE_DIR="$1"
BACKUP_DIR="$HOME/backup_$(date +%Y-%m-%d_%H-%M-%S)"
LOG_FILE="$BACKUP_DIR/backup.log"

# Создаём папку для резервной копии
mkdir -p "$BACKUP_DIR"

echo "🔹 Резервное копирование начато: $(date)" | tee -a "$LOG_FILE"
echo "🔹 Исходная директория: $SOURCE_DIR" | tee -a "$LOG_FILE"
echo "🔹 Каталог резервных копий: $BACKUP_DIR" | tee -a "$LOG_FILE"
echo "--------------------------------------" | tee -a "$LOG_FILE"

# Счётчик файлов
count=0

# Копируем все файлы из исходной директории
for file in "$SOURCE_DIR"/*; do
  if [ -f "$file" ]; then
    filename=$(basename "$file")
    cp "$file" "$BACKUP_DIR/${filename%.*}_$(date +%Y-%m-%d).${filename##*.}"
    echo "✔ Скопирован: $filename" >> "$LOG_FILE"
    ((count++))
  fi
done

echo "--------------------------------------" | tee -a "$LOG_FILE"
echo "📦 Копирование завершено: $(date)" | tee -a "$LOG_FILE"
echo "Всего файлов скопировано: $count" | tee -a "$LOG_FILE"
echo "--------------------------------------" | tee -a "$LOG_FILE"

echo "✅ Резервное копирование завершено успешно."
echo "📁 Резервная копия: $BACKUP_DIR"
echo "📝 Лог операций: $LOG_FILE"

