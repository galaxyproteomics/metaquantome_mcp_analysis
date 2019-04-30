#!/bin/bash

# run from taxonomic_benchmarking

owt=estimated_composition/mqome_outputs
inp=estimated_composition/mqome_inputs
ddir=../cached_databases

# taxonomy
metaquantome expand \
    --mode t \
    --samps $inp/mmc_samples.tab \
    --data_dir ../cached_databases \
    --int_file $inp/flash.tab \
    --pep_colname_int peptide \
    --tax_file $inp/tax.tab \
    --tax_colname lca \
    --pep_colname_tax peptide \
    --outfile $owt/tax_out.tab

