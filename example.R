source("make_boxplot.R")

dat <- read_delim("lps_dea_table.csv")

## replace "ENSMUSG00000000001" with your assigned gene
my_gene <- "ENSMUSG00000000001"

p <- make_boxplot(dat = dat,
             gene = my_gene,
             fdr = 3.31E-12)

ggsave("boxplot.png", p, width = 5, height = 4)
