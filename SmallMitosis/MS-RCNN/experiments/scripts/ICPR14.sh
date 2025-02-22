#!/bin/bash
# Usage:
# ./experiments/scripts/faster_rcnn_end2end_12.sh GPU NET DATASET [options args to {train,test}_net.py]
#
# Example:
# ./experiments/scripts/faster_rcnn_end2end_12.sh 0 VGG_CNN_M_1024_Scale mitos \
#   --set EXP_DIR foobar RNG_SEED 42 

set -x
set -e

export PYTHONUNBUFFERED="True"

GPU_ID=$1
NET=$2
NET_lc=${NET,,}
DATASET=$3

array=( $@ )
len=${#array[@]}
EXTRA_ARGS=${array[@]:3:$len}
EXTRA_ARGS_SLUG=${EXTRA_ARGS// /_}

case $DATASET in
  ICPR12)
    TRAIN_IMDB="ICPR_2012_train"
    TEST_IMDB="ICPR_2012_test"
    PT_DIR="ICPR12"
    ITERS=150000
    ;;
  ICPR14)
    TRAIN_IMDB="ICPR_2014_train"
    TEST_IMDB="ICPR_2014_test"
    PT_DIR="ICPR14"
    ITERS=150000
    ;;
	AMIDA13)
    TRAIN_IMDB="AMIDA_2013_train"
    TEST_IMDB="AMIDA_2013_test"
    PT_DIR="AMIDA13"
    ITERS=150000
    ;;
  *)
    echo "No dataset given"
    exit
    ;;
esac

LOG="experiments/logs/faster_rcnn_end2end_${NET}_${EXTRA_ARGS_SLUG}.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time ./tools/train_net.py --gpu ${GPU_ID} \
  --solver models/${PT_DIR}/${NET}/ICPR2014/solver.prototxt \
  --weights data/imagenet_models/${NET}.v2.caffemodel \
  --imdb ${TRAIN_IMDB} \
  --iters ${ITERS} \
  --cfg experiments/cfgs/ICPR_2014.yml \
  ${EXTRA_ARGS}

set +x
NET_FINAL=`grep -B 1 "done solving" ${LOG} | grep "Wrote snapshot" | awk '{print $4}'`
set -x

