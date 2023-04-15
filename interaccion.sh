#!/bin/bash

#Colores para el texto
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
B='\033[1;34m' # Azul
Y='\033[1;33m' # Amarillo
Glig='\e[1;32m' # Verde claro
W='\033[0m' # Blanco

obtenerUserCarpeta(){
	usuario=$(whoami)
	dir=$(pwd) #Obtiene la ubicación actual
}

imprimirLeerLineaComandos(){
	printf "\n$R$usuario$W:$Y$dir$W-$ "
	read entrada
}

main(){
	clear
	obtenerUserCarpeta

	while true
	do

    	imprimirLeerLineaComandos

    	# Limpiar pantalla
    	if [[ "$entrada" == "limpiar" ]]
    	then
    		clear
    	fi

    	
    	# Salir si el usuario escribe "salir"
    	if [[ "$entrada" == "salir" ]]
    	then
    		printf "\n HASTA LUEGO\n\n"
    		exit 0
    	fi

    	# Mostrar información del sistema
    	if [[ "$entrada" == "infosis" ]]
    	then
    		./infosis.sh
    	fi

		# Mostrar la fecha y hora
    	if [[ "$entrada" == "tiempo" ]]
    	then
    		./tiempo.sh
    	fi

		# Mostrar ayuda de comandos ERROR
    	if [[ "$entrada" == "ayuda" ]]
    	then
    		clear
    		cat ayuda.txt
    		printf "\n\n"
    	fi

    	# EJecuta el juego
    	if [[ "$entrada" == "jugar" ]]
    	then
    		./juegoPREBE.sh
    	fi

    	# EJecuta el juego
    	if [[ "$entrada" == "creditos" ]]
    	then
    		clear
    		cat creditosProgramador.txt
    		printf "\n\n"
    	fi

		# Ejecutar el entrada ingresado
	    #salida=$(eval "$entrada" 2>&1)

	    # Mostrar la salida del comando
	    #echo "$salida"
   	done
}

main