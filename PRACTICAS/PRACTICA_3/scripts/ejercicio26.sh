#!/bin/bash
if [ $# -lt 1 ]; then
	exit 1
fi

cant=0
it=0
for i in $*; do
	let it++
	if [ $(expr $it % 2) -ne 0 ]; then
		if ! [ -e $i ]; then
			echo "No existe"
			cant=$(expr $cant + 1)
		else
			if [ -d $i ]; then
				echo "Existe es un directorio"
			else 
				if [ -f $i ]; then
					echo "Existe es un archivo"
				fi
			fi
		fi
	else
		continue 2
	fi
done

echo "Cantidad de archivos inexistentes: $cant"

exit 0
