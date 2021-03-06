#!/bin/bash

# Run this script from the top level of bellson 
# This script trains a network from scratch on some dataset. 

export NOW=$(date +%F_%H.%M)
export LOGD="/mnt/bigboi/training_runs/$NOW"
mkdir -p $LOGD

echo "Running training in directory $LOGD"
rm -f "/mnt/bigboi/training_runs/current"
ln -s $LOGD "/mnt/bigboi/training_runs/current"

export TF_FORCE_GPU_ALLOW_GROWTH=true

# Start tensorboard at $LOGD
tensorboard --logdir $LOGD --bind_all & 

# Run training
python3 -m bellson.apps.tf.train \
    --ellington-lib=/mnt/bigboi/library.json \
    --job-dir=$LOGD \
    --cache-dir=/mnt/bigboi/training_cache/