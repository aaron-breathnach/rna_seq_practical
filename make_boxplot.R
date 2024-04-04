if(!require("tidyverse")) install.packages("tidyverse")

library(tidyverse)

make_boxplot <- function(dat, gene, fdr) {

  dat <- dea %>%
    filter(gene_id == gene) %>%
    select(contains("CPM")) %>%
    pivot_longer(cols = everything()) %>%
    mutate(group = ifelse(grepl("C_", name), "Control", "LPS"))

  ann <- tibble(x = 1.5,
                y = 1.1 * log1p(max(dat$value)),
                label = paste0("p=", scales::scientific(fdr)))
  
  ggplot(dat, aes(x = group, y = log1p(value))) +
    geom_boxplot(outlier.shape = NA) +
    geom_jitter(aes(colour = group, fill = group), pch = 21, alpha = 0.5) +
    labs(title = gene, x = "Group", y = "log(CPM)", colour = "Group", fill = "Group") +
    theme_classic() +
    geom_text(data = ann, aes(x = x, y = y, label = label))

}
