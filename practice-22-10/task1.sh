#!/bin/bash
#Вариант 1
#grep -o -w "$2" "$1" | wc -l
#Вариант 2
grep "$2" -c "$1"