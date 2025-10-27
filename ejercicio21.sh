num=42
while true; do
    read -p "Adivina el número (0 para rendirse): " n
    if [ $n -eq 0 ]; then
        echo "Te rendiste"
        break
    elif [ $n -eq $num ]; then
        echo "Enhorabuena, acertaste"
        break
    elif [ $n -lt $num ]; then
        echo "El numero es mayor"
    else
        echo "El numero es menor"
    fi
done
