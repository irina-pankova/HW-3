#!/bin/bash
#
# Скрипт мониторинга системы с опцией сохранения отчёта

echo "--------------------------------------"
echo "📊 Мониторинг системы — $(date)"
echo "--------------------------------------"

# 1️⃣ Загрузка процессора
echo "🧠 Загрузка процессора:"
top -l 1 | grep "CPU usage"

# 2️⃣ Использование памяти
echo
echo "💾 Использование памяти:"
mem_used=$(vm_stat | grep 'Pages active' | awk '{print $3}' | sed 's/\.//')
mem_inactive=$(vm_stat | grep 'Pages inactive' | awk '{print $3}' | sed 's/\.//')
mem_wired=$(vm_stat | grep 'Pages wired down' | awk '{print $4}' | sed 's/\.//')
mem_free=$(vm_stat | grep 'Pages free' | awk '{print $3}' | sed 's/\.//')

page_size=$(vm_stat | head -1 | awk '{print $8}')
total_mem_pages=$((mem_used + mem_inactive + mem_wired + mem_free))
mem_total_mb=$((total_mem_pages * page_size / 1024 / 1024))
mem_used_mb=$(((mem_used + mem_inactive + mem_wired) * page_size / 1024 / 1024))
mem_percent=$((mem_used_mb * 100 / mem_total_mb))

echo "Всего памяти: ${mem_total_mb}MB"
echo "Использовано: ${mem_used_mb}MB (${mem_percent}%)"

# 3️⃣ Использование дискового пространства
echo
echo "💽 Использование диска:"
df -h /

# 4️⃣ Проверка порога памяти (80%)
if [ "$mem_percent" -gt 80 ]; then
  echo
  echo "⚠️  Внимание! Использование памяти превышает 80%!"
  echo "🔝 Топ-10 процессов по памяти:"
  ps aux | sort -nr -k 4 | head -10
fi

echo
echo "✅ Мониторинг завершён."
echo "--------------------------------------"

# 5️⃣ Предложение сохранить отчёт
echo
echo "💾 Хотите сохранить отчёт в файл?"
echo "Введите один из вариантов:"
echo "  y  — да, сохранить отчёт"
echo "  n  — нет, не сохранять"
echo "  (можно также использовать Y/N)"
read -p "Ваш выбор (y/n): " save_report

if [[ "$save_report" == "y" || "$save_report" == "Y" ]]; then
  LOG_DIR="$HOME/system_logs"
  mkdir -p "$LOG_DIR"
  LOG_FILE="$LOG_DIR/system_report_$(date '+%Y-%m-%d_%H-%M-%S').log"

  {
    echo "--------------------------------------"
    echo "📊 Отчёт о состоянии системы — $(date)"
    echo "--------------------------------------"
    echo "🧠 Загрузка процессора:"
    top -l 1 | grep "CPU usage"
    echo
    echo "💾 Использование памяти:"
    echo "Всего памяти: ${mem_total_mb}MB"
    echo "Использовано: ${mem_used_mb}MB (${mem_percent}%)"
    echo
    echo "💽 Использование диска:"
    df -h /
    echo
    if [ "$mem_percent" -gt 80 ]; then
      echo "⚠️  Внимание! Использование памяти превышает 80%!"
      echo "🔝 Топ-10 процессов по памяти:"
      ps aux | sort -nr -k 4 | head -10
    fi
    echo
    echo "--------------------------------------"
    echo "✅ Отчёт сохранён успешно."
  } > "$LOG_FILE"

  echo "📄 Отчёт сохранён в: $LOG_FILE"
else
  echo "❎ Отчёт не сохранён."
fi
