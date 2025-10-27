if [ ! -d "$1" ]; then
    echo "Debe ser un directorio valido."
    exit 1
fi
ficheros=$(find "$1" -maxdepth 1 -type f | wc -l)
directorios=$(find "$1" -maxdepth 1 -type d | wc -l)
directorios=$((directorios - 1))
echo "Ficheros: $ficheros"
echo "Subdirectorios: $directorios"
