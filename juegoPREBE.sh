#!/bin/bash

# Colores para el texto
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
B='\033[1;34m' # Azul
G='\033[1;32m' # Verde
Y='\033[1;33m' # Amarillo
Glig='\e[1;32m' # Verde claro
W='\033[0m' # Blanco

# ==-==-==-==-> Creamos el arreglo que será el tablero con variables gloables
S=([1]=1 [2]=2 [3]=3 [4]=4 [5]=5 [6]=6 [7]=7 [8]=8 [9]=9)
circulo_simbolo=O # JUGADOR 1
tache_simbolo=X # JUGADOR 2
rango_num='^[1-9]$' # Es una expresipon regular para validar el rango


# ==-==-==-==-> Creamos una función que será la que imprima nuestro tablero

imprimetitulo(){
	printf "\t  ________         __          \n"
	printf "\t /  _____/_____  _/  |_  ____  \n"
	printf "\t/   \  ___\__  \ \   __\/  _ \ \n"
	printf "\t\    \_\  \/ __ \ |  | (  <_> )\n"
	printf "\t \______  (____ | |__|  \____/ \n"
	printf "\t        \/     \/             \n"
}

dibujaTablero() {
	printf "\n\t$B Jugador1 $W: $circulo_simbolo\t $R jugador2 $W: $tache_simbolo \n"
	printf "\n"
	printf "\t\t ${S[7]} | ${S[8]} | ${S[9]}\n"
	echo "		---+---+---"
	printf "\t\t ${S[4]} | ${S[5]} | ${S[6]}\n"
	echo "		---+---+---"
	printf "\t\t ${S[1]} | ${S[2]} | ${S[3]}\n"
}

elegirCasillaCirculo() {
	
	printf "\n$B [Jugador1] $W Elige un número para empezar (1-9): "
	read opcionCirculo # Leemos el numero del jugador 1

	if ! [[ $opcionCirculo =~ $rango_num ]]
	then
		printf "$R\n\t[Advertencia] Opción inválida$W"
		echo "CASO OPCION NO VALIDA $opcionCirculo"
		elegirCasillaCirculo # Repetimos la función (Recursividad) !!!! CHECAR ESTA PARTE !!!!!
	fi
	if ! [[ ${S[$opcionCirculo]} =~ $rango_num ]] # Vemos si está ocupado
	then
		printf "$R\n\t [Advertencia] La casilla ya está ocupada$W"
		echo "CASO CASILLA OCUPADA$opcionCirculo"
		elegirCasillaCirculo
	else
		S[$opcionCirculo]=$circulo_simbolo
	fi
	# Aquí lo que hiicmos es leer un numero del ususario el cual
	# eserá la posición de la casilla en todo el arreglo del tablero
}

main() {
	clear
	imprimetitulo
	dibujaTablero
	elegirCasillaCirculo
	dibujaTablero
	# Modificar aquí después para hacer más turnos
}

main