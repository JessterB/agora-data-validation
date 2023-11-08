rules_team_info <- validator(
  
  #description
  is.character(description),
  field_length(description, min=10, max=2000), 
  
  #members
  is.list(members),
  
  #program
  is.character(program),
  
  #team
  is.character(team),
  field_length(team, min=3, max=50),  
  is_unique(team),
  team %in% c("Columbia-Rush", "Duke", "Emory", "Harvard-MIT", "MSSM", 
              "Sage Bionetworks", "Mayo-UFL-ISB", "Chang Lab", 
              "JAX-VUMC-UW Resilience", "ASU", "Longo Lab", "Duke BARU", 
              "Emory-Sage-SGC", "IUSM-Purdue"),
  
  #team_full
  is.character(team_full),
  field_length(team_full, min=10, max=100), 
  is_unique(team_full)
  
)



