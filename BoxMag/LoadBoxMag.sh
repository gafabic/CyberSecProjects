#! /usr/bin/bash

echo "Enter username"
read user
loadline+="${user}	"

#If user not in UserList.txt, add to it
if grep -Fxq "$user" UserList.txt
then
	echo "User \"$user\" already in userlist"
else
	echo $user >> UserList.txt
fi


echo -e "\nEnter password"
read pass
loadline+="${pass}	"

#If user or pass not in SprayAndPray.txt, add to it
if grep -Fxq "$user" SprayAndPray.txt
then
	echo "User \"$user\" already in SprayAndPray, not adding"
else
	echo $user >> SprayAndPray.txt
fi
if grep -Fxq "$pass" SprayAndPray.txt
then
	echo "Password \"$pass\" already in SprayAndPray, not adding"
else
	echo $pass >> SprayAndPray.txt
fi

echo -e "\nEnter service"
read serv
loadline+="${serv}	"

echo -e "\nEnter location or host"
read loc
loadline+="${loc}	"

echo -e "\nEnter additional notes"
read notes
loadline+="${notes}"


echo $loadline >> KnownCredentials.csv
echo "Added to known credentials"