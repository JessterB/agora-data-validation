rules_target_exp_validation_harmonized <- validator(
  
  #balanced_for_sex
  is.character(balanced_for_sex),
  
  #contributors
  is.character(contributors),
  field_length(contributors, min=2, max=1000),
  
  #date_report
  is.character(date_report),
  field_format(date_report, "^\\d{1,2}/\\d{1,2}/\\d{2}$", type='regex'),
  
  #ensembl_gene_id
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15), 
  
  #hgnc_symbol
  is.character(hgnc_symbol),
  !is.na(hgnc_symbol),
  field_length(hgnc_symbol, min=2, max=100),
  
  #hypothesis_tested
  is.character(hypothesis_tested),
  !field_format(hypothesis_tested, "*�*"),
  
  #model_system
  is.character(model_system),
  !field_format(hypothesis_tested, "*�*"),
  
  #outcome_measure
  is.character(outcome_measure),
  !field_format(hypothesis_tested, "*�*"),
  
  #outcome_measure_details
  is.character(outcome_measure_details),
  !field_format(hypothesis_tested, "*�*"),
  
  #published
  is.character(published),
  published %in% c("Yes", "No", "yes", "no"), 
  
  #reference
  is.character(reference),
  !field_format(hypothesis_tested, "*�*"),
  
  #reference_doi
  is.character(reference_doi),
  field_format(reference_doi, "^$|^https?://doi.org/.*$", type='regex'),  
  
  #species
  is.character(species),
  !field_format(hypothesis_tested, "*�*"),
  
  #summary_findings
  is.character(summary_findings),
  !field_format(hypothesis_tested, "*�*"),
  
  #team
  is.character(team),
  field_length(team, min=2, max=100),
  
  # multifield validation
  if (tolower(published) == "yes") !is.na(reference),
  if (tolower(published) == "yes") !is.na(reference_doi)
)

