#!/bin/bash
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::    twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion…"
echo ""
echo ""
echo "::::	Selecciona la opcion que deseas modificar: "
echo ""
echo ""

info1=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 1`
info2=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 2`
info3=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 3`
info4=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 4`
info5=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 5`
info6=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 6`

echo "Usuario: $1"
echo ":::::::::::::::"
echo "Correo ElectrOnico: $info1"
echo ":::::::::::::::"
echo "Nombre: $info2 $info3"
echo ":::::::::::::::"
echo "Edad: $info4"
echo ":::::::::::::::"
echo "Solter@: $info5"
echo ":::::::::::::::"
echo "Genero: $info6"
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"



select opcion in Nombre Apellido Edad Status Genero Salir
do
case $opcion in

Nombre)
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::    twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion…"
echo ""
echo ""
echo "::::	Selecciona la opcion que deseas modificar: "
echo ""
echo ""
until [ "$info2b" != "" ]
do
read -p "Nuevo Nombre: " info2b
done
echo $info1:$info2b:$info3:$info4:$info5:$info6:$ > usuarios/$1/perfil$1.txt
;;

Apellido)
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::    twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion…"
echo ""
echo ""
echo "::::	Selecciona la opcion que deseas modificar: "
echo ""
echo ""
until [ "$info3b" != "" ]
do
read -p "Nuevo Apellido: " info3b
done
echo $info1:$info2:$info3b:$info4:$info5:$info6 > usuarios/$1/perfil$1.txt
;;

Edad)
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::    twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion…"
echo ""
echo ""
echo "::::	Selecciona la opcion que deseas modificar: "
echo ""
echo ""
until [ "$info4b" != "" ]
do
read -p "Nueva Edad: " info4b
done
echo $info1:$info2:$info3:$info4b:$info5:$info6 > usuarios/$1/perfil$1.txt
;;

Status)
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::    twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion…"
echo ""
echo ""
echo "::::	Selecciona la opcion que deseas modificar: "
echo ""
echo ""
until [ "$info5b" != "" ]
do
read -p "Nuevo Status: " info5b
done
echo $info1:$info2:$info3:$info4:$info5b:$info6 > usuarios/$1/perfil$1.txt

;;
Genero)
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::    twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion…"
echo ""
echo ""
echo "::::	Selecciona la opcion que deseas modificar: "
echo ""
echo ""
until [ "$info6b" != "" ]
do
read -p "Nuevo Genero: " info6b
done
echo $info1:$info2:$info3b:$info4:$info5:$info6b > usuarios/$1/perfil$1.txt

;;
Salir)
echo ":::: Regresando al Menu Principal..."
sleep 1
exit
;;

*)
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::    twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion…"
echo ""
echo ""
echo "::::	Por favor escribe solo LOS NUMEROS del menu seguidos de ENTER..."
echo ""
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"
;;

esac
done

