#!/bin/bash

 #mpg123 -C --title -q -z "${lugarMusica}"/*

R='\033[1;31m' #Rojo
G='\033[1;32m' # Verde
B='\033[1;34m' # Azul
Y='\033[1;33m' # Amarillo
Glig='\e[1;32m' # Verde claro
W='\033[0m' # Blanco
M='\033[1;35m' # Mangenta

lineaJajs(){
	printf "\n\t  -------------------------------------------------"
}

imprimirTitulo(){
	clear
	printf "\t   ___  ___  _______  ____          __     _          \n"
	printf "\t  / _ \/ _ \/ __/ _ )/ __/ __ _  __/_/___ (_)______ _ \n"
	printf "\t / ___/ , _/ _// _  / _/  /  ' \/ // (_-</ / __/ _ '/ \n"
	printf "\t/_/  /_/|_/___/____/___/ /_/_/_/\_,_/___/_/\__/\_,_/  \n"
	lineaJajs
}

comprobarmpg123(){ # Función que comprueba si ya está instalado el reproductor
	carpetampg123=/bin/mpg123 # Acá se descarga la carpeta

	if [ -f "$carpetampg123" ] # Comprobamos exista el reporductor
	then
		printf "" # Ya existe
	else
		printf "\n\n\t\t\t$R A D V E R T E N C I A$W \n\n\t\t  No se encuentra instalado 'mpg123' \n"
		lineaJajs
		printf "$Glig\n\n\t\t   ¿Desea instalar mpg123? [s/n]: $W" # Si no, se instala
		read opcion
		case $opcion in
			's') # Queremos instalar
				sudo apt install mpg123
				;;
			'n') # No queremos instalar
				exit 0
				;;
			*)
				printf "Opción no valida"
		esac
	fi
}

imprimirMenu(){ 
	printf "\n\n\t\t\t$M      M E N Ú \n\t\t$W  _______________________________\n"
	printf "\n\t\t   1) Empezar a escuchar música "
	printf "\n\t\t   2) Elige tu canción favorita "
	printf "\n\t\t   3) salir \n"
	lineaJajs
}
leerOpcionMenu(){
	printf "\n\n\t\t    $G¿Qué opción desea?:$W "
	read opcion # Leemos la opción deseada	
}

imprimirControlador(){ # Para canciones en lista
	printf "\n\n\t\t\t$B  O P C I O N E S $W"
	printf "\n\t\t _______________________________\n"
	printf "\n\t\t   d) Anterior    f) Siguiente \n"
	printf "\n\t\t\t   s) Pausa/Play\t"
	printf "\n\t\t\t   u) Silenciar\t"
	printf "\n\t\t\t   l) Canción actual\t"
	printf "\n\t\t\t   q) Salir \n"
	printf "\t\t _______________________________\n"
	printf "\n\t       -) Bajar volumen  +) Subir Volumen \n"
	lineaJajs
}
imprimirControladorIndividual(){ # Para canciones individuales
	printf "\n\n\t\t\t$B  O P C I O N E S $W"
	printf "\n\t\t _______________________________\n"
	printf "\n\t\t\t  s) Pausa/Play\t"
	printf "\n\t\t\t  u) Silenciar\t"
	printf "\n\t\t\t  l) Canción actual\t"
	printf "\n\t\t\t  q) Salir \n"
	printf "\t\t _______________________________\n"
	printf "\n\t       -) Bajar volumen  +) Subir Volumen \n"
	lineaJajs
}

listarCanciones(){ # Función para listar canciones
	cd $lugarMusica # NOs vamos a donde está guardada la música
	listaCacniones=`ls` # Guardamos el contenido de esa carpete
	printf "\n\n\t    $Y C A N C I O N E S   D I S P O N I B L E S $W"
	printf "\n\t\t _______________________________\n"
	for cancion in ${listaCacniones[*]} 
	do
		printf "\n\t\t- $cancion"
	done
	printf "\n"
	lineaJajs
}

elegirCancionFav(){ # Función para elegir una cacnión por su nombre
	listarCanciones
	printf "\n\n$G Copia y pega el nombre de tu cacnión favorita de la lista (sin espacios):$W\n"
	read -p " >>" cancionFav
	cd .. # Para que no hay problemas en la reproducción
}

main(){
	opcion=0
	lugarMusica=musicaPREBE/ # Obtenemos la ruta de la música
	imprimirTitulo # 1. Imprimimos para que se vea bonito
	comprobarmpg123 # 2. Comprobamos que exista el reproductor

	while [ "$opcion" != 3 ]
	do
		clear
		imprimirTitulo # 	Imprimimos para que se vea bonito
		imprimirMenu # 		Mostramos menú
		leerOpcionMenu # 	Vemos qué quiere hacer el usuario

		case $opcion in
			1)				# Cacniones aleatoreas
				clear
				imprimirTitulo
				imprimirControlador
				mpg123 -C --title -q -z "${lugarMusica}"/* # Este comando Alan me lo proporcionó
				;;
			2)				# Canción específica
				clear
				imprimirTitulo
				elegirCancionFav
				clear
				imprimirTitulo
				imprimirControladorIndividual
				mpg123 -C --title -q -z "${lugarMusica}"/"$cancionFav"
				;;
			3)				# Salir
				clear
				exit 0
				;;
			*)				# Opción no válida
				clear
				imprimirTitulo
				imprimirMenu
				printf "\n\n\t\t    $M[Advertencia]$W Opción no válida.\n"
				sleep 1.5
				;;
		esac
	done
}

main	