

# Ensures we have the packages we need
prepare <- function() {
    if (!require("synapser")) { install.packages("synapser", repos = c("http://ran.synapse.org", "http://cran.fhcrc.org")) }
    if (!require("jsonlite")) { install.packages("jsonlite") }
    if (!require("tidyverse")) { install.packages("tidyverse") }
    if (!require("sqldf")) { install.packages("sqldf") }
    if (!require("validate")) { install.packages("validate") }
    #if (!require("arrow")) { install.packages("arrow") } # for feather files; causes some errors so enable only when needed
    library(synapser)
    library(jsonlite)
    library(tidyverse)
    library(sqldf)
    library(validate)
    synLogin()
  }

# Downloads the specified pair of files from Synapse & makes them available
# globally as dataframes named 'name_old' and 'name_new'
# - old_synId  SynapseId of the older version of the file
# - new_synId  SynapseId of the newer version of the file
# - name   Name prefix for the resulting global dataframes
# - quiet  Whether to print additional information

download_files <- function(old_synId, new_synId, name, type = 'json', quiet = TRUE) {
  name_old <- paste(name, "old", sep="_")
  name_new <- paste(name, "new", sep="_")
  
  old <- download_file(old_synId, name_old, type, quiet)
  new <- download_file(new_synId, name_new, type, quiet)
  
  assign(name_old, old, envir = .GlobalEnv)
  assign(name_new, new, envir = .GlobalEnv) 
  
  if(!quiet) {
    cat(paste("Dataframe available globally:", name_old, old_synId, sep=" "))
    cat(paste("Dataframe available globally:", name_new, new_synId, sep=" "))
  }
}

# Downloads the specified file from Synapse  
# synId  SynapseId of the file
# name   Name for the downloaded file
# quiet  Whether to print debug information

download_file <- function(synId, df_name, type = 'json', quiet = TRUE) {
  
  if(!quiet) {
    cat(paste0("Downloading ", synId, "..."))
  }
  
  file <- synGet(synId, downloadLocation = "files/")
  
  # TODO are there other metadata values worth printing out here?
  cat(paste0(synId, "\n- Modified on ", file$properties$createdOn, "\n- Version ", file$properties$versionNumber, "\n"))

  path <- file$path
  if (type == 'f') { 
    print('Did you remember to uncomment the arrow package in utils.prepare()?')
    data <- read_feather(path)
    } else {
    if (type == 'json') { data <- fromJSON(path) }
    if (type == 'csv') { data <- read.csv(path) }
    if (type == 'tsv') { data <- read.csv(path, sep = "\t") }
    df_name <<- as.data.frame(data) 
  }
}


# Compares the specified pair of files
# old   The first file's name
# new   The second file's name
# name  Friendly name for the pair of files being compared, e.g. gene_info
# summarize  Whether to print out a summary() for each file

# TODO this could be improved once our field names stabilize
compare <- function(old, new, name, summarize = TRUE) {
  cat("\nNumber of Records \n- old: ", nrow(old), "\n- new: ", nrow(new))
  cat("\n\nNumber of Columns \n- old :", ncol(old), "\n- new: ", ncol(new))
  old_cols <- colnames(old)
  new_cols <- colnames(new)
  cat("\n\nOld Column Names", str_sort(old_cols), sep="\n- ")
  cat("\nNew Column Names", str_sort(new_cols), sep="\n- ")
  
  cat("\n\nColumns dropped: ", setdiff(old_cols,new_cols), sep="\n- ")
  cat("\n\nColumns added: ", setdiff(new_cols,old_cols), sep="\n- ")
  
  if (summarize) {
    cat(summarize(old, paste("old ", name)))
    cat(summarize(new, paste("new ", name)))
  }
}

# Prints out a summary information about a dataframe
# dataframe  The dataframe to summarize
# name       Friendly name for the dataframe

summarize <- function(dataframe, name) {
  cat("\n\nSummary ", name, "\n")
  summary(dataframe)
}


# Applies a set of rules to a dataframe for validation
# dataframe  The dataframe to validate
# rules      The rules to apply

test <- function(df, rules) {
  out <- confront(df, rules)
  #print(warnings(out)) # uncomment to debug rule warnings
  print(errors(out))  # uncomment to debug rule errors
  print(summary(out))
  #plot(out)   # this is interesting but seems buggy
}