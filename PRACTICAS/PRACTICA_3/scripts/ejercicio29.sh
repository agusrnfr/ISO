#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
fi

arreglo=()

function verArchivo {
	existe=false
	for i in ${arreglo[*]}; do
		if [ "echo $1" = "echo $i" ]; then
			existe=true
			echo "$i"
			break
		fi
	done
	if [ $existe = "false" ]; then
		echo "Archivo no encontrado"
		return 5
	fi
}

function eliminarArchivo {
	existe=false
        local j=0
        for i in ${arreglo[*]}; do
        	if [ "echo $1" = "echo $i" ]; then
               		existe=true
                        unset arreglo[j]
                        echo "Archivo encontrado"
			break
                else
                 	let j++
                fi
        done
        if [ $existe = "false" ]; then
       		 echo "Archivo no encontrado"
                 return 10
        fi
}

function cantidadArchivos {
	echo "Cantidad: ${#arreglo[*]}"
}

function borrarArchivo {
	echo "¿Desea eliminar el archivo logicamente? (s/n)"
	read i
	case $i in 
		"s")
		 	eliminarArchivo $1
			if [ $? -eq 10 ]; then
				return 10
			else
				echo "Archivo Eliminado del arreglo"
			fi
		;;
		"n") 	
			eliminarArchivo $1
			if [ $? -eq 10 ]; then
				return 10
			else
				$(rm -r $1)
				echo "Archivo Eliminado del arreglo y FHS"
			fi
		;;
		*) 
			echo "Opcion invalida"
		;;
	esac			
}

j=0
for i in $(find $HOME -name "*.txt"); do
	arreglo[j]=$i
	let j++
done

verArchivo pepe
verArchivo /home/agusnfr/Snap/firefox/common/.mozilla/firefox/xqr9dtjx.default/AlternateServices.txt
cantidadArchivos
borrarArchivo /home/agusnfr/hola.txt
borrarArchivo pepe

exit 0
