rules_genes_biodomains <- validator(
  
  # ensembl_id
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  is_unique(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # gene_biodomains
  is.list(gene_biodomains),
  length(gene_biodomains) > 0
)

rules_gene_biodomains <- validator(
  
  # biodomain
  is.character(biodomain),
  !is.na(biodomain),
  field_length(biodomain, min=0, max=100),
  
  # go_terms (list)
  is.list(go_terms),
  length(go_terms) > 0,
  all(!is.na(go_terms)),
  
  # n_biodomain_terms
  is.numeric(n_biodomain_terms),
  n_biodomain_terms > 0,
  
  # n_gene_biodomain_terms
  is.numeric(n_gene_biodomain_terms),
  lengths(go_terms) == n_gene_biodomain_terms,
  
  # pct_linking_terms
  is.numeric(pct_linking_terms),
  pct_linking_terms > 0,
  pct_linking_terms <= 100
)

rules_gene_biodomain_go_terms <- validator(
  
  # go_terms_item
  is.character(go_terms),
  !is.na(go_terms),
  # shortest GO term we have is 4 ("axon")
  # longest GO term we have is 147 ("endonucleolytic cleavage in ITS1 to separate SSU-rRNA from 5.8S rRNA.."
  field_length(go_terms, min=4, max=150)
)