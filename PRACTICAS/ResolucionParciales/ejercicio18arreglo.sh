#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi
arreglo=($(ls -f /var/log | grep access))
cantidad () {
	echo "${#arreglo[*]}"
}

listar () {
	echo "${arreglo[*]}"
}

eliminar () {
	if [ $# -ne 2 ]; then
		echo "Cantidad parametros invalida"
		return 1
	fi
	if [[ "$1" =~ ^[0-9]+$ ]] && ! [ -z ${arreglo[$1]} ] 
	       	#[ $1 -eq $1 2> /dev/null ] && ! [ -z ${arreglo[$1]} ]
       	then
		case $2 in 
			"logico")
				unset arreglo[$1]
				echo "Eliminado logicamente"
			;;
			"fisico") 
				rm /var/log/${arreglo[$1]}
				unset arreglo[$1]
				echo "Eliminado fisicamente"
			;;
			*)
				return 3
			;;
		esac
	else 
		echo "No es posicion valida"
		return 2
	fi
}

listar
cantidad

eliminar 0 logico

eliminar 2 logico

eliminar g logico

listar
cantidad
