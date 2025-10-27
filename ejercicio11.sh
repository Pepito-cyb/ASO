if [ $# -ne 2 ]; then
    echo "Error. Uso: $0 origen destino"
    exit 1
fi
if [ ! -f "$1" ]; then
    echo "Error: $1 no existe o no es un archivo"
    exit 1
fi
if [ -e "$2" ]; then
    echo "Error: $2 ya existe"
    exit 1
fi
cp "$1" "$2"
echo "copia realizada con exito"
