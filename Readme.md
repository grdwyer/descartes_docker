# Descartes_docker

## Docker
### Build
```
git clone https://github.com/grdwyer/descartes_docker.git
cd descartes_docker
docker build -t descartes:latest .
```

### Run
```
docker run -it \
    --user=$(id -u $USER):$(id -g $USER) \
    --group-add sudo \
    --env="DISPLAY" \
    --workdir="/catkin_ws/src" \
    --volume="/home/$USER:/home/$USER" \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    descartes:latest
```

## Setting up your workspace
Moving your packages to the container
  1. Run the container following the run commands above
  1. In the host machine, find the name of the container with (shown in last column):  
  `docker ps`
  1. In the host machine, copy your current workspace from the host machine  
  `docker cp <path to catkin_ws>/src <container_name>:/catkin_ws/src`
  1. In the container, take over ownership of the container  
  `sudo chown -R $USER /catkin_ws`
  1. In the container, build the workspace  
  ```
  cd /catkin_ws
  catkin_make
  ```

## Running Something
Tutorial1 in the descartes tutorial works
```
source /catkin_ws/devel/setup.bash
roslaunch descartes_tutorials setup.launch
rosrun descartes_tutorials tutorial1
```
if you only have one terminal running use ctrl-z then bg to send the launch command to the background (fg) to bring it back.