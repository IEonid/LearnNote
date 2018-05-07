gnome-terminal --window -e 'bash -c " \
roscore; exec bash"'\

sleep 4
gnome-terminal --tab -e 'bash -c " \
rosrun dyna_paras_prj dyna_paras_node; exec bash"'\

sleep 2
gnome-terminal --tab -e 'bash -c " \
rosrun rqt_reconfigure rqt_reconfigure; exec bash"'\

exit
