#!/bin/bash
if [ $# -ne 3 ]; then
	exit 1
else
	echo "Resultado: $(expr $2 $1 $3)" 
fi
exit 0
