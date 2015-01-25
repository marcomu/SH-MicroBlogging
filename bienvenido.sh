#!/bin/bash            
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::	   twitter Killer             ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
echo "Ingresa el NUMERO de la opcion y presiona ENTER"
echo ""

select opcion in  "Crear Usuario" "Log In" Salir
do
case $opcion in







"Crear Usuario")

sh crear.sh

;;

"Log In")          
clear
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ":::                                     ::"
echo ":::          twitter Killer             ::"
echo ":::                                     ::"
echo "::::::::::::::::::::::::::::::::::::::::::"
echo ""
echo ""
        read -p "Usuario: " user
        echo "Contraseña: "
        read -ers password




if [ `grep -w $user:$password base.txt` ]
        then

        sh login.sh $user
        else
	echo ""				
	echo "::::	Usuario y/o contraseña incorrectos…"
        echo ""
        echo ""
        echo "::::	Presiona ENTER para CONTINUAR..."

fi

;;


Salir)
echo ":::: Gracias por usar SUPERFORO KILLER..."
sleep 2
clear
exit
;;

*)
clear
echo "::::	Por favor escribe solo LOS NUMEROS del menu seguidos de ENTER..."
echo ""
echo ""
echo "::::	Presiona ENTER para CONTINUAR…"
;;

esac
done
