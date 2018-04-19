#!/bin/bash
#A script to configurate the ROS

#Adapt to ubuntu16.04

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#设置秘钥
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116

sudo apt-get update
sudo apt-get update --fix-missing
sudo apt-get upgrade

#安装Kinetic
sudo apt-get install ros-kinetic-desktop-full
#查看可以使用的包
apt-cache search ros-kinetic

#rosinstall 是ROS中一个独立分开的常用命令行工具，它可以方便让你通过一条命令就可以给某个ROS软件包下载很多源码树
sudo apt-get install python-rosinstall
sudo apt install python-rosdep
#初始化rosdep
sudo rosdep init
rosdep update
#初始化环境变量
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc

#(安装 RoboWareStudio)
echo -e -n "\033[01;36mMake sure that there is a *.deb file. \033[0m \n"
echo -e -n "\033[01;36mAre you sure to install RoboWareStudio[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo dpkg -i roboware-studio_1.1.0-1514335284_amd64.deb
fi



