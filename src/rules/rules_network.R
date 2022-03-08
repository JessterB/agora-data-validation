rules_network <- validator(
  
  # brainregion - we call this tissue elsewhere
  is.character(brainRegion),
  !is.na(brainRegion),
  brainRegion %in% c("CBE", "DLPFC", "FP", "IFG", "PHG", "STG", "TCX"),
  
  # geneA_ensembl_gene_id
  is.character(geneA_ensembl_gene_id),
  !is.na(geneA_ensembl_gene_id),
  field_length(geneA_ensembl_gene_id, n=15),
  
  # geneA_external_gene_name
  is.character(geneA_external_gene_name),
  !is.na(geneA_external_gene_name),
  field_length(geneA_external_gene_name, min=2, max=100),
  
  # geneB_ensembl_gene_id
  is.character(geneB_ensembl_gene_id),
  !is.na(geneB_ensembl_gene_id),
  field_length(geneB_ensembl_gene_id, n=15),
  
  # geneB_external_gene_name
  is.character(geneB_external_gene_name),
  !is.na(geneB_external_gene_name),
  field_length(geneB_external_gene_name, min=2, max=100),
  
  # multifield uniques
  is_unique(brainRegion, geneA_ensembl_gene_id, geneB_ensembl_gene_id)
)