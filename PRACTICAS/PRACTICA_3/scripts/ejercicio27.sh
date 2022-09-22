#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi

function inicializar {
	array=()
}

function agregar_elem {
	if [ $# -ne 1 ]; then
		echo "Numero de parametros invalido"
	else
		array[${#array[*]}]=$1
	fi
}

function eliminar_elem {
	if [ $1 -lt ${#array[*]} ]; then
		unset array[$1]
	else
		echo "Ingrese posicion valida"
	fi
}

function longitud {
	echo "${#array[*]}"
}	

function imprimir {
	echo "${array[*]}"
}	

function inicializar_Con_Valores {
	if [ $# -ne 2 ]; then
		echo "Numero de parametros invalido"
	else
		arreglo=()
		for ((i=0; i < $1; i++)); do
			arreglo[i]=$2
		done
		echo "arreglo: ${arreglo[*]}"
	fi
}


#LLAMADAS

inicializar 
agregar_elem 2
agregar_elem 1
agregar_elem 3
eliminar_elem 2
longitud
imprimir
inicializar_Con_Valores 3 4
exit 0
