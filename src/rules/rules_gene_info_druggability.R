rules_gene_info_druggability <- validator(
  
  # abability_bucket
  is.numeric(abability_bucket),
  
  
  # abability_bucket_definition
  is.character(abability_bucket_definition),
  field_length(abability_bucket_definition, min=44, max=1000),
  
  # classification
  is.character(classification),
  field_length(classification, min=22, max=1000),
  
  # pharos_class
  is.character(pharos_class),
  
  # safety_bucket
  is.numeric(safety_bucket),
  
  # safety_bucket_definition
  is.character(safety_bucket_definition),
  field_length(safety_bucket_definition, min=50, max=1000),
  
  # sm_druggability_bucket
  is.numeric(sm_druggability_bucket)
)
