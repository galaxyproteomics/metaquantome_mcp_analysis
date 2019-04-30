library(dplyr)

f <- read.delim('estimated_composition/upstream_tool_outputs/FlashLFQ_QuantifiedBaseSequences.tsv')
clean <- f %>%
	select(peptide=Sequence, starts_with("Intensity"))

library(stringr)
newnames <- str_match(names(clean)[2:9], "Intensity_(.*)_2000ng")[, 2]
names(clean)[2:9] <- newnames

library(limma)
num <- log2(data.matrix(clean[, 2:9]))
norm <- 2^limma::normalizeBetweenArrays(num, method="quantile")
clean_norm <- data.frame('peptide' = clean$peptide,
                         norm)

write.table(clean_norm, file="estimated_composition/mqome_inputs/flash.tab", quote=FALSE, row.names=FALSE,
			sep="\t")
