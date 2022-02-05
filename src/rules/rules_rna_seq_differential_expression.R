rules_rna_seq_differential_expression <- validator(
  
  # adj_p_val
  is.numeric(adj_p_val),
  adj_p_val > 0,  # TODO 100 fails
  
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
  field_length(hgnc_symbol, min=2, max=100),
  
  # logfc
  is.numeric(adj_p_val),
  
  # model
  is.character(model),
  field_length(model, min=26, max=100), # valid for the 4 current models
  
  # study
  is.character(study),
  field_length(study, min=2, max=100), # valid for the current studies
  
  # tissue
  is.character(tissue),
  field_length(tissue, min=2, max=5), # valid for the 9 current regions
  
  # multifield uniques
  is_unique(model, tissue, ensembl_gene_id)
)

