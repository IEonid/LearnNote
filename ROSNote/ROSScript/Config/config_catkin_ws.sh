#!/bin/bash
#A script to creat the catkin_ws（工作空间）

#Adapt to ubuntu16.04

#初始化catkin_ws
echo -e -n "\033[01;36mAre you sure to init catkin_ws[Y/N]? \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	mkdir -p ~/catkin_ws/src
	cd ~/catkin_ws/src
	#生成CMakeLists.txt
	catkin_init_workspace
	cd ~/catkin_ws
	catkin_make
	source devel/setup.bash
	echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
	echo -e -n "\033[01;36mInited catkin_ws... \033[0m "
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

sudo apt-get install ros-kinetic-map-server
sudo apt-get install ros-kinetic-fake-localization
cd ~/catkin_ws && catkin_make
#安装ROS功能包与Gazebo通信
sudo apt-get install ros-kinetic-gazebo-ros-pkgs ros-kinetic-gazebo-ros-control
sudo apt-get install ros-kinetic-teleop-twist-keyboard







