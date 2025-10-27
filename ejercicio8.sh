read -p "Introduce primer numero: " a
read -p "Introduce segundo numero: " b
if [ "$a" -gt "$b" ]; then
    echo "$a es mayor que $b"
else
    echo "$b es mayor que $a"
fi
