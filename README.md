# dockerfile_carla_ros-bridge
Dockerfile for creating a docker image including Carla Simulator and Carla-ros-bridge-Melodic.

## Build and run image
Create the docker image: carlasim/carla-ros:local. 
```
docker build -t carlasim/carla-ros:local . 
```
Note that the image name `carlasim/carla-ros:local` will be used for run the image using `run.sh`.
To confirm the created docker image
```
$ docker images
REPOSITORY           TAG                             IMAGE ID            CREATED             SIZE
carlasim/carla-ros   local                           eb2c38f0a4cb        57 minutes ago      11.7GB
```

After built the image, you may use `run.sh` to create the container
```
$ ./run.sh
```
The user name is `carla` with same password `carla`. `sudo` is available.

For open another terminal
```
$ docker exec -it <CONTAINER ID> bash
```

## Run Carla simulator
```
$ cd /opt/carla-simulator/bin
$ ./CarlaUE4.sh
```
For other information, please view [Carla/Quick Start](https://carla.readthedocs.io/en/latest/start_quickstart/).

## Run Carla-ros-bridge
```
$ cd /opt/carla-ros-bridge/melodic/share/carla_ros_bridge
$ roslaunch carla-ros-bridge carla-ros-bridge.launch
```
See [Carla/Ros bridge installation](https://carla.readthedocs.io/en/latest/ros_installation/) for more information.

## Some other issues
- Cannot show xwindow
Please confirm if you disabled access control using `xhost +`.

- Cannot show pygame screen
When run `manual_control.py`, the window could be open, but the screen is black. (Same when using ros-bridge)
Please try to reinstall pygame for user.
```
$ pip install pygame
```

- Cannot find `roslaunch` command
Reset the system environment variables.
```
$ source /opt/ros/melodic/setup.bash
$ source /opt/carla-ros-bridge/melodic/setup.bash
```
