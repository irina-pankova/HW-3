🧩 Практическое задание по Bash

Автор: Ирина Панкова
Тема: Основы Bash. Работа с файлами, процессами, функциями и cron.
Каталог проекта: /Users/irinapankova/Desktop/git_class/HW-3/homework

📁 Структура проекта
homework/
├── alias_script.sh
├── auto_sort_files.sh
├── background_jobs.sh
├── backup_manager.sh
├── check_files.sh
├── check_number.sh
├── create_real_test_files.sh
├── error.log
├── file_redirect.sh
├── functions_example.sh
├── input.txt
├── output.txt
├── report.txt
├── sort_log.txt
├── system_monitor.sh
├── test/
│   ├── a.txt, b.txt
│   └── backup_YYYY-MM-DD_HH-MM-SS/
│       ├── a_YYYY-MM-DD.txt
│       ├── b_YYYY-MM-DD.txt
│       └── backup.log
├── test_final/
│   ├── Documents/
│   ├── Images/
│   ├── otherfile.log
│   └── sort_log.txt
└── ДЗ к теме Bash (проверяемое)_готово.docx

🧠 Основные скрипты
№	Скрипт	Описание
1	check_files.sh	Список файлов, тип, проверка аргумента, права доступа
2	update_path 2.sh	Работа с переменной PATH, добавление в .bashrc
3	check_number.sh	Проверка числа (if / while)
4	functions_example.sh	Функции: приветствие и сумма
5	background_jobs.sh	Работа с процессами (sleep, jobs, fg/bg)
6	file_redirect.sh	Ввод/вывод, перенаправления stdout/stderr
7	alias_script.sh	alias и автодополнение
8	auto_sort_files.sh	Сортировка файлов по типам, ведёт sort_log.txt
9	backup_manager.sh	Резервное копирование с логом и датой
10	system_monitor.sh	Мониторинг CPU, памяти, диска и процессов
⏰ Автоматический запуск через cron

Чтобы сортировка выполнялась каждую ночь в 02:00, добавьте в планировщик cron:

crontab -e


и вставьте строку:

0 2 * * * /Users/irinapankova/Desktop/git_class/HW-3/homework/auto_sort_files.sh

🧾 Логи и результаты
Файл	Назначение
sort_log.txt	история перемещений файлов
backup.log	история резервных копий
error.log	вывод ошибок для перенаправлений
system_report_*.log	отчёты мониторинга ресурсов
✅ Итог

Все задания 1–7 и дополнительные реализованы.

Скрипты протестированы, работают на macOS.

Логи ведутся автоматически, cron готов к подключению.

⭐ Скрипт create_real_test_files.sh полностью самостоятельная разработка, создающая открывающиеся тестовые файлы всех форматов (.txt, .docx, .pdf, .log, .jpg, .png, .gif), он был написан и отлажен самостоятельно,
без шаблонов и готовых решений,
что является уникальным решением в рамках данного задания.