#!/bin/bash
#PBS -l nodes=1:ppn=8,walltime=16:00:00
#PBS -N bedpostx
#PBS -l vmem=16gb
#PBS -V

diff=`jq -r '.diff' config.json`;
bvec=`jq -r '.bvec' config.json`;
bval=`jq -r '.bval' config.json`;
mask=`jq -r '.mask' config.json`;

mkdir input_folder
cp $mask input_folder/nodif_brain_mask.nii.gz
cp $diff input_folder/data.nii.gz
cp $bval input_folder/bvals
cp $bvec input_folder/bvecs

nf=`jq -r '.nf' config.json`;
fudge=`jq -r '.fudge' config.json`;
bi=`jq -r '.bi' config.json`;

time singularity exec -e docker://brainlife/fsl:6.0.1 bedpostx input_folder --nf=$nf --fudge=$fudge  --bi=$bi






