rules_metabolomics <- validator(
  
  # ad_diagnosis_p_value rules
  is.list(ad_diagnosis_p_value),
  !is.na(ad_diagnosis_p_value),
  
  # associated_gene_name rules
  is.character(associated_gene_name),
  !is.na(associated_gene_name),
  field_length(associated_gene_name, min=2, max=100),
  is_unique(associated_gene_name),
  
  # association_p rules
  is.numeric(association_p),
  !is.na(association_p),
  association_p > 0,
  
  # boxplot_group_names rules
  is.list(boxplot_group_names),
  !is.na(boxplot_group_names),
  length(boxplot_group_names[[1]]) == 2, # spot check
  boxplot_group_names[[1]][1] == "CN",   # spot check
  boxplot_group_names[[1]][2] == "AD",   # spot check
  
  # ensembl_gene_id rules
  is.character(ensembl_gene_id),
  !is.na(ensembl_gene_id),
  field_length(ensembl_gene_id, n=15),
  is_unique(ensembl_gene_id),
  
  #gene_wide_p_threshold_1kgp rules
  is.numeric(gene_wide_p_threshold_1kgp),
  !is.na(gene_wide_p_threshold_1kgp),
  gene_wide_p_threshold_1kgp > 0,
  
  # metabolite_full_name rules
  is.character(metabolite_full_name),
  !is.na(metabolite_full_name),
  field_length(metabolite_full_name, min=2, max=100), 
  
  # metabolite_id rules
  is.character(metabolite_id),
  !is.na(metabolite_id),
  field_length(metabolite_full_name, min=2, max=100), 
  
  # n_per_group rules
  is.list(n_per_group),
  !is.na(n_per_group),
  length(n_per_group[[1]]) == 2,     # spot check
  is.numeric(n_per_group[[1]][1]),   # spot check
  is.numeric(n_per_group[[1]][2]),   # spot check
  
  # transposed_boxplot_stats rules
  is.list(transposed_boxplot_stats),
  !is.na(transposed_boxplot_stats),
  length(transposed_boxplot_stats[[1]]) == 10,    # spot check
  is.numeric(transposed_boxplot_stats[[1]][3]),   # spot check

  
  # multifield uniques
  is_unique(associated_gene_name, ensembl_gene_id),
  is_unique(associated_gene_name, metabolite_id),
  is_unique(ensembl_gene_id, metabolite_id)
  
)
