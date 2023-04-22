#!/bin/bash

# Colores para el texto
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
B='\033[1;34m' # Azul
G='\033[1;32m' # Verde
Y='\033[1;33m' # Amarillo
Glig='\e[1;32m' # Verde claro
W='\033[0m' # Blanco

instalarReproductor(){
	sudo apt-get update
	sudo apt-get install mpg123
}

main(){
	instalarReproductor
}

main