#!/bin/bash
#A script to configurate the Linux

#(更新系统软件列表和软件)
sudo apt-get update
sudo apt-get update --fix-missing
sudo apt-get upgrade
echo -e -n "\033[36mUpdated and upgraded OS... \033[0m "

#(安装Git)
echo -e -n "\033[36mAre you sure to install Git[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [-z $user_choice] || [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get install git
	echo -e -n "\033[36mInstalled Git... \033[0m "
	git config --global user.name "cglin"
	echo -e -n "\033[36mConfiged Git's user.name as cglin... \033[0m "
	git config --global user.email "cglin95@gmail.com"
	echo -e -n "\033[36mConfiged Git's user.email as cglin95@gmail.com... \033[0m "
fi

#(安装vim)
echo -e -n "\033[36mAre you sure to install Vim[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [-z $user_choice] || [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get install vim
	echo -e -n "\033[36mInstalled Vim...... \033[0m "
fi

#(安装Pycharm)
echo -e -n "\033[36mAre you sure to install pycharm[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [-z $user_choice] || [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
	sudo apt-get update
	sudo apt-get install ubuntu-make
	umake ide pycharm
	echo -e -n "\033[36mInstalled pycharm... \033[0m "
fi

#(安装Jupyter)
echo -e -n "\033[36mAre you sure to install jupyter[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [-z $user_choice] || [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get update
	sudo apt install python-pip
	sudo pip install --upgrade pip
	sudo apt install python-numpy
	sudo apt install python-scipy
	sudo apt install python-matplotlib
	sudo pip install -U pip
	sudo pip install jupyter
	jupyter notebook
	echo -e -n "\033[36mInstalled jupyter... \033[0m "
fi	
	
#(安装截图软件shutter)
echo -e -n "\033[36mAre you sure to install shutter[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [-z $user_choice] || [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo add-apt-repository ppa:shutter/ppa
	sudo apt-get update
	sudo apt-get install shutter
	#之后在系统设置中设置快捷键命令（shutter -s）
	echo -e -n "\033[36mInstalled shutter, please set your shortcut later[shutter -s]. \033[0m "
fi	
