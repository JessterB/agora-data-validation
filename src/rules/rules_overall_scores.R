rules_overall_scores <- validator(
  
  # ensg  
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  is_unique(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # hgnc_gene_id
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=0, max=100), 
  
  # geneticsscore
  is.numeric(genetics_score),
  !is.na(genetics_score),
  in_range(genetics_score, min=0, max=3),

  # omicsscore
  is.numeric(multi_omics_score),
  !is.na(multi_omics_score),
  in_range(multi_omics_score, min=0, max=2),
  
  # overall
  is.numeric(target_risk_score),
  !is.na(target_risk_score),
  in_range(target_risk_score, min=0, max=5)
  
)