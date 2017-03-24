#!/bin/bash
TEMP=vagrant
STOP=f
incorreto(){
		sleep 3 
		echo
		echo "Login Incorrect!"
}
while [ $STOP != "v"  ]; do

COUNT=1
clear
while (($COUNT<=5));do
echo
echo "Debiab GNU/Linux 8 jessie tty1"
echo
echo -n "jessie login: "
read LOGIN
echo -n "Password: "
read -s PASSWD

if [ $LOGIN == $TEMP ]; then
	if [ $PASSWD == $TEMP ]; then
		echo
		echo "Welcome!"
		STOP=v
		COUNT=6
	else
		incorreto #Chamando a function
	fi
else 
	incorreto	#chamando a funtion

fi

let COUNT=$COUNT+1
done
done
