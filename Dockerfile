#From ubuntu:18.04
From nvidia/opengl:1.0-glvnd-runtime-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apt-utils sudo python python-pip software-properties-common

# install CARLA-simulator, ROS-melodic-desktop, carla-ros-bridge-melodic

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 92635A407F7A020C && \
    add-apt-repository "deb [arch=amd64 trusted=yes] http://dist.carla.org/carla-0.9.9/ all main" && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 81061A1A042F527D && \
    add-apt-repository "deb [arch=amd64 trusted=yes] http://dist.carla.org/carla-ros-bridge-melodic/ bionic main" && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN apt-get update && apt-get install -y carla-simulator ros-melodic-desktop carla-ros-bridge-melodic 
# python-rosdep2

ENV USER carla
ENV HOME /home/${USER}
ENV SHELL /bin/bash

RUN useradd -m ${USER} && gpasswd -a ${USER} sudo && echo "${USER}:carla" | chpasswd

USER ${USER}
WORKDIR ${HOME}
SHELL ["/bin/bash", "-c"]

RUN pip install --user pygame numpy

ENV PYTHONPATH "$PYTHONPATH:/opt/carla-simulator/PythonAPI/carla/dist/carla-0.9.9-py2.7-linux-x86_64.egg"

RUN source /opt/ros/melodic/setup.bash && \
    source /opt/carla-ros-bridge/melodic/setup.bash

# rosdep upate && rosdep install --from-paths src --ignore-src -y -r; \
# catkin_make
