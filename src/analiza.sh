#!/usr/bin/env bash
# Kolokwium — plik do samodzielnego uzupełnienia.
# Uruchomienie: bash src/analiza.sh dane
# Wynik: nazwa.log;liczba_ERROR;STATUS

# TODO 1: katalog z argumentu albo domyślnie 'dane'.
# TODO 2: if -d; błąd na stderr i exit 2.
# TODO 3: for po *.log; uwzględnij katalog bez plików .log.
# TODO 4: grep i liczenie wierszy ERROR dla każdego pliku.
# TODO 5: if wyznaczający STATUS zgodnie z ZADANIA.md.
# TODO 6: printf trzy pola oddzielone średnikami.
if [ -n "$1" ]; then
katalog="$1"
else
katalog="dane"
fi
if [ ! -d "$katalog" ]; then
echo "Blad: katalog $katalog nie istnieje" >&2
exit 2
fi

for plik in "$katalog"/*.log; do
liczba=$(grep -c '^WARN' "$plik")
nazwa=$(basename "$plik")

if [ "$liczba" -ge 2 ]; then
status="ALARM"
else
status="OK"
fi
echo "${nazwa};${liczba};${status}"
done
