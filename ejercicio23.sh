if [ ! -d "$1" ]; then
    echo "Debe ser un directorio valido"
    exit 1
fi
for i in "$1"/*; do
    if [ -h "$i" ]; then
        echo "$(basename $i) -> Enlace simbolico"
    elif [ -b "$i" ]; then
        echo "$(basename $i) -> Archivo especial de bloque"
    elif [ -c "$i" ]; then
        echo "$(basename $i) -> Archivo especial de caracter"
    elif [ -d "$i" ]; then
        echo "$(basename $i) -> Directorio"
    elif [ -f "$i" ]; then
        echo "$(basename $i) -> Fichero"
    fi
done
