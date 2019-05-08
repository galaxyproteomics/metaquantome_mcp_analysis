# metaQuantome *MCP* Analysis

On this page, we provide further resources for 1) reproducing the analysis from the manuscript associated with this repository and 2) learning how to use metaQuantome.

## Tutorials

We have made two tutorials available:

1. [Command line interface tutorial](cli_tutorial/cli_tutorial.md)
2. [Galaxy tutorial](galaxy_tutorial/galaxy_tutorial.md)

## Analysis scripts

All of the analyses from the manuscript may be reproduced by cloning the [GitHub repository](https://github.com/galaxyproteomics/metaquantome_mcp_analysis).

To reproduce the analyses, you can install metaQuantome v1.0.0 into a conda environment (called `mqome` in this repository) with the following command:

```
conda create -n mqome metaquantome=1.0.0
```

Then each of the analysis scripts can be run (`run_all.sh` in the root directory of the repo).

Additionally, the scripts may be viewed online at each subdirectory of the GitHub repo:

1. [Functional benchmarking](https://github.com/galaxyproteomics/metaquantome_mcp_analysis/tree/master/functional_benchmarking)
2. [Taxonomic benchmarking](https://github.com/galaxyproteomics/metaquantome_mcp_analysis/tree/master/taxonomic_benchmarking)
3. [Oral microbiome case study](https://github.com/galaxyproteomics/metaquantome_mcp_analysis/tree/master/oral_microbiome_case_study)
