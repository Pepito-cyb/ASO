if [ ! -d "$1" ]; then
    echo "Debe ser un directorio valido"
    exit 1
fi
count=0
for i in "$1"/*; do
    if [ -d "$i" ]; then
        echo "$(basename $i) -> Directorio"
    else
        echo "$(basename $i) -> Fichero"
    fi
    ((count++))
done
echo "Total entradas: $count"
