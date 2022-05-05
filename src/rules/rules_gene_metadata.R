rules_gene_metadata <- validator(
  
  # alias rules
  is.list(alias),
  is.character(alias[[1]][1]), # spot check
  !is.na(alias),
  
  # ensembl_gene_id rules
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  is_unique(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # eqtl rules
  is.logical(eqtl),
  !is.na(eqtl),
  
  # hgnc_symbol rules
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=0, max=100),
  
  # igap rules
  is.logical(igap),
  !is.na(igap),
  
  # name rules
  is.character(name),
  !is.na(name),
  field_length(name, min=0, max=200), # current max is ~125 chars (ENSG00000159131)
  
  # nominations rules
  is.numeric(nominations),
  # !is.na(nominations), 
  # nominations > 0,
  
  # protein_brain_change_studied rules
  is.logical(protein_brain_change_studied),
  !is.na(protein_brain_change_studied),
  
  # is_protein_in_ad_brain_change rules
  is.logical(protein_in_ad_brain_change),
  !is.na(protein_in_ad_brain_change),
  
  # rna_brain_change_studied rules
  is.logical(rna_brain_change_studied),
  !is.na(rna_brain_change_studied),
  
  # is_rna_in_ad_brain_change rules
  is.logical(rna_in_ad_brain_change),
  !is.na(rna_in_ad_brain_change),
  
  # summary rules
  is.character(summary),
  !is.na(summary),
  
  # multifield uniques
  is_unique(hgnc_symbol, ensembl_gene_id)
  
)
