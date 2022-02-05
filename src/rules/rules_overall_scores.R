rules_overall_scores <- validator(
  
  # ensg  
  is.character(ensg),
  !is.na(ensg),
  is_unique(ensg),
  field_length(ensg, n=15),
  
  # geneticsscore
  is.numeric(geneticsscore),
  !is.na(geneticsscore),
  in_range(geneticsscore, min=0, max=3),
  
  # hgnc_gene_id
  is.character(hgnc_gene_id),
  !is.na(hgnc_gene_id),
  field_length(hgnc_gene_id, min=2, max=100), # TODO 5745 fails
  
  # literaturescore
  is.numeric(literaturescore),
  !is.na(literaturescore),
  in_range(literaturescore, min=0, max=2),
  
  # omicsscore
  is.numeric(omicsscore),
  !is.na(omicsscore),
  in_range(omicsscore, min=0, max=2),
  
  # overall
  is.numeric(overall),
  !is.na(overall),
  in_range(overall, min=0, max=9)
  
)