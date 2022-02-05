rules_neuropath_corr <- validator(
  
  # ci_lower
  is.numeric(ci_lower),
  !is.na(ci_lower),
  
  # ci_upper
  is.numeric(ci_upper),
  !is.na(ci_upper),
  
  # ensembl_gene_id
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # hgnc_gene_id
  is.character(hgnc_gene_id),
  !is.na(hgnc_gene_id),
  field_length(hgnc_gene_id, min=2, max=100),
  
  
  # neuropath_type
  is.character(neuropath_type),
  !is.na(neuropath_type),
  field_length(neuropath_type, n=5), # the three measures happen to all be 5 character strings
  
  # oddsratio
  is.numeric(oddsratio),
  !is.na(oddsratio),
  
  # pval
  is.numeric(pval),
  !is.na(pval),
  pval > 0, # TODO 19 fails here, track them down? but we don't use this pval
  
  # pval_adj
  is.numeric(pval_adj),
  !is.na(pval_adj),
  pval_adj > 0, # no fails here, we use this pval
  
  # multifield uniques
  is_unique(ensembl_gene_id, neuropath_type),
  is_unique(hgnc_gene_id, ensembl_gene_id, neuropath_type)
  
)