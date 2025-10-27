echo "Menu:"
echo "1) Sumar"
echo "2) Restar"
echo "3) Multiplicar"
echo "4) Dividir"
read -p "Elige una opción: " op
read -p "Introduce primer numero: " x
read -p "Introduce segundo numero: " y
case $op in
    1) echo "Resultado: $((x + y))" ;;
    2) echo "Resultado: $((x - y))" ;;
    3) echo "Resultado: $((x * y))" ;;
    4) echo "Resultado: $((x / y))" ;;
    *) echo "Opcion invalida" ;;
esac
