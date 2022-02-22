rules_gene_info_median_expression <- validator(
  
  # medianlogcpm
  is.numeric(medianlogcpm),
  
  !is.na(medianlogcpm),
  
  # tissue
  is.character(tissue),
  tissue %in% c("CBE", "DLPFC", "FP", "IFG", "PHG", "STG", "TCX"),
  !is.na(tissue),
  
  # multi-field uniques
  is_unique(ensembl_gene_id, tissue)
)
