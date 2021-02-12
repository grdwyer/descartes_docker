FROM ros:noetic-robot

RUN apt update && apt install -y \
    python3-catkin-tools \
    python3-rosdep \
    python3-rosinstall-generator \
    python3-vcstool \
    python3-pip \
    build-essential \
    ros-noetic-moveit-simple-controller-manager \
    ros-noetic-rqt \
    ros-noetic-rqt-joint-trajectory-controller \
    ros-noetic-rqt-console \
    ros-noetic-rqt-logger-level \
    ros-noetic-ros-control \
    ros-noetic-ros-controllers \
    ros-noetic-robot-state-publisher \
    ros-noetic-moveit \
    ros-noetic-moveit-ros-visualization \
    ros-noetic-rviz \
    ros-noetic-rviz-visual-tools \
    ros-noetic-eigen-conversions \
    libblas-dev \
    liblapack-dev \
    git \
    ssh \
    usbutils \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /catkin_ws/src

WORKDIR /catkin_ws/src
RUN git clone https://github.com/ros-industrial-consortium/descartes.git && \
    git clone https://github.com/ros-industrial-consortium/descartes_tutorials.git && \
    git clone https://github.com/ros-industrial/abb.git && \
    git clone -b noetic-compat https://github.com/simonschmeisser/industrial_core.git

WORKDIR /catkin_ws/

RUN ["/bin/bash", "-c", "source /opt/ros/noetic/setup.bash && \
    catkin_make"]
