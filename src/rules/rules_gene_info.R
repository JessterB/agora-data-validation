rules_gene_info <- validator(
  
  # alias rules
  is.list(alias),
  is.character(alias[[1]][1]), # spot check
  !is.na(alias),
  
  # druggability rules
  is.list(druggability),
  !is.na(druggability),
  # see additional validation rules in rules_gene_info_druggability.R
  
  # ensembl_gene_id rules
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  is_unique(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # is_eqtl rules
  is.logical(is_eqtl),
  !is.na(is_eqtl),
  
  # hgnc_symbol rules
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=0, max=100),
  
  # is_igap rules
  is.logical(is_igap),
  !is.na(is_igap),
  
  # median_expression rules
  is.list(median_expression),
  !is.na(median_expression),
  # see additional validation rules in rules_gene_info_median_expression.R
  
  # name rules
  is.character(name),
  !is.na(name),
  field_length(name, min=0, max=200), # current max is ~125 chars (ENSG00000159131)
  
  # target_nominations rules
  is.list(target_nominations),
  lengths(target_nominations) > 0,
  # see additional validation rules in rules_gene_info_nominatedtarget.R
  
  # total_nominations rules
  is.numeric(total_nominations),
  !is.na(total_nominations), 
  total_nominations > 0,
  
  # protein_brain_change_studied rules
  is.logical(protein_brain_change_studied),
  !is.na(protein_brain_change_studied),
  
  # is_any_protein_in_ad_brain_changed rules
  is.logical(is_any_protein_changed_in_ad_brain),
  !is.na(is_any_protein_changed_in_ad_brain),
  
  # rna_brain_change_studied rules
  is.logical(rna_brain_change_studied),
  !is.na(rna_brain_change_studied),
  
  # is_any_rna_in_ad_brain_changed rules
  is.logical(is_any_rna_changed_in_ad_brain),
  !is.na(is_any_rna_changed_in_ad_brain),
  
  # summary rules
  is.character(summary),
  !is.na(summary),
  
  # biodomains rules
  is.list(biodomains),
  is.character(biodomains[[12]][1]), # spot check 
  !is.na(biodomains),
  
  #is_tep rules
  is.logical(is_tep), 
  
  #is_adi rules
  is.logical(is_adi),  
  
  # resource_url rules
  is.character(resource_url),
  
  # ensembl_info rules
  !is.na(median_expression),
  # see additional validation rules in rules_gene_info_ensembl_info.R
  
  # multifield validation
  if (is_tep == TRUE) !is.na(resource_url),
  if (is_adi == TRUE) !is.na(resource_url),
  if (is_tep == TRUE) field_format(resource_url, "https://adknowledgeportal.synapse.org/Explore/Target%20Enabling%20Resources?QueryWrapper0=%7B%22sql%22%3A%22select%20*%20from%20syn26146692%20WHERE%20%60isPublic%60%20%3D%20true%22%2C%22limit%22%3A25%2C%22offset%22%3A0%2C%22selectedFacets%22%3A%5B%7B%22concreteType%22%3A%22org.sagebionetworks.repo.model.table.FacetColumnValuesRequest%22%2C%22columnName%22%3A%22target%22%2C%22facetValues%22%3A%5B%22*%22%5D%7D%5D%7D"),
  if (is_adi == TRUE) field_format(resource_url, "https://adknowledgeportal.synapse.org/Explore/Target%20Enabling%20Resources?QueryWrapper0=%7B%22sql%22%3A%22select%20*%20from%20syn26146692%20WHERE%20%60isPublic%60%20%3D%20true%22%2C%22limit%22%3A25%2C%22offset%22%3A0%2C%22selectedFacets%22%3A%5B%7B%22concreteType%22%3A%22org.sagebionetworks.repo.model.table.FacetColumnValuesRequest%22%2C%22columnName%22%3A%22target%22%2C%22facetValues%22%3A%5B%22*%22%5D%7D%5D%7D"),
  
  
  # multifield uniques
  is_unique(hgnc_symbol, ensembl_gene_id)
)
