gnome-terminal --window -e 'bash -c " \
roscore; exec bash"'\

sleep 4
gnome-terminal --tab -e 'bash -c " \
roslaunch rbx1_bringup fake_pi_robot.launch ; exec bash"'\

sleep 2
gnome-terminal --tab -e 'bash -c " \
rosrun rviz rviz -d `rospack find rbx1_nav`/sim.rviz; exec bash"'\

exit
