#!/bin/bash
if [ $# -ne 1 ]; then
	exit 1
else  
	while [ $1 != "$(who | cut -d" " -f1| grep $1)" ]; do
		echo "Buscando..."
		sleep 10
	done
	    echo "Usuario $1 logeado en el sistema"
				
fi
exit 0
