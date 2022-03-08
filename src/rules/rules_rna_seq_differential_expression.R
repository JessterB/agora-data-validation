rules_rna_seq_differential_expression <- validator(
  
  # adj_p_val
  is.numeric(adj_p_val),
  adj_p_val > 0, 
  
  # ci_l
  is.numeric(adj_p_val),
  
  # ci_r
  is.numeric(adj_p_val),
  
  # ensembl_gene_id
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # fc
  is.numeric(adj_p_val),
  
  # hgnc_symbol
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=0, max=100),
  
  # logfc
  is.numeric(adj_p_val),
  
  # model
  is.character(model),
  field_length(model, min=26, max=100), # valid for the 4 current models
  model %in% c("AD Diagnosis (males and females)", "AD Diagnosis x AOD (males and females)","AD Diagnosis x Sex (females only)", "AD Diagnosis x Sex (males only)"),
  
  # study
  is.character(study),
  field_length(study, min=2, max=100), # valid for the current studies
  
  # tissue
  is.character(tissue),
  tissue %in% c("CBE", "DLPFC", "FP", "IFG", "PHG", "STG", "TCX"),
  
  # multifield uniques
  is_unique(model, tissue, ensembl_gene_id)
)

