#!/bin/bash

# Script para buscar un archivo
# -f es para archivos
# -d direcotiro exsite?
# -e existe

#Colores para el texto
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
B='\033[1;34m' # Azul
Y='\033[1;33m' # Amarillo
Glig='\e[1;32m' # Verde claro
W='\033[0m' # Blanco

imprimirTitulo(){
	printf "\t  ___                       \n"
	printf "\t | _ )_  _ ___ __ __ _ _ _  \n"
	printf "\t | _ \ || (_-</ _/ _' | '_| \n"
	printf "\t |___/\_,_/__/\__\__,_|_|   \n"
}

lineaJajs(){
	printf "\n   ------- R e s u l t a d o -------\n"
}

leerInformacion(){
	printf "\n\t   $B Archivo: $W"
	read archivoBuscado 
	printf "\n\t   $B Carpeta: $W"  
	read carpeta # Carpeta donde se buscará
}

buscarInformacion(){
#find <ruta> <opciones> <patrón>
	#find . -name "$archivoBuscado"  Para buscar en el mismo directorio
	ubiCarpeta=$(find "/home/$USER" -name "$carpeta") # 1. Buscamos la carpeta

	#  test -d "direccion"
	if [[ -d "$ubiCarpeta" ]] # 2. Validamos si la carpeta existe con "test -f/d"
	then # 2.a) Existe la carpeta
		ubiArchivo=$(find "/home/$USER" -name "$archivoBuscado") # 3. Buscamos archivo
		if [[ -f "$ubiArchivo" ]] # 4. Validamos si existe el archivo
		then # 4.a) Existe archivo en carpeta 
			lineaJajs
			printf "\n\t Archivo$Glig encontrado$W en:\n$ubiArchivo"
		else # 4.b) No existe el archivo en la carpeta
			lineaJajs
			printf "\n   No existe el archivo $Y en la carpeta. $W"
		fi

	else # 2.b) No existe la carpeta
		lineaJajs
		printf "\n   La carpeta$R no existe$W en el sistema."
	fi
}

main(){
	clear
	imprimirTitulo
	leerInformacion
	buscarInformacion
	printf "\n\n"
}

main