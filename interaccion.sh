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

imprimirLineaComandos(){
	printf "$R$usuario$W:$Y$dir$W-$ "
}

leerComando(){
	read entrada
}

mensajeDespedida(){
	printf "\n"
	printf "\t\t   (                 \n"
	printf "\t\t ( )\   (        (   \n"
	printf "\t\t )((_)  )\ )    ))\  \n"
	printf "\t\t((_)_  (()/(   /((_) \n"
	printf "\t\t | _ )  )(_)) (_))   \n"
	printf "\t\t | _ \ | || | / -_)  \n"
	printf "\t\t |___/  \_, | \___|  \n"
	printf "\t\t        |__/         \n"
	printf "\n\t\tS a l i e d o   d e \n"
	printf "\t    T E R M I N A L   P R E B E\n"
	printf "\t\t\te n :\n\n"
}

cuentaAtras(){
	printf "\t"
	for i in 3 2 1 
	do
		clear
		imprimirLineaComandos
		mensajeDespedida
		printf "\n\t\t\t $i\n\n\n\n\n\n"
		sleep 1.5
	done
}

main(){
	clear
	obtenerUserCarpeta

	while true
	do
    	imprimirLineaComandos
    	leerComando

    	# 1. Limpiar pantalla
    	if [[ "$entrada" == "limpiar" ]]
    	then
    		clear
    	# 2. Salir si el usuario escribe "salir"
    	elif [[ "$entrada" == "salir" ]]
    	then
    		printf "\n"
    		cuentaAtras
    		clear
    		cat rei.txt
    		sleep 0.5
    		clear
    		exit 0
    	# 3. Mostrar información del sistema
    	elif [[ "$entrada" == "infosis" ]]
    	then
    		./infosis.sh
		# 4. Mostrar la fecha y hora
    	elif [[ "$entrada" == "tiempo" ]]
    	then
    		./tiempo.sh
		# 5. Mostrar ayuda de comandos ERROR
    	elif [[ "$entrada" == "ayuda" ]]
    	then
    		clear
    		cat ayuda.txt
    		printf "\n\n"
    	# 6. EJecuta el juego
    	elif [[ "$entrada" == "jugar" ]]
    	then
    		./juegoPREBE.sh
    	# 7. EJecuta el juego
    	elif [[ "$entrada" == "creditos" ]]
    	then
    		clear
    		cat creditosProgramador.txt
    		printf "\n\n"
    	# 8 Busqueda de un archivo
    	elif [[ "$entrada" == "buscar" ]] 
    	then
    		./buscar.sh
    	# Extra. Easter egg
    	elif [[ "$entrada" == "capybara" ]]
    	then
    		cat capybara.txt
    		printf "\n\n"
    	else
    		printf "$B[Advertencia]$W $entrada: comando no válido.\n"
    	fi


		# Ejecutar el entrada ingresado
	    #salida=$(eval "$entrada" 2>&1)

	    # Mostrar la salida del comando
	    #echo "$salida"
   	done
}

main