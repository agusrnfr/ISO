#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi

arreglo=()

insert () {
	if [ $# -eq 1 ]; then
		arreglo+=($1)
	fi
}

rellenar () {
	if [ $# -eq 1 ]; then
		for ((i=0; i < $1; i++));do
			echo "Ingrese texto"
			read agrego
			arreglo+=($agrego)
		done
	fi
}

selected () {
	if [ $# -eq 1 ]; then
		if [ "$1" = "*" ]; then
			echo "${arreglo[*]}"
		else
			local encontre="false"
			for i in ${arreglo[*]}; do
				if [ "$i" = "$1" ]; then
					encontre="true"
					echo "$i"
					break
				fi
			done
			if [ $encontre = "false" ]; then
				echo "Elemento no encontrado"
			fi
		fi
	fi
}

delete () { 
	if [ $# -eq 1 ]; then
		if [ "$1" = "*" ]; then
			unset arreglo[*]
		else
			j=0
			local encontre="false"
			for i in ${arreglo[*]}; do
				if [ "$i" = "$1" ]; then
					encontre="true"
					unset arreglo[$j]
					break
				fi
				((j++))
			done
			if [ $encontre = "false" ]; then
				echo "Elemento no encontrado"
			fi
		fi
	fi
}

insert 1
insert 2
insert 3
insert
selected "*"

rellenar 3

selected "*"

echo "BUSCO PEDRO"
selected pedro

echo "BUSCO A 2"
selected 2

echo "BUSCO NADA"

selected 

echo "ELIMINO PEDRO"
delete pedro

echo "ELIMINO 3"
delete 3

selected "*"

delete "*"

selected "*"
