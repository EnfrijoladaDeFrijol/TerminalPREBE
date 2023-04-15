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
	printf "\t  ___ _    _                   \n"
	printf "\t / __(_)__| |_ ___ _ __  __ _  \n"
	printf "\t \__ \ (_-<  _/ -_) '  \/ _' | \n"
	printf "\t |___/_/__/\__\___|_|_|_\__,_| \n"
	printf "\n\t    I n f o r m a c i ó n\n"
}

obtenerInfo(){
	#memorRAM=$(free -t --mega; grep 'MemTotal' /proc/meminfo; grep 'SwapTotal' /proc/meminfo)
	memorRAM=$(free -h)
	arquitec=$(uname -m)
	versionSO=$(lsb_release -idc)

}

imprimirInfo(){
	printf "$B\n\t1. Aquitectura\n$W$arquitec \n"
	printf "$B\n\t2. Memoria RAM\n$W $memorRAM \n"
	printf "$B\n\t3. Versión del SO\n$W $versionSO \n"
	printf "\n"
}

main(){
	clear
	imprimirTitulo
	obtenerInfo
	imprimirInfo
}

main