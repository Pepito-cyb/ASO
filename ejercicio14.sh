if [ $# -lt 4 ]; then
    echo "Error. Uso: $0 alta/baja nombre apellido1 apellido2 [grupo]"
    exit 1
fi
accion=$1
nombre=$2
ap1=$3
ap2=$4
grupo=$5
id="alu${ap1:0:2}${ap2:0:2}${nombre:0:1}"
if [ "$accion" == "alta" ]; then
    if [ -z "$grupo" ]; then
        grupo=$id
        groupadd $grupo
    fi
    useradd -m -g $grupo -c "$nombre $ap1 $ap2" $id
    echo "Usuario $id creado"
elif [ "$accion" == "baja" ]; then
    userdel -r $id
    echo "Usuario $id eliminado"
else
    echo "Error. Uso: $0 alta/baja nombre apellido1 apellido2 [grupo]"
fi
