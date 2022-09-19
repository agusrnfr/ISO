#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
else
	echo "Menu de comandos" 
	select opcion in $(ls) Salir; do
		case $opcion in 
			"Salir") 
				echo "Saliendo..."
				exit 0
			;;
			*)
				bash $opcion
			;;
		esac
	done
fi
exit 1
