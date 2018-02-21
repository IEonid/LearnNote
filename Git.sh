#!/bin/bash
#A script to update the repository

git status
options=[Add/Commit/Diff/Exit/Log/Push/User/Status]
while echo -e -n "\n\nPlease choose the first letter of options.\n$options? "
	read -n1 choice
do
	echo -e "\n"
	case $choice in
	A | a)
		git add -A
		git status;;
	C | c)
		echo -e -n "Enter the remark: "
		read commit
		commitDate="[20"$(date +%y-%m-%d])
		commit=$commitDate$commit
		echo $commit
		git commit -m "$commit";;
	D | d)
		git diff HEAD -- *;;
	E | e)
		exit 0;;
	L | l)
		git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit;;
	P | p)
	        git push origin master;;
	U | u)
		echo -e -n ">>"
		read myCmd
		$myCmd;;
	S | s)
		git status;;
	*)
		echo
		echo "Error input"
		echo;;
	esac
done


