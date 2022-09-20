#!/bin/bash
if [ $# -gt 2 ]; then
	echo "Numero de parametros invalido"
	exit 1
fi

#agrego al arreglo
arreglo=( $(cat /etc/group | grep users | cut -d: -f4| tr ',' ' '))

#dependiendo parametro


case $1 in
	"-b")
		if [ -z $2 ]; then
			echo "Ingrese un valor de n"
		elif [ $2 -lt 0 ] || [ $2 -ge ${#arreglo[*]} ]; then
			echo "Valor de n invalido"
		else
			echo "${arreglo[$2]}"
		fi
	;;
	"-l")
		if ! [ -z $2 ]; then
			echo "Numero de parametros invalido"
		else
			echo "${#arreglo[*]}"
		fi
	;;
	"-i")
		if ! [ -z $2]; then
			echo "Numero de parametros invalido"
		else
			echo "${arreglo[*]}"
		fi
	;;
	*)
		echo "Ingrese un parametro valido"
	;;
esac
exit 0

