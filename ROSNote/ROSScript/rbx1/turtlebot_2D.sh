gnome-terminal --window -e 'bash -c " \
roscore; exec bash"'\

sleep 4
gnome-terminal --tab -e 'bash -c " \
roslaunch rbx1_bringup fake_turtlebot.launch; exec bash"'\

sleep 2
gnome-terminal --tab -e 'bash -c " \
rosrun rviz rviz -d `rospack find rbx1_nav`/sim.rviz; exec bash"'\

sleep 2
gnome-terminal --tab -e ```bash -c " \
rostopic pub -r 10 /cmd_vel geometry_msgs/Twist '{linear: {x: 0.2, y: 0, z: 0}, angular: {x: 0, y: 0, z: 0.5}}'; exec bash"```

exit
