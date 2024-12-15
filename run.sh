#!/bin/bash
#SBATCH --mem-per-cpu=4G
#SBATCH -N 1
#SBATCH -c 24
#SBATCH -o log/runtest.log-%j-%a
#SBATCH -a 1-16


# set environment variables
export PATH=$SPARSE_PROBING_ROOT:$PATH

export HF_DATASETS_OFFLINE=1
export TRANSFORMERS_OFFLINE=1

export RESULTS_DIR=/home/gridsan/groups/maia_mechint/sparse_probing/results
export FEATURE_DATASET_DIR=/home/gridsan/groups/maia_mechint/sparse_probing/feature_datasets
export TRANSFORMERS_CACHE=/home/gridsan/groups/maia_mechint/models
export HF_DATASETS_CACHE=/home/gridsan/groups/maia_mechint/sparse_probing/hf_home
export HF_HOME=/home/gridsan/groups/maia_mechint/sparse_probing/hf_home

sleep 0.1  # wait for paths to update

# activate environment and load modules
source $SPARSE_PROBING_ROOT/sparprob/bin/activate
source /etc/profile
module load chatglm-6b


FEATUR_DATASET=('cb','copa','wic','wsc','wng')

# Text features sweep across all models
for feature_dataset in "${FEATUR_DATASET[@]}"
do
    python training.py \
        --model "chatglm-6b" \
        --feature_dataset "$feature_dataset" \
        --activation_aggregation max
done


for feature_dataset in "${FEATUR_DATASET[@]}"
do
    python training.py \
        --model "chatglm-6b" \
        --feature_dataset "$feature_dataset" \
done




