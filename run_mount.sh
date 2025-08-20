#!/bin/bash
# build-and-run.sh

IMAGE_NAME=my_cuda_image
CONTAINER_NAME=my_cuda_container

# Resolve project dir (where Dockerfile and ext_files are located)
PROJECT_DIR=$(dirname "$(readlink -f "$0")")

docker build -t $IMAGE_NAME
docker run --gpus all -it --rm \
  --name $CONTAINER_NAME \
  -v "$PROJECT_DIR/ext_files:/app/ext_files" \
  $IMAGE_NAME bash
