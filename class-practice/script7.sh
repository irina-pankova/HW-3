#!/bin/bash

# Определяем функцию
add() {
    local a=$1
    local b=$2
    echo $((a + b))
}

# Основная часть скрипта
read -p "Введите два числа через пробел: " num1 num2
echo "Сумма: $(add "$num1" "$num2")"
