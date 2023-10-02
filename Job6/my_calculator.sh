if [ "$2" = "+" ]; then
    b=$(($1+$3))
    echo "Résultat : $b"
elif [ "$2" = "-" ]; then
    b=$(($1-$3))
    echo "Résultat : $b"
elif [ "$2" = "/" ]; then
    b=$(($1/$3))
    echo "Résultat : $b"
elif [ "$2" = "x" ]; then
    b=$(($1*$3))
    echo "Résultat : $b"
fi
