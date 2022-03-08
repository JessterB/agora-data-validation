rules_overall_scores <- validator(
  
  # ensg  
  is.character(ENSG),
  !is.na(ENSG),
  is_unique(ENSG),
  field_length(ENSG, n=15),
  
  # geneticsscore
  is.numeric(GeneticsScore),
  !is.na(GeneticsScore),
  in_range(GeneticsScore, min=0, max=3),
  
  # hgnc_gene_id
  is.character(GeneName),
  !is.na(GeneName),
  field_length(GeneName, min=0, max=100), 
  
  # literaturescore
  is.numeric(LiteratureScore),
  !is.na(LiteratureScore),
  in_range(LiteratureScore, min=0, max=2),
  
  # omicsscore
  is.numeric(OmicsScore),
  !is.na(OmicsScore),
  in_range(OmicsScore, min=0, max=2),
  
  # overall
  is.numeric(Logsdon),
  !is.na(Logsdon),
  in_range(Logsdon, min=0, max=9)
  
)