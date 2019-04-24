
~/miniconda3/bin/conda create -n mqome metaquantome=1.0.0

source ~/miniconda3/bin/activate mqome

# databases
ddir=cached_databases
metaquantome db ncbi go ec --dir $ddir

# functional benchmarking

cd functional_benchmarking

./run_all_functional.sh

cd ..

# taxonomic benchmarking

cd taxonomic_benchmarking

./run_all_taxonomic.sh

cd ..

# oral microbiome case study

cd oral_microbiome_case_study

./analyze_rudney_flash_unipept.sh && ./visualize_rudney_flash_unipept.sh

cd ..


