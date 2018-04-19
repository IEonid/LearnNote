gnome-terminal --window -e 'bash -c " \
roscore; exec bash"'\

sleep 4
gnome-terminal --tab -e 'bash -c " \
rosrun dobot DobotServer ttyUSB0; exec bash"'\

sleep 2
gnome-terminal --tab -e 'bash -c " \
rosrun dobot DobotClient_PTP; exec bash"'\

exit
