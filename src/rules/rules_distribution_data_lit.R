rules_distribution_data_lit <- validator(
  
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
  name == "Literature Score",

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
  wiki_id == '613105'


# 
# 
#   # LiteratureScore.bins.1
#   is.numeric(LiteratureScore.bins.1),
#   !is.na(LiteratureScore.bins.1),
#   LiteratureScore.bins.1 >= 0,
# 
#   # LiteratureScore.bins.2
#   is.numeric(LiteratureScore.bins.2),
#   !is.na(LiteratureScore.bins.2),
#   LiteratureScore.bins.2 >= 0,
# 
#   # LiteratureScore.distribution
#   is.numeric(LiteratureScore.distribution),
#   !is.na(LiteratureScore.distribution),
#   LiteratureScore.distribution >= 0,
# 
#   # LiteratureScore.first_quartile
#   is.numeric(LiteratureScore.first_quartile),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # LiteratureScore.max
#   is.numeric(LiteratureScore.max),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # LiteratureScore.mean
#   is.numeric(LiteratureScore.mean),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # LiteratureScore.min
#   is.numeric(LiteratureScore.min),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # LiteratureScore.name
#   is.character(LiteratureScore.name),
#   !is.na(LiteratureScore.name),
# 
#   # LiteratureScore.syn_id
#   is.character(LiteratureScore.syn_id),
#   !is.na(LiteratureScore.syn_id),
#   LiteratureScore.syn_id== 'syn25913473',
# 
#   # LiteratureScore.third_quartile
#   is.numeric(LiteratureScore.third_quartile),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # LiteratureScore.wiki_id
#   is.character(LiteratureScore.wiki_id),
#   !is.na(LiteratureScore.wiki_id),
#   LiteratureScore.wiki_id == '613105',
# 
# 
# 
#   # Logsdon.bins.1
#   is.numeric(Logsdon.bins.1),
#   !is.na(Logsdon.bins.1),
#   Logsdon.bins.1 >= 0,
# 
#   # Logsdon.bins.2
#   is.numeric(Logsdon.bins.2),
#   !is.na(Logsdon.bins.2),
#   Logsdon.bins.2 >= 0,
# 
#   # Logsdon.distribution
#   is.numeric(Logsdon.distribution),
#   !is.na(Logsdon.distribution),
#   Logsdon.distribution >= 0,
# 
#   # Logsdon.first_quartile
#   is.numeric(Logsdon.first_quartile),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # logsdon.max
#   is.numeric(Logsdon.max),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # Logsdon.mean
#   is.numeric(Logsdon.mean),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # Logsdon.min
#   is.numeric(Logsdon.min),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # Logsdon.name
#   is.character(Logsdon.name),
#   !is.na(Logsdon.name),
#   Logsdon.name == 'Overall Score',
# 
#   # Logsdon.syn_id
#   is.character(Logsdon.syn_id),
#   !is.na(Logsdon.syn_id),
#   Logsdon.syn_id == 'syn25913473',
# 
#   # Logsdonn.third_quartile
#   is.numeric(Logsdon.third_quartile),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # Logsdon.wiki_id
#   is.character(Logsdon.wiki_id),
#   !is.na(Logsdon.wiki_id),
#   Logsdon.wiki_id == '613107',
# 
# 
# 
#   # OmicsScore.bins.1
#   is.numeric(OmicsScore.bins.1),
#   !is.na(OmicsScore.bins.1),
#   OmicsScore.bins.1 >= 0,
# 
#   # OmicsScore.bins.2
#   is.numeric(OmicsScore.bins.2),
#   !is.na(OmicsScore.bins.2),
#   OmicsScore.bins.2 >= 0,
# 
#   # OmicsScore.distribution
#   is.numeric(OmicsScore.distribution),
#   !is.na(OmicsScore.distribution),
#   OmicsScore.distribution >= 0,
# 
#   # OmicsScore.first_quartile
#   is.numeric(OmicsScore.first_quartile),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # OmicsScore.max
#   is.numeric(OmicsScore.max),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # OmicsScore.mean
#   is.numeric(OmicsScore.mean),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # OmicsScore.min
#   is.numeric(OmicsScore.min),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # OmicsScore.name
#   is.character(OmicsScore.name),
#   !is.na(OmicsScore.name),
#   OmicsScore.name == 'Genomics Score',
# 
#   # OmicsScore.syn_id
#   is.character(OmicsScore.syn_id),
#   !is.na(OmicsScore.syn_id),
#   OmicsScore.syn_id == 'syn25913473',
# 
#   # OmicsScore.third_quartile
#   is.numeric(OmicsScore.third_quartile),
#   # TODO better validation of this field if fixed and/or we want to start using it
# 
#   # OmicsScore.wiki_id
#   is.character(OmicsScore.wiki_id),
#   !is.na(OmicsScore.wiki_id),
#   OmicsScore.wiki_id == '613106'
  
  
)