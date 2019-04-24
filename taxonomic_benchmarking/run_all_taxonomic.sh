#!/bin/bash

# estimated
est_owt=estimated_composition/mqome_outputs
est_inp=estimated_composition/mqome_inputs
ddir=../cached_databases

# taxonomy
metaquantome expand \
    --mode t \
    --samps $est_inp/mmc_samples.tab \
    --data_dir $ddir \
    --int_file $est_inp/flash.tab \
    --pep_colname_int peptide \
    --tax_file $est_inp/tax.tab \
    --tax_colname lca \
    --pep_colname_tax peptide \
    --outfile $est_owt/tax_out.tab

# true
tru_owt=true_composition/mqome_outputs
tru_inp=true_composition/mqome_inputs
metaquantome expand \
	--nopep \
	--nopep_file $tru_inp/true.tab \
    --mode t \
    --data_dir $ddir \
    --samps $tru_inp/true_samples.tab \
    --tax_colname taxid \
    --outfile $tru_owt/true_out.tab


# make results file
Rscript -e "library(knitr); knit('mock_microbial_results.Rmd')"
Rscript -e "library(rmarkdown); render('mock_microbial_results.md')"

