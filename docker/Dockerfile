FROM osrf/ros:kinetic-desktop-full

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
	software-properties-common \
	&& apt-get autoremove -y \
	&& rm -r /var/lib/apt/lists/*

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

# Installing Software for Rendering and Editing

RUN apt-get update && apt-get install -y vim git

RUN apt-get install -y --reinstall libcanberra-gtk-module libsm6 libxext6 libxrender-dev

ENV TERM xterm-256color

WORKDIR /root/

# Upgrade Python Packages, cmake and catkin tools
RUN apt-get install -y python-pip
RUN pip install --upgrade pip
RUN pip install cmake --upgrade
RUN pip install catkin-tools
RUN pip install catkin_pkg
RUN apt-get install -y python-catkin-tools
RUN rosdep update

# Installing pre-requisites for ROS packages
# Setting up ROS catkin_ws
RUN mkdir -p /root/catkin_ws/src

WORKDIR /root/catkin_ws

RUN /bin/bash -c "/ros_entrypoint.sh; catkin config \
	--init --mkdirs --extend /opt/ros/kinetic --merge-devel \
	--cmake-args -DCMAKE_BUILD_TYPE=Release"

RUN apt-get update && apt-get install -y ros-kinetic-xacro

RUN pip install defusedxml pyzmq rospkg pygazebo==3.0.0-2014.1

WORKDIR /root/catkin_ws/src

RUN git clone https://github.com/duckietown/duckietown-sim-server.git

RUN apt-get install -y ros-kinetic-teleop-twist-keyboard

RUN /bin/bash -c "/ros_entrypoint.sh; catkin build"

RUN apt-get update && apt-get -y autoremove && rm -r /var/lib/apt/lists/*

RUN echo "source /root/catkin_ws/devel/setup.bash" >> /root/.bashrc

RUN echo "source /root/catkin_ws/src/duckietown-sim-server/duckietown_gazebo/env_gazebo.sh" >> /root/.bashrc

# Reseting back
WORKDIR /root
SHELL ["/bin/bash", "-c"]
RUN . /root/.bashrc

CMD ["/root/.bashrc"]
