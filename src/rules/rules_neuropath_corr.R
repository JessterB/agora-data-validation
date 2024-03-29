rules_neuropath_corr <- validator(
  
  # ci_lower
  is.numeric(ci_lower),
  !is.na(ci_lower),
  
  # ci_upper
  is.numeric(ci_upper),
  !is.na(ci_upper),
  
  # ensembl_gene_id
  is.character(ensg),
  !is.na(ensg),
  field_length(ensg, n=15),
  
  # hgnc_gene_id
  is.character(gname),
  !is.na(gname),
  field_length(gname, min=0, max=100),
  
  
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
  pval > 0, # not used
  
  # pval_adj
  is.numeric(pval_adj),
  !is.na(pval_adj),
  pval_adj > 0, # used
  
  # multifield uniques
  is_unique(ensg, neuropath_type),
  is_unique(gname, ensg, neuropath_type)
  
)