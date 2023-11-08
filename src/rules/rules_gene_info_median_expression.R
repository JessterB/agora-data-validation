rules_gene_info_median_expression <- validator(
  
  # median
  is.numeric(median),
  !is.na(median),
  
  # tissue
  is.character(tissue),
  tissue %in% c("CBE", "DLPFC", "FP", "IFG", "PHG", "STG", "TCX", "ACC", "PCC"),
  !is.na(tissue),
  
  # min (unused)
  is.numeric(min),
  !is.na(min),
  
  # first_quartile (unused)
  is.numeric(first_quartile),
  !is.na(first_quartile),
  
  # mean (unused)
  is.numeric(mean),
  !is.na(mean),
  
  # third_quartile (unused)
  is.numeric(third_quartile),
  !is.na(third_quartile),
  
  # max (unused)
  is.numeric(max),
  !is.na(max)
)
