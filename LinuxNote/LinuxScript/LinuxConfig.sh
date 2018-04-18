#!/bin/bash
#A script to configurate the Linux

#Adapt to ubuntu16.04

#(更新系统软件列表和软件)
echo -e -n "\033[01;36mAre you sure to update and upgarde[Y/N]? \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get update
	sudo apt-get update --fix-missing
	sudo apt-get upgrade
	echo -e -n "\033[01;36mUpdated and upgraded OS... \033[0m "
	echo -e "\n"
fi

#(安装Git)
echo -e -n "\033[01;36mAre you sure to install Git[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get install git
	echo -e -n "\033[01;36mInstalled Git... \033[0m \n"
	read -p "user.name >> " userName
	git config --global user.name "$userName"
	echo -e -n "\033[01;36mConfiged Git's user.name as $userName... \033[0m \n"
	read -p "user.email >> " userEmail
	git config --global user.email "$userEmail"
	echo -e -n "\033[01;36mConfiged Git's user.email as $userEmail... \033[0m \n"
fi

#(安装vim)
echo -e -n "\033[01;36mAre you sure to install Vim[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get install vim
	echo -e -n "\033[01;36mInstalled Vim... \033[0m \n"
fi

#(安装vncviewer)
echo -e -n "\033[01;36mAre you sure to install vncviewer[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get install vncviewer
	echo -e -n "\033[01;36mInstalled vncviewer... \033[0m \n"
fi

#(安装okular阅读器)
echo -e -n "\033[01;36mAre you sure to install okular[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt install okular
	echo -e -n "\033[01;36mInstalled okular... \033[0m \n"
fi

#(安装Pycharm)
echo -e -n "\033[01;36mAre you sure to install pycharm[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
	sudo apt-get update
	sudo apt-get install ubuntu-make
	umake ide pycharm
	echo -e -n "\033[01;36mInstalled pycharm... \033[0m \n"
fi

#(安装Jupyter)
echo -e -n "\033[01;36mAre you sure to install jupyter[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get update
	sudo apt install python-pip
	sudo pip install --upgrade pip
	sudo apt install python-numpy
	sudo apt install python-scipy
	sudo apt install python-matplotlib
	sudo pip install -U pip
	sudo pip install jupyter
	jupyter notebook
	echo -e -n "\033[01;36mInstalled jupyter... \033[0m \n"
fi	

#(安装teamviewer)
echo -e -n "\033[01;36mMake sure that there is a *.deb file. \033[0m \n"
echo -e -n "\033[01;36mAre you sure to install teamviewer[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	read -p "Please input the fileName >> " fileName
	sudo apt-get install libdbus-1-3:i386 libasound2:i386 libexpat1:i386 libfontconfig1:i386 libfreetype6:i386 libjpeg62:i386 libpng12-0:i386 libsm6:i386 libxdamage1:i386 libxext6:i386 libxfixes3:i386 libxinerama1:i386 libxrandr2:i386 libxrender1:i386 libxtst6:i386 zlib1g:i386 libc6:i386 qml-module-qtquick-dialogs qml-module-qtquick-controls qtdeclarative5-controls-plugin
	sudo apt-get update
	sudo apt-get -f install
	sudo dpkg -i $fileName
	echo -e -n "\033[01;36mInstalled teamviewer... \033[0m \n"
fi

#(安装Qt)
echo -e -n "\033[01;36mMake sure that there is a *.run file. \033[0m \n"
echo -e -n "\033[01;36mAre you sure to install Qt[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	read -p "Please input the fileName >> " fileName
	sudo apt-get install g++
	sudo chmod u+x $fileName
	./$fileName
	echo -e -n "\033[01;36mInstalled Qt... \033[0m \n"
fi

#(安装OpenCV-2.4.11)
echo -e -n "\033[01;36mMake sure that there is a ./opencv-2.4.11 directory. \033[0m \n"
echo -e -n "\033[01;36mAre you sure to install OpenCV-2.4.11[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get -qq remove ffmpeg x264 libx264-dev
	sudo apt-get -qq install libopencv-dev build-essential checkinstall cmake pkg-config yasm libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils 
	sudo add-apt-repository ppa:mc3man/trusty-media
	sudo apt-get update
	cd ./opencv-2.4.11
	mkdir build
	cd ./build
	cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_OPENGL=ON ..
	#(如果出现fatal error: stdlib.h: No such file or directory，上一句需加上编译选项：-D ENABLE_PRECOMPILED_HEADERS=OFF)	
	make -j2
	sudo make install
	#为了能够链接到 lib，需要在目录/etc/ld.so.conf.d/ 下创建一个文件 opencv.conf:
	sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
	sudo ldconfig
	echo -e -n "\033[01;36mTesting OpenCV-2.4.11... \033[0m \n"
	cd /usr/local/share/OpenCV/samples/c
	sudo chmod +x build_all.sh 
	sudo ./build_all.sh 
	./facedetect --cascade="/usr/local/share/OpenCV/haarcascades/haarcascade_frontalface_alt.xml" lena.jpg
	echo -e -n "\033[01;36mInstalled OpenCV-2.4.11... \033[0m \n"
	echo -e -n "\033[01;36mRequire reboot the computer... \033[0m \n"
fi


#(与Windows同步时间)
echo -e -n "\033[01;36mAre you sure to synchronise time with Windows[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get install ntpdate
	sudo ntpdate time.windows.com
	sudo hwclock --localtime --systohc
	echo -e -n "\033[01;36mSynchronised time with Windows... \033[0m \n"
fi	


#(安装notepad++)
echo -e -n "\033[01;36mAre you sure to install notepadqq[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo add-apt-repository ppa:notepadqq-team/notepadqq
	sudo apt-get update
	sudo apt-get install notepadqq
	echo -e -n "\033[01;36mInstalled notepadqq... \033[0m \n"
fi


#(安装桌面主题软件unity-tweak-tool)
echo -e -n "\033[01;36mAre you sure to install unity-tweak-tool[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo apt-get install  unity-tweak-tool
	#之后在Dash中查找unity tweak tool设置桌面主题
	echo -e -n "\033[01;36mInstalled unity-tweak-tool... \033[0m \n"
fi	


#(安装截图软件shutter)
echo -e -n "\033[01;36mAre you sure to install shutter[Y/N] \033[0m "
read -n1 -t10 user_choice
echo -e "\n"
if [[ $user_choice == 'y' ]] || [[ $user_choice == 'Y' ]]; then
	sudo add-apt-repository ppa:shutter/ppa
	sudo apt-get update
	sudo apt-get install shutter
	#之后在系统设置中设置快捷键命令（shutter -s）
	echo -e -n "\033[01;36mInstalled shutter, please set your shortcut later[shutter -s]. \033[0m \n"
fi	
