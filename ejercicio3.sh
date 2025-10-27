ls /etc > listado.txt
cat listado.txt
echo "numero de lineas: $(wc -l < listado.txt)"
echo "numero de palabras: $(wc -w < listado.txt)"
