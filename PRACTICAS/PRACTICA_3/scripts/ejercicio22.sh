#!/bin/bash
if [ $# -ne 0 ]; then
	exit 1
else
	num=(10 3 5 7 9 3 5 4)
	#mult=1
	function productoria { 
		local mult=1
		for ((i=0; i < ${#num[*]}; i++)); do
			mult=$(expr $mult \* ${num[i]})
		done
		echo "El resultado es: $mult"	
	}

	#TESTEO
	productoria
	#echo "El resultado es $mult"
fi
exit 0
