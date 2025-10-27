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
