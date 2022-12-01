#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi
arreglo=($(cat /etc/passwd | cut -d: -f1))

existe () {
	for i in ${arreglo[*]}; do
		if [ "$i" = "$1" ]; then
			return 0
		fi
	done
return 1
}

eliminar_usuario (){
	local j=0
	local encontre=0
	for i in ${arreglo[*]}; do
		if [ "$i" = "$1" ]; then
			encontre=1
			unset arreglo[j]
			break
		fi
		((j++))
	done
	if [ $encontre -eq 0 ]; then
		echo "error: No existe usuario" >&2;exit 2
	fi
}

usuario_con_patron () {
	for i in ${arreglo[*]}; do
		echo "$i" | grep $1
	done
}

cantidad () {
	echo "${#arreglo[*]}"
}

usuarios () {
	echo "${arreglo[*]}"
}

existe agusnfr
echo "$?"
existe pepe
echo "$?"

cantidad 
eliminar_usuario root
cantidad

usuario_con_patron ag

exit 0
