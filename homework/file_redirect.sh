#!/bin/bash

# 1. Читаем данные из файла input.txt
echo "Читаем данные из input.txt:"
cat input.txt
echo "-----------------------------------"

# 2. Перенаправляем результат команды wc -l (подсчет строк) в файл output.txt
# wc -l считает количество строк в файле
wc -l input.txt > output.txt
echo "Результат подсчета строк записан в output.txt."

# 3. Перенаправляем ошибки выполнения команды ls для несуществующего файла в error.log
ls nonexistent_file.txt 2> error.log
echo "Ошибки (если есть) записаны в error.log."
