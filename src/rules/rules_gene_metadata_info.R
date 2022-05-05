rules_gene_metadata_info <- validator(
  
  name.x == name.y,
  summary.x == summary.y,
  hgnc_symbol.x == hgnc_symbol.y,
  length(alias.x) == length(alias.y),
  isIGAP ==igap,
  haseqtl == eqtl,
  isAnyRNAChangedInADBrain == rna_in_ad_brain_change,
  rna_brain_change_studied.x == rna_brain_change_studied.y,
  isAnyProteinChangedInADBrain == protein_in_ad_brain_change,
  protein_brain_change_studied.x == protein_brain_change_studied.y
  
)