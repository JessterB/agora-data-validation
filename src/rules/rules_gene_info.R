rules_gene_info <- validator(
  
  # alias rules
  is.list(alias),
  is.character(alias[[1]][1]), # spot check
  !is.na(alias),
  
  # druggability rules
  is.list(druggability),
  !is.na(druggability),
  # TODO validate object and object fields
  
  # ensembl_gene_id rules
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  is_unique(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # has_eqtl rules
  is.logical(haseqtl),
  !is.na(haseqtl),
  
  # hgnc_symbol rules
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=0, max=100),
  
  # is_igap rules
  is.logical(isIGAP),
  !is.na(isIGAP),
  
  # median_expression rules
  is.list(medianexpression),
  !is.na(medianexpression),
  # TODO validate object and object fields
  
  # name rules
  is.character(name),
  !is.na(name),
  field_length(name, min=0, max=200), # current max is ~125 chars (ENSG00000159131)
  
  # nominated_target rules
  is.list(nominatedtarget),
  !is.na(nominatedtarget),
  # TODO validate object and object fields
  
  # nominations rules
  is.numeric(nominations),
  # !is.na(nominations), 
  # nominations > 0,
  
  # protein_brain_change_studied rules
  is.logical(protein_brain_change_studied),
  !is.na(protein_brain_change_studied),
  
  # is_protein_in_ad_brain_change rules
  is.logical(isAnyProteinChangedInADBrain),
  !is.na(isAnyProteinChangedInADBrain),
  
  # rna_brain_change_studied rules
  is.logical(rna_brain_change_studied),
  !is.na(rna_brain_change_studied),
  
  # is_rna_in_ad_brain_change rules
  is.logical(isAnyRNAChangedInADBrain),
  !is.na(isAnyRNAChangedInADBrain),
  
  # summary rules
  is.character(summary),
  !is.na(summary),
  
  # multifield uniques
  is_unique(hgnc_symbol, ensembl_gene_id)
 
)
