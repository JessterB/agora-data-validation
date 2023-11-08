rules_gene_info_ensembl_info <- validator(
  
  # ensembl_release
  is.character(ensembl_release),
  !is.na(ensembl_release),
  field_length(ensembl_release, min=1, max=3),
  
  # ensembl_possible_replacements
  is.list(ensembl_possible_replacements),
  # TODO validate ENSGs in list, if there are any
 
  # ensembl_permalink
  field_format(ensembl_permalink, "https://*.archive.ensembl.org/Homo_sapiens/Gene/Summary?db=core;g=ENSG*")
  
  )