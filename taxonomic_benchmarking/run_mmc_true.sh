#!/bin/bash

source ~/miniconda3/bin/activate mqome

# run from script directory

inp=true_composition/mqome_inputs
owt=true_composition/mqome_outputs
ddir=../cached_databases

# taxonomy
metaquantome expand \
	--nopep \
	--nopep_file $inp/true.tab \
    --mode t \
    --data_dir $ddir \
    --samps $inp/true_samples.tab \
    --tax_colname taxid \
    --outfile $owt/true_out.tab
