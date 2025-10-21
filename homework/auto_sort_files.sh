#!/bin/bash
# Скрипт: auto_sort_files.sh
# Назначение: сортирует файлы в test_final по типам и ведет лог перемещений

# ===== Пути =====
BASE_DIR="/Users/irinapankova/Desktop/git_class/HW-3/homework/test_final"
DOC_DIR="$BASE_DIR/Documents"
IMG_DIR="$BASE_DIR/Images"
LOG_FILE="$BASE_DIR/sort_log.txt"

# ===== Подготовка =====
mkdir -p "$DOC_DIR" "$IMG_DIR"

echo "--------------------------------------" >> "$LOG_FILE"
echo "🕒 Сортировка запущена: $(date)" >> "$LOG_FILE"

# ===== Функция перемещения =====
move_files() {
  local pattern=$1
  local target_dir=$2
  local label=$3

  shopt -s nullglob
  files=("$BASE_DIR"/*.$pattern)
  if [ ${#files[@]} -gt 0 ]; then
    echo "📦 Перемещаем $label:" >> "$LOG_FILE"
    for f in "${files[@]}"; do
      mv "$f" "$target_dir/"
      echo "  → $(basename "$f") → $target_dir" >> "$LOG_FILE"
    done
  fi
}

# ===== Сортировка =====
# Документы
move_files "txt" "$DOC_DIR" "текстовые документы"
move_files "pdf" "$DOC_DIR" "PDF-файлы"
move_files "docx" "$DOC_DIR" "Word-документы"

# Изображения
move_files "jpg" "$IMG_DIR" "изображения JPG"
move_files "png" "$IMG_DIR" "изображения PNG"
move_files "gif" "$IMG_DIR" "изображения GIF"

echo "✅ Сортировка завершена: $(date)" >> "$LOG_FILE"
echo "--------------------------------------" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

echo "✅ Файлы отсортированы. Отчёт: $LOG_FILE"
