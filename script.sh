#!/bin/bash

# Ім'я файлу скрипта (визначається автоматично)
SCRIPT_NAME=$(basename "$0")

# Перевірка, чи передано два параметри
if [ $# -ne 2 ]; then
    echo "Помилка: необхідно передати рівно два числові параметри."
    exit 1
fi

# Зчитування параметрів
PARAM1=$1
PARAM2=$2

# Перевірка, чи є параметри числовими
if ! [[ $PARAM1 =~ ^-?[0-9]+$ && $PARAM2 =~ ^-?[0-9]+$ ]]; then
    echo "Помилка: обидва параметри мають бути числовими."
    exit 1
fi

# Порівняння параметрів
if [ $PARAM1 -gt $PARAM2 ]; then
    echo "Перший параметр ($PARAM1) більше за другий ($PARAM2)."
    echo "Список псевдонімів alias в системі:"
    alias
else
    echo "Перший параметр ($PARAM1) не більше за другий ($PARAM2)."
    if [ -f "$SCRIPT_NAME" ]; then
        FILE_SIZE=$(stat -c%s "$SCRIPT_NAME")
        echo "Розмір файлу скрипта '$SCRIPT_NAME': $FILE_SIZE байтів."
    else
        echo "Файл скрипта '$SCRIPT_NAME' не знайдено."
    fi
fi
