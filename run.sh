#!/bin/bash
# general configuration
stage=$1
stop_stage=$2


if [ ${stage} -le 0 ] && [ ${stop_stage} -ge 0 ]; then
    echo "stage 0: Data preparation"
    echo "Please enter a folder of .wav files on which you want to train Speechsplit"
    read  wav_folder
    python prepare_data.py concatenate $wav_folder
fi
if [ ${stage} -le 1 ] && [ ${stop_stage} -ge 1 ]; then
    echo "stage 1: make spectograms"
    rm -rf assets/wavs/p231/.DS_Store
    python make_spect_f0.py
fi
if [ ${stage} -le 2 ] && [ ${stop_stage} -ge 2 ]; then
    echo "stage 2: make metadata"
    python make_metadata.py 
fi
if [ ${stage} -le 3 ] && [ ${stop_stage} -ge 3 ]; then
    echo "stage 3: start Speechsplit model training"
    python main.py
fi
