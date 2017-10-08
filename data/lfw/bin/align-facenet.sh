#!/bin/sh

source ~/m3/face/facenet/env/bin/activate
export PYTHONPATH=$PYTHONPATH:~/m3/face/facenet/src/

for N in {1..4}
do 
  python ~/m3/face/facenet/src/align/align_dataset_mtcnn.py \
	~/m3/data/lfw/raw \
	~/m3/data/lfw/lfw_mtcnnpy_160 \
	--image_size 160 \
	--margin 32 \
	--random_order \
	--gpu_memory_fraction 0.25 
done
