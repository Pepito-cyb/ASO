Pau1() {
  local salida="archivos_peligrosos.txt"
  : > "$salida"
  find . -type f -perm -0002 -print0 2>/dev/null | while IFS= read -r -d '' f; do
    abs="$(readlink -f "$f" 2>/dev/null || realpath "$f" 2>/dev/null || echo "$f")"
    printf '%s\n' "$abs" >> "$salida"
  done
  printf 'lista guardada en %s\n' "$salida"
}
