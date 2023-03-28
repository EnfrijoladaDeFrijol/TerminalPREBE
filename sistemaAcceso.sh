#!/bin/bash

# ==-==-==-==-> Solamente son colores
R='\033[1;31m' # Rojo
G='\033[1;32m' # Verde
Y='\033[1;33m' # Amarillo
B='\033[1;34m' # Azul
M='\033[1;35m' # Mangenta
W='\033[0m' # Blanco
Glig='\e[1;32m' # Verde claro


# Sistema de acceso para los usuarios
# ==-==-==-==-==-==-==-==-==-==-==-==-
clear

printf "\t  _____              _           _   ___ ___ ___ ___ ___ \n"
printf "\t |_   _|__ _ _ _ __ (_)_ _  __ _| | | _ \ _ \ __| _ ) __|\n"
printf "\t   | |/ -_) '_| '  \| | ' \/ _' | | |  _/   / _|| _ \ _| \n"
printf "\t   |_|\___|_| |_|_|_|_|_||_\__,_|_| |_| |_|_\___|___/___|\n"
printf "\n\t\t\tI n i c i o   d e   s e i ó n\n"

# ==-==-==-==-> Guardado de password en archivo
#touch archivoPass.txt # Crea un archivo temporal
#sudo cat /etc/passwd >> archivoPass.txt
#cat archivoPass.txt

# ==-==-==-==-> Solicitud de datos (interacion con el usuario)
printf "$G\n\t\t\t\tUsuario: $W"
read usuario
#echo $usuario
printf "$G\n\t\t\t     Contraseña: $W"
read contrasena
#echo $contrasena

# ==-==-==-==-> Validación de datos
if [ $usuario == $USER ]
then
	printf "Usuario correcto\n\n"
else
	printf "Usuario incorrecto\n\n"
fi