#!/bin/bash
#A script to creat the catkin_ws

#Adapt to ubuntu16.04

#初始化catkin_ws
echo -e -n "\033[01;36mAre you sure to init catkin_ws[Y/N]? \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	mkdir -p ~/catkin_ws/src
	cd ~/catkin_ws/src
	catkin_init_workspace
	cd ~/catkin_ws
	catkin_make
	source devel/setup.bash
	echo -e -n "\033[01;36mInited catkin_ws... \033[0m "
	#请手动在./bashrc中添加‘source ~/catkin_ws/devel/setup.bash’
	echo -e -n "\033[01;36mPlease add 'source ~/catkin_ws/devel/setup.bash' in ~/.bashrc... \033[0m "
	echo -e "\n"
fi

#复制rbx1代码资源
echo -e -n "\033[01;36mAre you sure to install rbx1 in catkin_ws[Y/N]? \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	cd ~/catkin_ws/src
	git clone https://github.com/pirobot/rbx1.git 
	cd ..
	catkin_make
	rospack profile
	echo -e -n "\033[01;36mInstalled rbx1 in catkin_ws... \033[0m "
	echo -e "\n"
fi

#安装ArbotiX模拟器
echo -e -n "\033[01;36mAre you sure to install ArbotiX in catkin_ws[Y/N]? \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	cd ~/catkin_ws/src
	git clone https://github.com/vanadiumlabs/arbotix_ros.git
	cd .. && catkin_make
	echo -e -n "\033[01;36mInstalled ArbotiX in catkin_ws... \033[0m "
	echo -e "\n"
fi



