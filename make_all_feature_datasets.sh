#!/bin/bash

python make_feature_datasets.py \
    --feature_collection cb

python make_feature_datasets.py \
    --feature_collection copa \
    --ignore_first_k 1 \
    --lang_id_n_tokens 2

python make_feature_datasets.py \
    --feature_collection wic

python make_feature_datasets.py \
    --feature_collection wng \
    --n_seqs 10000 \
    --seq_len 1024

python make_feature_datasets.py \
    --feature_collection wsc \
    --seq_len 256 \
    --n_seqs 10000

python make_feature_datasets.py \
    --feature_collection ewt


