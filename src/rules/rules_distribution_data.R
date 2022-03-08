rules_distribution_data <- validator(
  # GeneticsScore.bins.1
  is.numeric(GeneticsScore.bins.1),
  !is.na(GeneticsScore.bins.1),
  GeneticsScore.bins.1 >= 0,
  
  # GeneticsScore.bins.2
  is.numeric(GeneticsScore.bins.2),
  !is.na(GeneticsScore.bins.2),
  GeneticsScore.bins.2 > 0,
  
  # GeneticsScore.distribution
  is.numeric(GeneticsScore.distribution),
  !is.na(GeneticsScore.distribution),
  GeneticsScore.distribution >= 0,
  
  # GeneticsScore.first_quartile
  is.numeric(GeneticsScore.first_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # GeneticsScore.max
  is.numeric(GeneticsScore.max),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # GeneticsScore.mean
  is.numeric(GeneticsScore.mean),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # GeneticsScore.min
  is.numeric(GeneticsScore.min),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # GeneticsScore.name
  is.character(GeneticsScore.name),
  !is.na(GeneticsScore.name),
  GeneticsScore.name == "Genetics Score",
  
  # GeneticsScore.syn_id
  is.character(GeneticsScore.syn_id),
  !is.na(GeneticsScore.syn_id),
  GeneticsScore.syn_id == "syn25913473",
  
  # GeneticsScore.third_quartile
  is.numeric(GeneticsScore.third_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # GeneticsScore.wiki_id
  is.character(GeneticsScore.wiki_id),
  !is.na(GeneticsScore.wiki_id),
  GeneticsScore.wiki_id == '613104',
  
  
  
  
  # LiteratureScore.bins.1
  is.numeric(LiteratureScore.bins.1),
  !is.na(LiteratureScore.bins.1),
  LiteratureScore.bins.1 >= 0,
  
  # LiteratureScore.bins.2
  is.numeric(LiteratureScore.bins.2),
  !is.na(LiteratureScore.bins.2),
  LiteratureScore.bins.2 >= 0,
  
  # LiteratureScore.distribution
  is.numeric(LiteratureScore.distribution),
  !is.na(LiteratureScore.distribution),
  LiteratureScore.distribution >= 0,
  
  # LiteratureScore.first_quartile
  is.numeric(LiteratureScore.first_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # LiteratureScore.max
  is.numeric(LiteratureScore.max),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # LiteratureScore.mean
  is.numeric(LiteratureScore.mean),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # LiteratureScore.min
  is.numeric(LiteratureScore.min),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # LiteratureScore.name
  is.character(LiteratureScore.name),
  !is.na(LiteratureScore.name),
  
  # LiteratureScore.syn_id
  is.character(LiteratureScore.syn_id),
  !is.na(LiteratureScore.syn_id),
  LiteratureScore.syn_id== 'syn25913473',
  
  # LiteratureScore.third_quartile
  is.numeric(LiteratureScore.third_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # LiteratureScore.wiki_id
  is.character(LiteratureScore.wiki_id),
  !is.na(LiteratureScore.wiki_id),
  LiteratureScore.wiki_id == '613105',
  
  
  
  # Logsdon.bins.1
  is.numeric(Logsdon.bins.1),
  !is.na(Logsdon.bins.1),
  Logsdon.bins.1 >= 0,
  
  # Logsdon.bins.2
  is.numeric(Logsdon.bins.2),
  !is.na(Logsdon.bins.2),
  Logsdon.bins.2 >= 0,
  
  # Logsdon.distribution
  is.numeric(Logsdon.distribution),
  !is.na(Logsdon.distribution),
  Logsdon.distribution >= 0,
  
  # Logsdon.first_quartile
  is.numeric(Logsdon.first_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # logsdon.max
  is.numeric(Logsdon.max),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # Logsdon.mean
  is.numeric(Logsdon.mean),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # Logsdon.min
  is.numeric(Logsdon.min),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # Logsdon.name
  is.character(Logsdon.name),
  !is.na(Logsdon.name),
  Logsdon.name == 'Overall Score',
  
  # Logsdon.syn_id
  is.character(Logsdon.syn_id),
  !is.na(Logsdon.syn_id),
  Logsdon.syn_id == 'syn25913473',
  
  # Logsdonn.third_quartile
  is.numeric(Logsdon.third_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # Logsdon.wiki_id
  is.character(Logsdon.wiki_id),
  !is.na(Logsdon.wiki_id),
  Logsdon.wiki_id == '613107',
  
  
  
  # OmicsScore.bins.1
  is.numeric(OmicsScore.bins.1),
  !is.na(OmicsScore.bins.1),
  OmicsScore.bins.1 >= 0,
  
  # OmicsScore.bins.2
  is.numeric(OmicsScore.bins.2),
  !is.na(OmicsScore.bins.2),
  OmicsScore.bins.2 >= 0,
  
  # OmicsScore.distribution
  is.numeric(OmicsScore.distribution),
  !is.na(OmicsScore.distribution),
  OmicsScore.distribution >= 0,
  
  # OmicsScore.first_quartile
  is.numeric(OmicsScore.first_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # OmicsScore.max
  is.numeric(OmicsScore.max),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # OmicsScore.mean
  is.numeric(OmicsScore.mean),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # OmicsScore.min
  is.numeric(OmicsScore.min),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # OmicsScore.name
  is.character(OmicsScore.name),
  !is.na(OmicsScore.name),
  OmicsScore.name == 'Genomics Score',
  
  # OmicsScore.syn_id
  is.character(OmicsScore.syn_id),
  !is.na(OmicsScore.syn_id),
  OmicsScore.syn_id == 'syn25913473',
  
  # OmicsScore.third_quartile
  is.numeric(OmicsScore.third_quartile),
  # TODO better validation of this field if fixed and/or we want to start using it
  
  # OmicsScore.wiki_id
  is.character(OmicsScore.wiki_id),
  !is.na(OmicsScore.wiki_id),
  OmicsScore.wiki_id == '613106'
  
  
)