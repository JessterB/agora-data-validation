rules_biodomain_info <-  validator(
  
  # name
  is.character(name),
  !is.na(name),
  field_length(name, min=7, max=29),
  !field_format(name, "*�*"),
  name %in% c("Apoptosis", "APP Metabolism", "Autophagy", "Cell Cycle", "DNA Repair",
              "Endolysosome", "Epigenetic", "Immune Response", "Lipid Metabolism", 
              "Metal Binding and Homeostasis", "Mitochondrial Metabolism", "Myelination", 
              "Oxidative Stress", "Proteostasis", "RNA Spliceosome", "Structural Stabilization",
              "Synapse", "Tau Homeostasis", "Vasculature"),
  length(name) == 19
)