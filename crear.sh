#!/bin/bash            
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::	   twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
user=""
validauser=""
password=""
correo=""
nombre=""
apellido=""
edad=""
status=""
genero=""


until [ "$user" != "" ]
	do
		read -p "Ingresa tu usuario: " user
	done
		validauser=`cat base.txt | cut -d ":" -f 1 | grep -w -i $user`

if [ "$validauser" ]

then
	echo ""
	echo "::::	Verificando datos…"
	sleep 2
	echo ""
	echo "::::	Usiario ya existente, prueba otro…"
	echo ""
	echo "::::	Presiona ENTER para CONITNUAR…"

else
	echo ""
	echo ":::: Verificando datos…"
	sleep 2
	echo ""
	echo ":::: Usuario disponible…"
	echo ""
	until [ "$password" != "" ]
	do
        echo "Ingresa tu contraseña:"
    	read -ers password
	done

	until [ "$correo" != "" ]
	do
	read -p "Ingresa tu correo electronico: " correo
	done
		touch tmpcorreo.txt
		echo "$correo" >> tmpcorreo.txt
		validacorreo=`grep "@" tmpcorreo.txt`
		
		until [ "$validacorreo" != "" ]
			do
				echo ""
				echo "::::	Correo electronico invalido…"	
				echo ""
				read -p "Ingresa tu correo electronico: " validados
				echo "$validados" >> tmpcorreo.txt
				validacorreo=`grep "@" tmpcorreo.txt`
                correo="$validados"
                
			done
				rm -r tmpcorreo.txt

	until [ "$nombre" != "" ]
	do
	read -p "Ingresa tu primer nombre: " nombre
	done

	until [ "$apellido" != "" ]
	do
	read -p "Ingresa tu correo primer apellido: " apellido
	done

	until [ "$edad" != "" ]
	do
	read -p "Ingresa tu edad: " edad
	done

	until [ "$status" != "" ]
	do
	read -p "Soltero?: " status
	done

	until [ "$genero" != "" ]
	do
	read -p "Masculino/Femenino: " genero
	done
	
	
	
	echo $user:$password:$correo >> base.txt
	mkdir usuarios/$user
	touch usuarios/$user/publicaciones$user.txt
	touch usuarios/$user/publicacionescontactos$user.txt
	touch usuarios/$user/contactos$user.txt

	echo ":::::" >> usuarios/$user/contactos$user.txt
	touch usuarios/$user/actualizarpubli.sh
	echo "#!/bin/bash" > usuarios/$user/actualizarpubli.sh

	echo $user:$password >> usuarios/$user/cuenta$user.txt
	echo $correo:$nombre:$apellido:$edad:$status:$genero >> usuarios/$user/perfil$user.txt
	
	
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::	   twitter Killer                   ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
	echo ""
	echo ""
	echo "::::	Usuario creado satisfactoriamente."
	echo ""
	echo ""
	echo "::::	Presiona ENTER para CONTINUAR..."

fi
