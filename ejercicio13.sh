archivo="lista.txt"
while true; do
    echo "AGENDA:"
    echo "1) Añadir"
    echo "2) Buscar"
    echo "3) Listar"
    echo "4) Ordenar"
    echo "5) Borrar"
    echo "6) Salir"
    read -p "Elige opcion: " op
    case $op in
        1) read -p "Nombre: " n
           read -p "Direccion: " d
           read -p "Telefono: " t
           echo "$n | $d | $t" >> $archivo ;;
        2) read -p "Buscar: " b
           grep "$b" $archivo ;;
        3) cat $archivo ;;
        4) sort $archivo ;;
        5) rm -f $archivo; echo "Archivo borrado" ;;
        6) exit 0 ;;
        *) echo "Opcion invalida" ;;
    esac
done
