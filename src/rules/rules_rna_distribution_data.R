rules_rna_distribution_data <- validator(
 
  # model
  is.character(model),
  field_length(model, min=26, max=100), # valid for the 4 current models
  model %in% c("AD Diagnosis (males and females)", "AD Diagnosis x AOD (males and females)","AD Diagnosis x Sex (females only)", "AD Diagnosis x Sex (males only)"),
  
  # tissue
  is.character(tissue),
  tissue %in% c("CBE", "DLPFC", "FP", "IFG", "PHG", "STG", "TCX", "ACC", "PCC"),
  
  # min
  is.numeric(min),
  
  # max
  is.numeric(max),
  
  # median
  is.numeric(median),
  
  # first_quartile
  is.numeric(first_quartile),
  
  # third_quartile
  is.numeric(third_quartile),
  
  # multi-field validation
  max > third_quartile,
  third_quartile > median,
  median > first_quartile,
  first_quartile > min
)