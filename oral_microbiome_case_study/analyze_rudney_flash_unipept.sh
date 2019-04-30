#!/bin/bash

# run from oral_microbiome_case study

# this is only for function, because taxonomy is large
# and updates automatically
ddir=../cached_databases

owt=mqome_outputs
inp=metaquantome_inputs

# taxonomy
metaquantome expand \
    --mode t \
    --samps $inp/rudney_samples.tab \
    --data_dir $ddir \
    --int_file $inp/flash_norm.tab \
    --pep_colname_int peptide \
    --pep_colname_tax peptide \
    --outfile $owt/tax_descript_out.tab \
    --tax_file $inp/tax.tab \
    --tax_colname lca

metaquantome filter \
    --expand_file $owt/tax_descript_out.tab \
    --mode t \
    --samps $inp/rudney_samples.tab \
    --min_peptides 2 \
    --min_pep_nsamp 5 \
    --min_children_non_leaf 2 \
    --min_child_nsamp 5 \
    --qthreshold 5 \
    --outfile $owt/tax_filt_out.tab

metaquantome stat \
    --mode t \
    --samps $inp/rudney_samples.tab \
    --file $owt/tax_filt_out.tab \
    --outfile $owt/tax_test_out.tab

# function full descriptive
metaquantome expand \
	--data_dir $ddir \
	--mode f \
	--ontology go \
	--samps $inp/rudney_samples.tab \
	--int_file $inp/flash_norm.tab \
	--pep_colname_int peptide \
	--func_file $inp/func.tab \
	--func_colname go \
	--pep_colname_func peptide \
	--outfile $owt/func_full_descript_out.tab


metaquantome filter \
    --expand_file $owt/func_full_descript_out.tab \
    --mode f \
    --ontology go \
    --samps $inp/rudney_samples.tab \
    --min_peptides 2 \
    --min_pep_nsamp 5 \
    --min_children_non_leaf 2 \
    --min_child_nsamp 5 \
    --qthreshold 5 \
    --outfile $owt/func_full_filt_out.tab

metaquantome stat \
    --mode 'f' \
    --ontology go \
    --samps $inp/rudney_samples.tab \
    --file $owt/func_full_filt_out.tab \
    --outfile $owt/func_full_test_out.tab

# taxonomy-function
# use cached func data dir, default tax dir (can't cache)
metaquantome expand \
	--data_dir $ddir \
	--mode ft \
	--ontology go \
	--samps $inp/rudney_samples.tab \
	--int_file $inp/flash_norm.tab \
	--pep_colname_int peptide \
	--func_file $inp/func.tab \
	--func_colname go \
	--pep_colname_func peptide \
	--slim_down \
	--tax_file $inp/tax.tab \
	--tax_colname lca \
	--ft_tar_rank genus \
	--pep_colname_tax peptide \
	--outfile $owt/tf_descript_out.tab

metaquantome filter \
    --expand_file $owt/tf_descript_out.tab \
    --mode ft \
    --samps $inp/rudney_samples.tab \
    --min_peptides 1 \
    --min_pep_nsamp 1 \
    --qthreshold 3 \
    --outfile $owt/tf_filt_out.tab

# visualize
./visualize_rudney_flash_unipept.sh

Rscript -e "library(knitr); knit('supporting2_all_visualizations.Rmd')"
Rscript -e "library(rmarkdown); render('supporting2_all_visualizations.md')"

# summaries
Rscript summaries/proportions.R
Rscript summaries/make_taxonomy_table_supplement.R
Rscript summaries/make_function_table_supplement.R



