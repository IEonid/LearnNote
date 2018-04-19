gnome-terminal --window -e 'bash -c " \
roscore; exec bash"'\

sleep 4
gnome-terminal --tab -e 'bash -c " \
rosrun talker_listener talker; exec bash"'\

sleep 2
gnome-terminal --tab -e 'bash -c " \
rosrun talker_listener listener; exec bash"'\

exit
