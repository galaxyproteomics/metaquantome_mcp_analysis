#!/bin/bash

# run both estimated and true
est_inp=estimated_amounts/mqome_inputs
ddir=../cached_databases

# estimated
echo "Running estimated amounts"
# use stored data
metaquantome expand \
    --mode f \
    --data_dir $ddir \
    --samps $est_inp/samples.tab \
    --int_file $est_inp/flash.tab \
    --pep_colname_int peptide \
    --func_file $est_inp/func.tab \
    --pep_colname_func peptide \
    --func_colname go \
    --ontology go \
    --outfile estimated_amounts/mqome_outputs/ups_out.tab \

# taxonomy
echo "Running true amounts"
metaquantome expand \
    --data_dir $ddir \
	--nopep \
	--nopep_file true_amounts/mqome_inputs/true.tab \
    --mode f \
    --ontology go \
    --samps '{"ups1": ["ups1_amount_fmol"], "ups2": ["ups2_amount_fmol"]}' \
    --outfile true_amounts/mqome_outputs/true_out.tab \
    --func_colname go


# results file

Rscript -e "library(knitr); knit('ups_benchmarking_results.Rmd')"
Rscript -e "library(rmarkdown); render('ups_benchmarking_results.md')"
