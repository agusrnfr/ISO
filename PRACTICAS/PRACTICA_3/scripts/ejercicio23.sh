#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
else
	arreglo=(3 5 8 10 89 4 1)
	cantImp=0
	for i in ${arreglo[*]}; do
		if [ $(expr $i % 2) -eq 0 ]; then
			echo "Numero par: $i"
		else
			cantImp=$(expr $cantImp + 1)
		fi
	done

	echo "Cantidad impares: $cantImp"

fi
exit 0
