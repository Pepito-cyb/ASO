read -p "introduce un numero: " n
if (( n % 2 == 0 )); then
    echo "$n es par"
else
    echo "$n es impar"
fi
