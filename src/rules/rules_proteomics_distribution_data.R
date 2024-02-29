rules_proteomics_distribution_data <- validator(
  
  # type
  is.character(type),
  field_length(type, min=3, max=3), 
  type%in% c('LFQ', 'TMT', 'SRM'),
  
  # tissue
  is.character(tissue),
  tissue %in% c("AntPFC", "DLPFC", "MFG", "TCX"),
  
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