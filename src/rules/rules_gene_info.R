rules_gene_info <- validator(
  
  # alias rules
  is.list(alias),
  is.character(alias[[1]][1]), # spot check
  !is.na(alias),
  
  # druggability rules
  is.list(druggability),
  !is.na(druggability),
  # TODO validate object and object fields
  
  # ensembl)gene_id rules
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  is_unique(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # has_eqtl rules
  is.logical(eqtl),
  !is.na(eqtl),
  
  # hgnc_symbol rules
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=2, max=100),
  
  # is_igap rules
  is.logical(igap),
  !is.na(igap),
  
  # median_expression rules
  is.list(median_expression),
  !is.na(median_expression),
  # TODO validate object and object fields
  
  # name rules
  is.character(name),
  !is.na(name),
  field_length(name, min=2, max=200), # current max is ~125 chars (ENSG00000159131)
  
  # nominated_target rules
  is.list(nominated_target),
  !is.na(nominated_target),
  # TODO validate object and object fields
  
  # nominations rules
  is.numeric(nominations),
  # !is.na(nominations), # this fails so the ETL must be omitting this key when no nominations
  # nominations > 0, # this also fails for the same reason - is there a clever way to say 'if != na, then must be >0?'
  
  # is_protein_brain_change_studied rules
  is.logical(protein_brain_change_studied),
  !is.na(protein_brain_change_studied),
  
  # is_protein_in_ad_brain_change rules
  is.logical(protein_in_ad_brain_change),
  !is.na(protein_in_ad_brain_change),
  
  # is_rna_brain_change_studied rules
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
