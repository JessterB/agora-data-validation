rules_proteomics <- validator(
  
  # ci_lwr
  is.numeric(ci_lwr),
  
  # ci_upr
  is.numeric(ci_upr),
  
  # cor_pval 
  is.numeric(cor_pval),
  cor_pval > 0,  
  
  # ensemble_gene_id
  is.character(ensemble_gene_id),
  !is.na(ensemble_gene_id),
  field_length(ensemble_gene_id, n=15),
  
  
  
  # hgnc_gene_id
  is.character(hgnc_gene_id),
  !is.na(hgnc_gene_id),
  field_length(hgnc_gene_id, min=2, max=100),
  
  # log2_fc
  is.numeric(log2_fc),
  
  # pval
  is.numeric(pval),
  pval > 0, # TODO some fails here
  
  # tissue
  is.character(tissue),
  tissue %vin% c("AntPFC", "DLPFC", "MFG", "TCX"),
  
  # uniprotid
  is.character(uniprotid), 
  field_format(uniprotid, "[OPQ][0-9][A-Z0-9]{3}[0-9]|[A-NR-Z][0-9]([A-Z][A-Z0-9]{2}[0-9]){1,2}", type="regex"),  # regex from https://www.uniprot.org/help/accession_numbers
  
  # uniqid
  is.character(uniqid),
  field_format(uniqid, "^^\\w{2,}|[A-NR-Z][0-9]([A-Z][A-Z0-9]{2}[0-9]){1,2}$", type="regex"),
  
  # multi-field uniques
  #is_unique(ensemble_gene_id, uniprotid, tissue), # see analysis for why this rule fails
  is_unique(hgnc_gene_id, uniprotid, tissue),
  is_unique(uniqid, tissue)
  
)