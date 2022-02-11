rules_network <- validator(
  
  # brainregion - we call this tissue elsewhere
  is.character(brainregion),
  !is.na(brainregion),
  brainregion %in% c("CBE", "DLPFC", "FP", "IFG", "PHG", "STG", "TCX"),
  
  # genea_ensembl_gene_id
  is.character(genea_ensembl_gene_id),
  !is.na(genea_ensembl_gene_id),
  field_length(genea_ensembl_gene_id, n=15),
  
  # genea_external_gene_name
  is.character(genea_external_gene_name),
  !is.na(genea_external_gene_name),
  field_length(genea_external_gene_name, min=2, max=100), # TODO fails here
  
  # geneb_ensembl_gene_id
  is.character(geneb_ensembl_gene_id),
  !is.na(geneb_ensembl_gene_id),
  field_length(geneb_ensembl_gene_id, n=15),
  
  # geneb_external_gene_name
  is.character(geneb_external_gene_name),
  !is.na(geneb_external_gene_name),
  field_length(geneb_external_gene_name, min=2, max=100),# TODO fails here
  
  # multifield uniques
  is_unique(brainregion, genea_ensembl_gene_id, geneb_ensembl_gene_id), # TODO fails here
  is_unique(brainregion, genea_external_gene_name, geneb_external_gene_name) # TODO fails here
  
)