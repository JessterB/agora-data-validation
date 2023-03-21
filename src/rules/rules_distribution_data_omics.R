rules_distribution_data_omics <- validator(
  
  # bins
  is.list(bins),
  !is.na(bins),
  is.numeric(bins[[1]]),
  !is.na(bins[[1]]),
  length(bins[[1]][,1]) == 10,
  length(bins[[1]][,2]) == 10,
  bins[[1]] >= 0,
  bins[[1]] <= 2,

  # distribution
  is.list(distribution),
  !is.na(distribution),
  is.numeric(distribution[[1]]),
  !is.na(distribution[[1]]),
  length(distribution[[1]]) == 10,
  distribution[[1]] >= 0,

  # first_quartile
  is.numeric(first_quartile),
  # TODO better validation of this field if we want to start using it

  # max
  is.numeric(max),
  # TODO better validation of this field if we want to start using it

  # mean
  is.numeric(mean),
  # TODO better validation of this field if we want to start using it

  # min
  is.numeric(min),
  # TODO better validation of this field if fixed and/or we want to start using it

  # name
  is.character(name),
  !is.na(name),
  name == "Multi-omic Risk Score",

  # syn_id
  is.character(syn_id),
  !is.na(syn_id),
  syn_id == "syn25913473",

  # third_quartile
  is.numeric(third_quartile),
  # TODO better validation of this field we want to start using it

  # wiki_id
  is.character(wiki_id),
  !is.na(wiki_id),
  wiki_id == '621070'
  
)