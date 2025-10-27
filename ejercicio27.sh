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
