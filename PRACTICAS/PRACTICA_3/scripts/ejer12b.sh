#!/bin/bash
if [ $# -ne 2 ]; then
	exit 1
else
	echo "Multiplicacion: `expr $1 \* $2`"
	echo "Suma: `expr $1 + $2`"
	echo "Resta: `expr $1 - $2`"
	echo "Division: `expr $1 / $2`"
fi
exit 0
