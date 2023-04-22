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
	printf "$G$usuario$W:$Y$dir$W-$ "
}

leerComando(){
	read entrada
}

mensajeDespedida(){
	printf "\n\n"
	printf "\t\t $R  (                 \n"
	printf "\t\t ( )\   (        (   \n"
	printf "\t\t )((_)  )\ )    ))\  $Y\n"
	printf "\t\t((_)_  (()/(   /((_) \n"
	printf "\t\t$W | _ $Y)  )(_)) (_))  $W \n"
	printf "\t\t | _ \ | || | / -_)  \n"
	printf "\t\t |___/  \_, | \___|  \n"
	printf "\t\t        |__/         \n"
	printf "\n\t\tS a l i e d o   d e \n"
	printf "\t $Glig   T E R M I N A L   P R E B E $W\n"
	printf "\t\t\te n :\n\n"
}

cuentaAtras(){
	printf "\t"
	for i in 3 2 1 
	do
		clear
		imprimirLineaComandos
		mensajeDespedida
		printf "\n\t\t\t $i\n\n\n\n\n"
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

    	case $entrada in
			ayuda)
				clear
				cat ayuda.txt
				printf "\n\n"
				;;
			buscar) 
				./buscar.sh
				;;
			capybara)
				cat capybara.txt
				printf "\n\n"
				;;
			creditos)
				clear
				cat creditosProgramador.txt
				printf "\n\n"
				;;
			infosis)
				./infosis.sh
				;;
			jugar)
				./juegoPREBE.sh
				;;
    		limpiar) 
				clear
				;;
			musica)
				./reproductorMusica.sh
				;;
			tiempo)
				./tiempo.sh
				;;	
			salir)
				printf "\n"
				cuentaAtras
				clear
				cat rei.txt
				sleep 0.5
				clear
	    		exit 0
				;;
			*) # Para cualquier otra entrada
				$entrada 
				printf "$B[Advertencia]$W $entrada: comando no válido.\n"
				;;
    	esac
   	done
}

main