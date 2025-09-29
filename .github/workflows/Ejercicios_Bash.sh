#!/bin/bash
# Ejercicio 1
echo "Hola Mundo"

# Ejercicio 2
ls /etc > listado.txt
cat listado.txt

# Ejercicio 3
ls /etc > listado.txt
cat listado.txt
echo "numero de lineas: $(wc -l < listado.txt)"
echo "numero de palabras: $(wc -w < listado.txt)"

# Ejercicio 4
read -p "introduce el primer numero: " num1
read -p "introduce el segundo numero: " num2
echo "los numeros introducidos son: $num1 y $num2"

# Ejercicio 5
read -p "introduce el primer numero: " a
read -p "introduce el segundo numero: " b
media=$(( (a + b) / 2 ))
echo "la media es: $media"

# Ejercicio 6
read -p "Introduce una palabra: " palabra
echo "$palabra" >> lista.txt
echo "palabra añadida a lista.txt"

# Ejercicio 7
if [ -d "$1" ]; then
    nombre="$(date +%F)_$(basename $1).tar.gz"
    tar -czf "$nombre" "$1"
    echo "Archivo creado: $nombre"
else
    echo "debes pasar un directorio valido"
fi

# Ejercicio 8
read -p "Introduce primer numero: " a
read -p "Introduce segundo numero: " b
if [ "$a" -gt "$b" ]; then
    echo "$a es mayor que $b"
else
    echo "$b es mayor que $a"
fi

# Ejercicio 9
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

# Ejercicio 10
read -p "introduce un numero: " n
if (( n % 2 == 0 )); then
    echo "$n es par"
else
    echo "$n es impar"
fi

# Ejercicio 11
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

# Ejercicio 12
hora=$(date +%H)
if (( hora >= 8 && hora < 15 )); then
    echo "Buenos días"
elif (( hora >= 15 && hora < 20 )); then
    echo "Buenas tardes"
else
    echo "Buenas noches"
fi

# Ejercicio 13
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

# Ejercicio 14
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

# Ejercicio 15
if [ -z "$1" ]; then
    echo "Uso: $0 número"
    exit 1
fi
for i in {1..10}; do
    echo "$i x $1 = $((i * $1))"
done

# Ejercicio 16
suma=0
for i in {1..1000}; do
    suma=$((suma+i))
done
echo "Suma con for: $suma"
suma=0
i=1
while [ $i -le 1000 ]; do
    suma=$((suma+i))
    ((i++))
done
echo "Suma con while: $suma"
suma=0
i=1
until [ $i -gt 1000 ]; do
    suma=$((suma+i))
    ((i++))
done
echo "Suma con until: $suma"

# Ejercicio 17
suma=0
while true; do
    read -p "Introduce un número (0 para salir): " n
    if [ "$n" -eq 0 ]; then
        echo "Suma final: $suma"
        break
    fi
    suma=$((suma+n))
    echo "Suma parcial: $suma"
done

# Ejercicio 18
for i in {1..5}; do
    for j in $(seq 1 $i); do
        echo -n "*"
    done
    echo
done

# Ejercicio 19
for i in {5..1}; do
    for j in $(seq 1 $i); do
        echo -n "*"
    done
    echo
done

# Ejercicio 20
if [ -z "$1" ]; then
    echo "Uso: $0 número"
    exit 1
fi
n=$1
for ((i=2; i<=n/2; i++)); do
    if (( n % i == 0 )); then
        echo "$n no es primo"
        exit 0
    fi
done
echo "$n es primo"

# Ejercicio 21
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

# Ejercicio 22
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

# Ejercicio 23
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

# Ejercicio 24
if [ ! -d "$1" ]; then
    echo "Debe ser un directorio valido."
    exit 1
fi
ficheros=$(find "$1" -maxdepth 1 -type f | wc -l)
directorios=$(find "$1" -maxdepth 1 -type d | wc -l)
directorios=$((directorios - 1))
echo "Ficheros: $ficheros"
echo "Subdirectorios: $directorios"


# ejercicio 25
Pau() {
  last -i | egrep -E '([0-9]{1,3}\.){3}[0-9]{1,3}|([a-f0-9:]{2,})'
}

# ejercicio 26
Pau1() {
  local salida="archivos_peligrosos.txt"
  : > "$salida"
  find . -type f -perm -0002 -print0 2>/dev/null | while IFS= read -r -d '' f; do
    abs="$(readlink -f "$f" 2>/dev/null || realpath "$f" 2>/dev/null || echo "$f")"
    printf '%s\n' "$abs" >> "$salida"
  done
  printf 'lista guardada en %s\n' "$salida"
}

# ejercicio 27
Pau2() {
  local f="$1"
  if [ -z "$f" ]; then
    echo "uso: $0 27 ruta/al/fichero"
    return 1
  fi

  existe() { [ -f "$1" ]; }

  if existe "$f"; then
    chmod u+x,go-x -- "$f"
    echo "permisos actualizados en: $f"
  else
    echo "el fichero no existe: $f"
    return 2
  fi
}

ex28() {
  local salida="${1:-informe_red.txt}"

  local ipcidr ip cidr base net bcast mask
  ipcidr="$(ip -4 -o addr show scope global 2>/dev/null | awk '{for(i=1;i<=NF;i++) if($i=="inet") print $(i+1)}' | head -n1)"
  if [ -z "$ipcidr" ]; then
    echo "no se encontro ip v4"
    return 1
  fi

  ip="${ipcidr%/*}"
  cidr="${ipcidr#*/}"
  base="$(echo "$ip" | cut -d. -f1-3)"
  net="${base}.0"
  bcast="${base}.255"
  mask="255.255.255.0"

  {
    echo "informe de red simple"
    echo "equipo ip: $ip"
    echo "red cidr: $net/24 (detectado $cidr, se escanea como /24)"
    echo "broadcast: $bcast"
    echo "mascara: $mask"
    echo
    echo "listado de ips:"
    for h in $(seq 1 254); do
      host="${base}.${h}"
      if ping -c1 -W1 "$host" >/dev/null 2>&1; then
        echo "$host ocupada"
      else
        echo "$host libre"
      fi
    done
  } > "$salida"

  echo "informe generado en $salida"
}
