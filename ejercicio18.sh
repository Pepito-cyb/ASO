suma=0
while true; do
    read -p "Introduce un número (0 para salir): " n
    if [ "$n" -eq 0 ]; then
        echo "Suma final: $suma"
        break
    fi
    suma=$((suma+n))
    echo "Suma parcial: $suma"
done
