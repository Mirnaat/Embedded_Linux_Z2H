#!/bin/bash

if [ ! -f .phonebookDB.txt ]
then
	touch .phonebookDB.txt
fi

if [ $# = 0 ]
then
	echo "Welcome in your phonebook! You can : "
	echo "	Insert new contact name and number, with the option '-i'"
	echo "	View all contacts, with the option '-v'"
	echo "	Search by contact name, with the option '-s'"
	echo "	Delete all records, with 'e'"
	echo "	Delete only one contact name, with '-d'"
else
	case $1 in
	'-i')
		read -p "Insert contact name " name
		read -p "Insert contact number " num
		echo "$name:$num">>.phonebookDB.txt
		echo "Contact name and number are inserted successfully!";;
	'-v')
		cat .phonebookDB.txt;;
	'-s')
		read -p "Enter a contact name " name
		grep $name ./.phonebookDB.txt;;
	'-e')
		sed -i '1,$d' .phonebookDB.txt;;
	'-d')
		read -p "Enter the contact name you want to delete " name
		sed -i "/^$name/d" .phonebookDB.txt;;
	*)
		echo "Enter a valid option";;
	esac

fi
