rules_proteomics_srm <- validator(
  
  # uniqid
  is.character(uniqid),
  field_format(uniqid, "^^\\w{2,}|[A-NR-Z][0-9]([A-Z][A-Z0-9]{2}[0-9]){1,2}$", type="regex"),
  
  # hgnc_symbol
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=2, max=100),
  
  # uniprotid (but not really a uniprotId, this is a peptide probe name; the probe can match multiple peptides of the same gene )
  is.character(uniprotid), 
  field_format(uniprotid, "[OPQ][0-9][A-Z0-9]{3}[0-9]|[A-NR-Z][0-9]([A-Z][A-Z0-9]{2}[0-9]){1,2}", type="regex"),  # regex from https://www.uniprot.org/help/accession_numbers
  
  # log2_fc
  is.numeric(log2_fc),
  
  # or - ignore this field
  
  # ci_lwr
  is.numeric(ci_lwr),
  
  # ci_upr
  is.numeric(ci_upr),
  
  # pval
  is.numeric(pval),
  pval > 0, # TODO some fails here
  
  # cor_pval 
  is.numeric(cor_pval),
  cor_pval > 0,  
  
  # ensembl_gene_id
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # tissue
  is.character(tissue),
  tissue %vin% c("DLPFC"),

  # multi-field uniques
  is_unique(hgnc_symbol, uniprotid, tissue),
  is_unique(ensembl_gene_id, uniprotid, tissue)
  
)