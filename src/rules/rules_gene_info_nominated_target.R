rules_gene_info_nominated_target <-  validator(
  
  # data_synapseid - is this used?
  is.vector(data_synapseid),
  
  # data_used_to_support_target_selection
  is.character(data_used_to_support_target_selection),
  !is.na(data_used_to_support_target_selection),
  field_length(data_used_to_support_target_selection, min=15, max=2000),
  
  # ensembl_gene_id
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  
  # hgnc_symbol
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=2, max=25),
  
  # initial_nomination
  is.numeric(initial_nomination),
  initial_nomination >= 2018,
  
  # input_data
  is.character(input_data),
  
  # predicted_therapeutic_direction
  is.character(team),
  
  # rank - is this used?
  is.character(rank), 
  
  # source
  source %in% c("Community", "AMP-AD", "Resilience-AD", "TREAT-AD"),
  
  # study
  is.character(team),
  
  # target_choice_justification
  is.character(team),
  
  # team
  is.character(team),
  field_length(team, min=3, max=50),  
  
  # validation_study_details
  is.character(validation_study_details),
  field_length(validation_study_details, min=0, max=1000)
  
)