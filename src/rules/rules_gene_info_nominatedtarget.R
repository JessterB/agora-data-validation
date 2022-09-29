rules_gene_info_nominatedtarget <-  validator(
  
  # data_synapseid - is this used?
  is.vector(data_synapseid),
  !is.na(data_synapseid),
  field_length(data_synapseid, min=3, max=25),
  
  # data_used_to_support_target_selection
  is.character(data_used_to_support_target_selection),
  !is.na(data_used_to_support_target_selection),
  field_length(data_used_to_support_target_selection, min=15, max=2000),
  !field_format(data_used_to_support_target_selection, "*�*"),
  
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
  !is.na(initial_nomination), 
  
  # input_data
  is.character(input_data),
  field_length(input_data, min=2, max=200),
  !is.na(input_data), 
  
  # predicted_therapeutic_direction
  is.character(predicted_therapeutic_direction),
  field_length(predicted_therapeutic_direction, min=2, max=2000),
  !is.na(predicted_therapeutic_direction), # checking 
  !field_format(predicted_therapeutic_direction, "*�*"),
  
  # rank - Agora doesn't use this field
  #is.character(rank), 
  #!is.na(rank), 
  
  # source
  source %in% c("Community", "AMP-AD", "Resilience-AD", "TREAT-AD"),
  !is.na(source), 
  
  # study
  is.character(study),
  !is.na(study),
  field_length(study, min=2, max=200),
  
  # target_choice_justification
  is.character(target_choice_justification),
  !is.na(target_choice_justification), 
  field_length(target_choice_justification, min=2, max=3000),
  !field_format(target_choice_justification, "*�*"),
  
  # team
  is.character(team),
  field_length(team, min=3, max=50),
  
  # validation_study_details
  is.character(validation_study_details),
  !is.na(validation_study_details),
  field_length(validation_study_details, min=0, max=1000)

  
)