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
# Así mismo definimos las variables que usaremos
circulo_simbolo=o # JUGADOR 1
tache_simbolo=x # JUGADOR 2
rango_num='^[1-9]$' # Es una expresipon regular para validar el rango

# ==-==-==-==-> Creamos una función que será la que imprima nuestro tablero
imprimirTitulo(){
	printf "\t  ________   M<3   __          \n"
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
	declare -i controlador=1 # Declaramos esto para controlar las repeteciones
							 # al elegir opciones
	while [ $controlador -eq 1 ]
	do
		printf "\n$B [Jugador1] $W Elige un número: (1-9): "
		read opcionCirculo # Leemos el numero del jugador 1

		if ! [[ $opcionCirculo =~ $rango_num ]]
		then
			printf "$R\n\t[Advertencia] Opción inválida$W"
			echo "1)CASO OPCION NO VALIDA $opcionCirculo"
		fi
		if ! [[ ${S[$opcionCirculo]} =~ $rango_num ]] # Vemos si está ocupado
		then
			printf "$R\n\t [Advertencia] La casilla ya está ocupada$W"
			echo "2)CASO CASILLA OCUPADA $opcionCirculo"
		else
			S[$opcionCirculo]=$circulo_simbolo
			controlador=0
		fi
	done
}

elegirCasillaTache() {
	declare -i controlador=1 # Declaramos esto para controlar las repeteciones
							 # al elegir opciones
	while [ $controlador -eq 1 ]
	do
		printf "\n$R [Jugador2] $W Elige un número: (1-9): "
		read opcionTache # Leemos el numero del jugador 1

		if ! [[ $opcionTache =~ $rango_num ]]
		then
			printf "$R\n\t[Advertencia] Opción inválida$W"
			echo "1)CASO OPCION NO VALIDA $opcionTache"
		fi
		if ! [[ ${S[$opcionTache]} =~ $rango_num ]] # Vemos si está ocupado
		then
			printf "$R\n\t [Advertencia] La casilla ya está ocupada$W"
			echo "2)CASO CASILLA OCUPADA $opcionTache"
		else
			S[$opcionTache]=$tache_simbolo
			controlador=0
		fi
		# Aquí lo que hiicmos es leer un numero del ususario el cual
		# eserá la posición de la casilla en todo el arreglo del tablero
	done
}

jugador() {
  local simbolo=$1
  [[ $simbolo == $usuario_simbolo ]] && printf "Jugador 2" || printf "Jugador 1"
}

ganadorFuncion() {
  #local ganador_simbolo=$1
  imprimirTitulo
  printf "\t==========================================\n"
  printf "\t         $(jugador $ganador_simbolo) gana!!!    \n"
  printf "\t==========================================\n"
  dibujaTablero
  exit 0
}

validarGanador() {
  # Validamos horizontalmente
  for i in 1 4 7
  do
    j=$(($i + 1))
    k=$(($i + 2))
    ganador_simbolo=${S[$i]}
    [[ ${S[$i]} == ${S[$j]} ]] && [[ ${S[$j]} == ${S[$k]} ]] && ganadorFuncion $ganador_simbolo
  done
  # Validamos verticalmente
  for i in 1 2 3 # i j k
  do
    j=$(($i + 3))
    k=$(($i + 6))
    ganador_simbolo=${S[$i]}
    [[ ${S[$i]} == ${S[$j]} ]] && [[ ${S[$j]} == ${S[$k]} ]] && ganadorFuncion $ganador_simbolo
  done
  # Validamos diagonalmente
  ganador_simbolo=${S[5]}
  [[ ${S[1]} == ${S[5]} ]] && [[ ${S[5]} == ${S[9]} ]] && ganadorFuncion $ganador_simbolo
  [[ ${S[7]} == ${S[5]} ]] && [[ ${S[5]} == ${S[3]} ]] && ganadorFuncion $ganador_simbolo
}

main() {
	clear
	while true
	do
		imprimirTitulo
		dibujaTablero
		elegirCasillaCirculo
		clear
		validarGanador

		imprimirTitulo
		dibujaTablero
		elegirCasillaTache
		clear
		validarGanador
		
	done
}

main