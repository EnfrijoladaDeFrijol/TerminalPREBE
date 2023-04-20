#!/bin/bash

# Colores para el texto
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
B='\033[1;34m' # Azul
G='\033[1;32m' # Verde
Y='\033[1;33m' # Amarillo
Glig='\e[1;32m' # Verde claro
W='\033[0m' # Blanco

imprimirTitulo(){
	printf "\t  _____ _                      \n"
	printf "\t |_   _(_)___ _ __  _ __  ___  \n"
	printf "\t   | | | / -_) '  \| '_ \/ _ | \n"
	printf "\t   |_| |_\___|_|_|_| .__/\___/ \n"
	printf "\t                   |_|         \n"
}


imprimirFechaHora(){
	printf "$B\n\t\tFecha:$W %(%Y-%m-%d)T \n"
	printf "$B\n\t\tHora:$W %(%H:%M:%S2)T \n"
}

main(){
	clear
	imprimirTitulo
	imprimirFechaHora
	printf "\n\t    'Que tenga un bonito día :)' \n\n"
}

main
