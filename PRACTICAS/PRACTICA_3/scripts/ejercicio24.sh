#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi

#SCRIPT
vector1=( 1 80 65 35 2 )
vector2=( 5 98 3 41 8 )

for ((i=0; i < ${#vector1[*]}; i++)); do
	echo "La suma de los elementos de la posicion $1 de los vectores es $(expr ${vector1[$i]} + ${vector2[$i]})"

done
exit 0
