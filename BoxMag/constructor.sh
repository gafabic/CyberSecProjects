#! /usr/bin/bash


#set to location where this script is located
IFS='/' read -ra ADDR <<< ${BASH_SOURCE}

unset ADDR[-1]
unset ADDR[0]
for dir in "${ADDR[@]}";
do
	constructorpath+="/$dir"
done


buildpath=$(pwd)
echo "Constructing BoxMag in $buildpath..."

#Creates SprayAndPray.txt, the file which will hold spraying list being developed for given pentest
echo "Building spray list..."
touch $buildpath/SprayAndPray.txt

#Creates Userlist.txt, the file which will be a list of known users
echo "Building user list..."
touch $buildpath/UserList.txt

#Creates KnownCredentials.csv, a file which will hold user/password pairs in addition to notes on where they were found/where they work
echo "Creating csv for known credentials..."
touch $buildpath/KnownCredentials.csv

#Create BoxMag script in target directory with correct BoxPath variable
sed "s|BoxPath=\$(pwd)|BoxPath=${buildpath}|" $constructorpath/BoxMag.sh > $buildpath/BoxMag.sh
chmod +744 $buildpath/BoxMag.sh

#copy auxiliary scripts
cp $constructorpath/LoadBoxMag.sh $buildpath/LoadBoxMag.sh

echo "BoxMag constructed!"