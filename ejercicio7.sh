if [ -d "$1" ]; then
    nombre="$(date +%F)_$(basename $1).tar.gz"
    tar -czf "$nombre" "$1"
    echo "Archivo creado: $nombre"
else
    echo "debes pasar un directorio valido"
fi
