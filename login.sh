#!/bin/bash            
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo "Los 5 temas mas hablados a nivel mundial: "
echo "No. | Hashtag"
cat hashtags.txt | grep "#" | cut -d "#" -f 2 | sort | uniq -c | sort | tail -n 5
echo ""

select opcion in "Publica" "Mi Muro" "Mi Informacion" "Modificar Mi Informacion" "Contactos" "Agregar Contacto" "Eliminar Contacto" "Muro de un Contacto" "Recientes" "Trendig Topics" Salir
do
case $opcion in




"Publica")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo "Para escribir un HASHTAG sigue el siguiente formato: "
echo "---Comentario---#hashtag#---Comentario--"

echo ""
publi=""

until [ "$publi" != "" ]

	do
	read -p "Publica: " publi
	done

	fecha=`date`

	echo "\n$1 dice: [|]$publi\n [|]$fecha" >> hashtags.txt
	echo "\n$1 dice: [|]$publi\n [|]$fecha" >> usuarios/$1/publicaciones$1.txt
	echo ""
	echo "::::	Presiona ENTER para CONTINUAR..."
	echo ""
;;

"Recientes")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Estas son las publicaciones recientes de tus contactos…"

sh usuarios/$1/actualizarpubli.sh

echo ""
echo "::::	Presiona ENTER para CONTINUAR…"
;;

"Trendig Topics")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	TOP 5 Trending Topics..."
echo ""
echo "No. de coincidencias| Hashtag"
echo""


cat hashtags.txt | grep "#" | cut -d "#" -f 2 | sort | uniq -c | sort | tail -n 5
echo ""
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"
;;

"Mi Muro")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Mis Publicaciones..."

	more usuarios/$1/publicaciones$1.txt

echo ""
echo ""
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"
;;

"Muro de un Contacto")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Ver Muro de un Contacto…"
echo ""
validaver=""
ver=""
buscar=""
encontrados=""
echo "Estos son tus contactos: "
cat usuarios/$1/contactos$1.txt
echo ""
until [ "$buscar" != "" ]
do
	read -p "Buscar contacto en mi lista: " buscar
done
	encontrados=`cat usuarios/$1/contactos$1.txt | grep -i $buscar`
	
	echo "Se encontraron los siguientes resultados: $encontrados"
if [ "$encontrados" != "" ]
then

	until [ "$ver" != "" ]
	do
		read -p "Ver publicaciones de: " ver
	done
		validaver=`cat usuarios/$1/contactos$1.txt | grep -i -w $ver`
		echo ""
		echo ""
		echo "::::	Presiona ENTER para CONTINUAR…"
	
		if [ "$validaver" ]
		then
			cat usuarios/$ver/publicaciones$ver.txt
		else
			echo ""
			echo "::::	Este usuario no esta en tu lista de contactos verifica tu ortografia o agregalo…"
		fi
else
echo ""
echo "::::	No se encontró ningún contacto con este nombre en tu lista de contactos..."
fi
;;








"Agregar Contacto")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Agregar Contacto…"
echo ""
echo ""
echo "Miembros de SUPERFORO KILLER: "
ls usuarios
echo ""
validagregar=""
buscar=""
agregar=""
encontrados=""
existe=""



until [ "$buscar" != "" ]
do
	read -p "Buscar contacto: " buscar
done
	encontrados=`cat base.txt | cut -d ":" -f 1 | grep -i $buscar`
	
	echo "Se encontraron los siguientes resultados: $encontrados"
if [ "$encontrados" != "" ]
then

	until [ "$agregar" != "" ]
	do
		read -p "Agregar: " agregar
	done
		existe=`cat base.txt | grep -w -i $agregar`

		validagregar=`cat usuarios/$1/contactos$1.txt | grep -w -i $agregar | cut -d ":" -f 1`

		if [ "$existe" ]
		then

			if [ "$validagregar" ]
			
			then
			echo ""
			echo "::::	El usuario ya esta en tu lista de contactos..."

			else
			echo $agregar >> usuarios/$1/contactos$1.txt

				post=`cat usuarios/$agregar/publicaciones$agregar.txt`

				echo $post >> usuarios/$1/publicacionescontactos$1.txt
				echo "cat usuarios/$agregar/publicaciones$agregar.txt" >> usuarios/$1/actualizarpubli.sh

				echo " $agregar Agregado exitosamente a tu lista de contactos."
			fi
		else 
		echo ""
		echo ":::: El nombre que ingresaste no existe…"
		fi
else
echo ""
echo "::::	No se encontró ningún usuario con este nombre..."
fi
;;




"Contactos")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Esta es tu lista de contactos..."

more usuarios/$1/contactos$1.txt

echo ""
echo ""
echo ":::: Presiona ENTER para CONTINUAR…"

;;

"Eliminar Contacto")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Elminar Contacto…"
echo ""
echo ""


buscar=""
eliminar=""
validaeliminar=""


until [ "$buscar" != "" ]
do
read -p "Buscar contacto a eliminar: " buscar
done
	encontrados=`cat usuarios/$1/contactos$1.txt | grep -i $buscar`
	echo "Se encontraron los siguientes resultados: $encontrados"
	echo ""
until [ "$eliminar" != "" ]
do
	read -p "Eliminar contacto: " eliminar
done
	validaeliminar=`cat usuarios/$1/contactos$1.txt | grep -w -i $eliminar`

if [ "$validaeliminar" = "$eliminar" ]
then

		for i in `cat usuarios/$1/contactos$1.txt`
		do
			if [ "$eliminar" = "$i" ]
			then
			echo ""
			echo ":::: Contacto eliminado…"
			else
			touch tmp.txt			
			echo $i >> tmp.txt
			fi
		done		
		mv tmp.txt usuarios/$1/contactos$1.txt

		elim="cat usuarios/$eliminar/publicaciones$eliminar.txt"
		while read line
			do
				if [ "$elim" = "$line" ]
				then
					echo ""
					echo "::::	Presiona ENTER para CONTINUAR..."
				else
				touch tmp1.txt
				echo $line >> tmp1.txt
				fi			
			done < usuarios/$1/actualizarpubli.sh
			mv tmp1.txt usuarios/$1/actualizarpubli.sh
			


else
	echo ""
	echo "::::	Contacto no encontrado en tu lista de contactos..."
fi



;;






"Mi Informacion")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Mi Información..."
echo ""
info2=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 1`
info3=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 2`
info4=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 3`
info5=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 4`
info6=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 5`
info7=`cat usuarios/$1/perfil$1.txt | cut -d ":" -f 6`

echo "Usuario: $1"
echo ":::::::::::::::"
echo "Correo ElectrOnico: $info2"
echo ":::::::::::::::"
echo "Nombre: $info3 $info4"
echo ":::::::::::::::"
echo "Edad: $info5"
echo ":::::::::::::::"
echo "Solter@: $info6"
echo ":::::::::::::::"
echo "Genero: $info7"
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"
;;





"Modificar Mi Informacion")
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Modificar Mi Informacion..."

sh modificar.sh $1
;;

Salir)
echo "::::  Cerrando Sesion..."
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"

exit;;

*)
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::	                                    ::"
echo ":::	   twitter Killer 		              ::"
echo ":::					                            ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo ":::::::"
echo ":::::::	Perfil de $1	:::::::::"
echo ":::::::"
echo ""
echo ""
echo "::::	Por favor escribe solo LOS NUMEROS del menu seguidos de ENTER..."
echo ""
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"
;;

esac
done
