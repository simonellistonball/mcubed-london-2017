#!/bin/sh

docker run -e GRANT_SUDO=yes --user root -v /Users:/Users -v /Users/sball/m3/notebooks/work:/home/jovyan/work/ --name jupyter -it -p 8888:8888 m3jupyter
