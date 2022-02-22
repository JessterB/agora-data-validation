rules_distribution_data <- validator(
  # geneticsscore.bins.1
  is.numeric(geneticsscore.bins.1),
  !is.na(geneticsscore.bins.1),
  geneticsscore.bins.1 >= 0,
  
  # geneticsscore.bins.2
  is.numeric(geneticsscore.bins.2),
  !is.na(geneticsscore.bins.2),
  geneticsscore.bins.2 > 0,
  
  # geneticsscore.distribution
  is.numeric(geneticsscore.distribution),
  !is.na(geneticsscore.distribution),
  geneticsscore.distribution >= 0,
  
  # geneticsscore.first_quartile
  is.numeric(geneticsscore.first_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # geneticsscore.max
  is.numeric(geneticsscore.max),
  # TODO validate this if fixed and/or we want to start using it
  
  # geneticsscore.mean
  is.numeric(geneticsscore.mean),
  # TODO validate this if fixed and/or we want to start using it
  
  # geneticsscore.min
  is.numeric(geneticsscore.min),
  # TODO validate this if fixed and/or we want to start using it
  
  # geneticsscore.name
  is.character(geneticsscore.name),
  !is.na(geneticsscore.name),
  geneticsscore.name == "Genetics Score",
  
  # geneticsscore.syn_id
  is.character(geneticsscore.syn_id),
  !is.na(geneticsscore.syn_id),
  geneticsscore.syn_id == "syn25913473",
  
  # geneticsscore.third_quartile
  is.numeric(geneticsscore.third_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # geneticsscore.wiki_id
  is.character(geneticsscore.wiki_id),
  !is.na(geneticsscore.wiki_id),
  geneticsscore.wiki_id == '613104',
  
  
  
  
  # literaturescore.bins.1
  is.numeric(literaturescore.bins.1),
  !is.na(literaturescore.bins.1),
  literaturescore.bins.1 >= 0,
  
  # literaturescore.bins.2
  is.numeric(literaturescore.bins.2),
  !is.na(literaturescore.bins.2),
  literaturescore.bins.2 >= 0,
  
  # literaturescore.distribution
  is.numeric(literaturescore.distribution),
  !is.na(literaturescore.distribution),
  literaturescore.distribution >= 0,
  
  # literaturescore.first_quartile
  is.numeric(literaturescore.first_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # literaturescore.max
  is.numeric(literaturescore.max),
  # TODO validate this if fixed and/or we want to start using it
  
  # literaturescore.mean
  is.numeric(literaturescore.mean),
  # TODO validate this if fixed and/or we want to start using it
  
  # literaturescore.min
  is.numeric(literaturescore.min),
  # TODO validate this if fixed and/or we want to start using it
  
  # literaturescore.name
  is.character(literaturescore.name),
  !is.na(literaturescore.name),
  
  # literaturescore.syn_id
  is.character(literaturescore.syn_id),
  !is.na(literaturescore.syn_id),
  literaturescore.syn_id== 'syn25913473',
  
  # literaturescore.third_quartile
  is.numeric(literaturescore.third_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # literaturescore.wiki_id
  is.character(literaturescore.wiki_id),
  !is.na(literaturescore.wiki_id),
  literaturescore.wiki_id == '613105',
  
  
  
  # logsdon.bins.1
  is.numeric(logsdon.bins.1),
  !is.na(logsdon.bins.1),
  logsdon.bins.1 >= 0,
  
  # logsdon.bins.2
  is.numeric(logsdon.bins.2),
  !is.na(logsdon.bins.2),
  logsdon.bins.2 >= 0,
  
  # logsdon.distribution
  is.numeric(logsdon.distribution),
  !is.na(logsdon.distribution),
  logsdon.distribution >= 0,
  
  # logsdon.first_quartile
  is.numeric(logsdon.first_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # logsdon.max
  is.numeric(logsdon.max),
  # TODO validate this if fixed and/or we want to start using it
  
  # logsdon.mean
  is.numeric(logsdon.mean),
  # TODO validate this if fixed and/or we want to start using it
  
  # logsdon.min
  is.numeric(logsdon.min),
  # TODO validate this if fixed and/or we want to start using it
  
  # logsdon.name
  is.character(logsdon.name),
  !is.na(logsdon.name),
  logsdon.name == 'Overall Score',
  
  # logsdon.syn_id
  is.character(logsdon.syn_id),
  !is.na(logsdon.syn_id),
  logsdon.syn_id == 'syn25913473',
  
  # logsdon.third_quartile
  is.numeric(logsdon.third_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # logsdon.wiki_id
  is.character(logsdon.wiki_id),
  !is.na(logsdon.wiki_id),
  logsdon.wiki_id == '613107',
  
  
  
  # omicsscore.bins.1
  is.numeric(omicsscore.bins.1),
  !is.na(omicsscore.bins.1),
  omicsscore.bins.1 >= 0,
  
  # omicsscore.bins.2
  is.numeric(omicsscore.bins.2),
  !is.na(omicsscore.bins.2),
  omicsscore.bins.2 >= 0,
  
  # omicsscore.distribution
  is.numeric(omicsscore.distribution),
  !is.na(omicsscore.distribution),
  omicsscore.distribution >= 0,
  
  # omicsscore.first_quartile
  is.numeric(omicsscore.first_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # omicsscore.max
  is.numeric(omicsscore.max),
  # TODO validate this if fixed and/or we want to start using it
  
  # omicsscore.mean
  is.numeric(omicsscore.mean),
  # TODO validate this if fixed and/or we want to start using it
  
  # omicsscore.min
  is.numeric(omicsscore.min),
  # TODO validate this if fixed and/or we want to start using it
  
  # omicsscore.name
  is.character(omicsscore.name),
  !is.na(omicsscore.name),
  omicsscore.name == 'Genomics Score',
  
  # omicsscore.syn_id
  is.character(omicsscore.syn_id),
  !is.na(omicsscore.syn_id),
  omicsscore.syn_id == 'syn25913473',
  
  # omicsscore.third_quartile
  is.numeric(omicsscore.third_quartile),
  # TODO validate this if fixed and/or we want to start using it
  
  # omicsscore.wiki_id
  is.character(omicsscore.wiki_id),
  !is.na(omicsscore.wiki_id),
  omicsscore.wiki_id == '613106'
  
  
)