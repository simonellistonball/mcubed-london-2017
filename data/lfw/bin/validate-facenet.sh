#!/bin/sh 

source ~/m3/face/facenet/env/bin/activate
export PYTHONPATH=$PYTHONPATH:~/m3/face/facenet/src/

python ~/m3/face/facenet/src/validate_on_lfw.py \
  ~/m3/data/lfw/lfw_mtcnnpy_160 \
  ~/m3/models/facenet/20170511-185253 \
  --lfw_pairs=/Users/sball/m3/face/facenet/data/pairs.txt 
