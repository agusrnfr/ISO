#!/bin/bash
if [ $# -ne 0]; then
	exit 1
else
	select var in Listar DondeEstoy QuienEsta
	do
		case $var in
			"Listar")
				echo "$(ls)"
			;;
			"DondeEstoy")
				echo "$(pwd)"
			;;
			"QuienEsta")
				echo "$(who)"
			;;
		esac
	done
fi
exit 0
