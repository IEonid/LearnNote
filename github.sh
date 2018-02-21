#!/bin/bash
#A script to update the repository

git status
until read -p "-- Are you sure to add all file [Y/D/N]? " choice
	case $choice in
	Y | y)
		git add *;;
	D | d)
		git diff HEAD -- *
		exit 1;;
	N | n)
		exit 0;;
	*)
		echo "Error input"
		exit 1;;
	esac
do
	exit 0
done

echo
git status
read  -p "-- Are you sure to commit all file [Y/N]? -- " choice
case $choice in
Y | y)
	echo
	read -p "Enter the commit: " commit
	git commit -m "$commit";;
N | n)
	exit 0;;
*)
	echo "Error input";;
esac

echo
git status
read -p "-- Are you sure to push the commition [Y/N]? -- " choice
case $choice in
Y | y)
        git push origin master;;
N | n)
        exit 0;;
*)
        echo "Error input";;
esac

echo
git status
