#!/bin/bash
# --- Проверяем, передан ли аргумент ---
if [ -z "$1" ]; then
    echo "❗ Укажите директорию, которую нужно добавить в PATH."
    echo "Пример: ./update_path.sh /Users/irinapankova/Desktop/git_class/HW-3/homework"
    exit 1
fi

NEW_DIR="$1"

# --- 1. Выводим текущее значение PATH ---
echo "🔹 Текущее значение PATH:"
echo "$PATH"
echo

# --- 2. Добавляем новую директорию во временный PATH ---
export PATH="$PATH:$NEW_DIR"

echo "✅ Новая директория '$NEW_DIR' временно добавлена в PATH."
echo
echo "🔹 Теперь PATH выглядит так:"
echo "$PATH"
echo

# --- 3. Подсказка, как сделать добавление постоянным ---
echo "ℹ️  Изменения, сделанные этой командой, действуют только до закрытия терминала."
echo "Чтобы добавить директорию в PATH навсегда, добавьте следующую строку в файл ~/.bashrc:"
echo
echo "    export PATH=\"\$PATH:$NEW_DIR\""
echo
echo "После этого примените изменения командой:"
echo
echo "    source ~/.bashrc"
echo
echo "или просто перезапустите терминал."

# --- 4. Предлагаем добавить путь в PATH навсегда ---
CONFIG_FILE="$HOME/.bashrc"
if [ -n "$ZSH_VERSION" ]; then
    CONFIG_FILE="$HOME/.zshrc"
fi

read -p "Хотите добавить '$NEW_DIR' в PATH навсегда (в $CONFIG_FILE)? [y/N] " answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
    echo "export PATH=\"\$PATH:$NEW_DIR\"" >> "$CONFIG_FILE"
    echo "✅ Директория добавлена в $CONFIG_FILE."
    echo "Чтобы применить изменения, выполните: source $CONFIG_FILE"
else
    echo "⏭  Изменения не сохранены в конфигурационный файл."
fi

#(Опционально) Проверку, есть ли путь уже в PATH, чтобы не дублировать
if [[ ":$PATH:" == *":$NEW_DIR:"* ]]; then
    echo "⚠️  Директория '$NEW_DIR' уже есть в PATH."
else
    export PATH="$PATH:$NEW_DIR"
    echo "✅ Директория '$NEW_DIR' временно добавлена в PATH."
fi
