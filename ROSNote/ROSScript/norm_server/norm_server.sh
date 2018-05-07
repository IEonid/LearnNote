gnome-terminal --window -e 'bash -c " \
roscore; exec bash"'\

sleep 4
gnome-terminal --tab -e 'bash -c " \
rosrun norm_server norm_server; exec bash"'\

sleep 2
gnome-terminal --tab -e 'bash -c " \
rosrun norm_server ponit_pub 1 2 3; exec bash"'\

exit
