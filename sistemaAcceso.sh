#!/bin/bash

R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
Y='\033[1;33m' # Amarillo
B='\033[1;34m' # Azul
M='\033[1;35m' # Mangenta
W='\033[0m' # Blanco
Glig='\e[1;32m' # Verde claro

imprimirTitulo(){
	clear
	printf "\t  _____              _           _   ___ ___ ___ ___ ___ \n"
	printf "\t |_   _|__ _ _ _ __ (_)_ _  __ _| | | _ \ _ \ __| _ ) __|\n"
	printf "\t   | |/ -_) '_| '  \| | ' \/ _' | | |  _/   / _|| _ \ _| \n"
	printf "\t   |_|\___|_| |_|_|_|_|_||_\__,_|_| |_| |_|_\___|___/___|\n"
	printf "\n\t\t\tI n i c i o   d e   s e i ó n\n"
}

solicitarDatos(){
	printf "$G\n\t\t\t\tUsuario: $W"
	read nomUsuario
	printf "$G\n\t\t\t     Contraseña: $W"
	read -s contrasena	
}

obtenerContrasenaReal(){
	# Al igual que otrto compañero, me basé en el código de Jhno
	# Lo que saqué de ahí fue cómo encriptar la contraseña para que se
	# pueda compara con la del sistema, me reuní con Alan para poder entender esta parte
	cadena=`sudo -S grep -r $nomUsuario /etc/shadow`
	IFS='$' read -e -r -a array <<< "$cadena"
	salt_hashed="\$${array[1]}\$${array[2]}\$${array[3]}$"
	hash=`python3 -c 'import crypt; import sys; print(crypt.crypt( sys.argv[1], sys.argv[2]));' $contrasena $salt_hashed`
}

lineaxD(){
	printf "\n\n\t\t   ------------------------------------"
}

validacionDatos(){
	# Comprobar si el nomUsuario existe en el sistema
	if id "$nomUsuario" >/dev/null 2>&1 
	then

	 	# Comprobar si la contraseña del nomUsuario es correcta
		match=`echo "$cadena" | grep -c "$hash"`
		if [ "$match" -eq 1 ]
		then
			lineaxD
			printf "\n\n\t\t\t $Glig B I E N V E N I D O\n $W \t\t\t\t $nomUsuario \n\n" 
			sleep 2
			./interaccion.sh
		else
			lineaxD
			printf "\n\n\t\t $M C O N T R A S E Ñ A   I N C O R R E C T A\n $W \n\n" 
		fi

	else
		lineaxD
		printf "\n\n\t\t $B   U S U A R I O   N O   E X I S T E\n $W \n\n" 
	fi
}

main(){
	imprimirTitulo
	solicitarDatos
	obtenerContrasenaReal
	validacionDatos
}

main

