# Docker Build Instructions

To build the image refer to the command below
```bash
cd docker
docker build -t duckietownsim .
```

# Hardware Assumptions
If you are using a NVIDIA GPU setup - this Docker Image will not work. This setup relies on Hardware acceleration provided by Intel Integrated Graphics.

# Running Duckietown Simulator
To run the Simulator, run the below command
```bash
bash run.sh
```

Once in the shell, run these commands to start up Gazebo
```bash
roscd duckietown_gazebo
source env_gazebo.sh
cd ..
./run_gazebo.sh
```

# Runing teleop
Run another container of the Docker Image
```bash
bash run.sh
```

Once in the shell you can run teleop like below to move it around.
```bash
rosrun teleop_twist_keyboard teleop_twist_keyboard.py speed:=0.25
```
