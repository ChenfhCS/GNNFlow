#!/bin/bash
MODEL=$1
RETRAIN=$2
DATA=$3
RATIO=$4

# TGAT
if [ $MODEL == "tgat" ] || [ $MODEL == "TGAT" ];then
    cmd="python online.py --model TGAT --dropout 0.1 --attn-dropout 0.1 \
                    --sample-layer 2 --sample-neighbor 10 10 \
                    --data $DATA --sample-strategy uniform --replay_ratio $RATIO"
fi

# TGN
if [ $MODEL == "tgn" ] || [ $MODEL == "TGN" ];then
    cmd="python online.py --model TGN --data $DATA --sample-strategy recent --replay_ratio $RATIO"
fi

if [ -n "$RETRAIN" ]; then
    cmd="$cmd --retrain $RETRAIN"
fi


echo $cmd
exec $cmd
