# TODO: 
# - write html files into /archive
# - 

# Install and/or load the required packages
prepare <- function() {
    if (!require("synapser")) { install.packages("synapser", repos = c("http://ran.synapse.org", "http://cran.fhcrc.org")) }
    if (!require("jsonlite")) { install.packages("jsonlite") }
    if (!require("tidyverse")) { install.packages("tidyverse") }
    if (!require("deplyr")) { install.packages("dplyr") }
    if (!require("sqldf")) { install.packages("sqldf") }
    if (!require("validate")) { install.packages("validate") }
    if (!require("arrow")) { install.packages("arrow") } 
    if (!require("arsenal")) { install.packages("arsenal") }
    if (!require("testit")) { install.packages("testit") }
    library(synapser)
    library(jsonlite)
    library(tidyverse)
    library(dplyr)
    library(sqldf)
    library(validate)
    library(arrow)
    library(arsenal)
    library(testit)
    synLogin()
  }

# Downloads the specified pair of files from Synapse & makes them available 
# globally as dataframes named 'name_old' and 'name_new'
# - old_synId  SynapseId of the older version of the file
# - new_synId  SynapseId of the newer version of the file
# - name   Name prefix for the resulting global dataframes
# - type - The type of file being downloaded: json, csv, tsv, or f [see the comment in prepare() above to use feather]
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

# Downloads the specified file from Synapse and parses the contents into a dataframe
# - synId  SynapseId of the file
# - name   The name to use for the dataframe
# - quiet  Whether to print debug information

download_file <- function(synId, df_name, type = 'json', quiet = TRUE) {
  
  if(!quiet) {
    cat(paste0("Downloading ", synId, "..."))
  }
  
  id_parts <- strsplit(synId, '.', fixed = TRUE)
  
  version_value <- id_parts[[1]][2]
  
  if (is.na(version_value)) {
    version_value <- NULL
  } 

  if (type == 'table') { 
    # TODO figure out how to download specific table version
    #sel_statement <- paste("SELECT * FROM", id_parts[[1]][1], version = version_value, collapse=" ")
    sel_statement <- paste("SELECT * FROM", synId, collapse=" ")
    print(sel_statement)
    file <- synTableQuery(sel_statement, resultsAs='csv')
    path <- file$filepath
  } else {
    file <- synGet(id_parts[[1]][1], version = version_value, downloadLocation = "files/", ifcollision='overwrite.local')
    path <- file$path
  }

  
  # TODO are there other metadata values worth printing out here?
  cat("\nDownload on:  ", date())
  cat("\n", synId, "\n- Modified on ", file$properties$modifiedOn, "\n- Version ", file$properties$versionNumber)
  cat("\npath: ", file$path, "\n")

  if (type == 'f') { 
    data <- read_feather(path)
    } else {
    if (type == 'json') { data <- fromJSON(path) }
    if (type == 'csv' || type == 'table') { data <- read.csv(path) }
    if (type == 'tsv') { data <- read.csv(path, sep = "\t") }
    if (type == 'rda') { data <- load(path)}
    if (type == 'rds') {data <- readRDS(path)}
    df_name <- as.data.frame(data) 
  }
}


# Compares the specified pair of files
# - old   The first file's name
# - new   The second file's name
# - name  Friendly name for the pair of files being compared, e.g. gene_info
# - summarize  Whether to print out a summary() for each file

# TODO compare list columns

compare <- function(old, new, name, sort_by_ensg=FALSE) {
  if (sort_by_ensg) {
    # sometimes it's helpful to sort rows by ensg to ensure consistent order for comparison
    old <- old %>% arrange(sort_by_ensg)
    new <- new %>% arrange(sort_by_ensg)
  }

  identical <- identical(old, new) # base R check
  cat("is identical:", identical, "\n")
  
  equal <- all.equal(old, new) # deplyr check
  cat("is equal (1.5e-8 tolerance):", equal, sep="\n")
  
  cat("\nNumber of Records \n- old: ", nrow(old), "\n- new: ", nrow(new), "\n- change: ", nrow(new) - nrow(old), "\n")
  cat("\n\nNumber of Columns \n- old :", ncol(old), "\n- new: ", ncol(new), "\n- change: ", ncol(new) - ncol(old), "\n\n")

  old_cols <- colnames(old)
  new_cols <- colnames(new)
  
  cat("Columns dropped: ", setdiff(old_cols,new_cols), sep="\n- ")
  cat("\nColumns added: ", setdiff(new_cols,old_cols), sep="\n- ")
}

# Compares the specified subobject in the specified pair of files
# - old   The first file's name
# - new   The second file's name
# - subname_old  The key of the subobject in the old file
# - subname_new The key of the subobject in the new file, if different from the key in the old file

#compare_subobjects <- function(old, new, subname_old, subname_new = subname_old) {

#  old_subobj <- old[[subname_old]]
#  new_subobj <- new[[subname_new]]
  
  # Find a row in the dataframe where the subobject exists

#  for (i in 1:length(old_subobj)) {
#    if (class(old_subobj[[i]]) == "data.frame") {
#      idx_old <- i
#      break
#    }
#  }
  
  # TODO update this to try to pull the same gene's subobject for better comparison
  
#  for (j in 1:length(new_subobj)) {
#    if (class(new_subobj[[j]]) == "data.frame") {
#      idx_new <- j
#      break
#    }
#  }

#  colnames_old <- colnames(old_subobj[[idx_old]])
#  colnames_new <- colnames(new_subobj[[idx_new]])
  
#  cat("is identical:", identical(old_subobj, new_subobj), sep="\n- ")
#  cat("is equal:",   all.equal(old_subobj, new_subobj), sep="\n- ")
#  cat("Columns dropped: ", setdiff(colnames_old,colnames_new), sep="\n- ")
#  cat("Columns added: ", setdiff(colnames_new,colnames_old), sep="\n- ")
#}

# Compares one instance of the specified subobject from the specified pair of files
# - old   The first file's name
# - new   The second file's name
# - key_field The key of a unique identifier that can be used to field the same subobject in both files
# - subname_old  The key of the subobject in the old file
# - subname_new The key of the subobject in the new file; defaults to subname_old
# TODO: test more than one subobject 
compare_subobjects <- function(old, new, key_field, subname_old, subname_new = subname_old, n=10) {
  
  old_subobjs <- old[[subname_old]]
  new_subobjs <- new[[subname_new]]
  
  # Find the unique identifier of a row in the old dataframe where the subobject exists
  for (i in 1:length(old_subobjs)) {
    if (class(old_subobjs[[i]]) == "data.frame") {
      
      # capture the unique id for the subobject
      key <- old[i,][,key_field]
      
      # find the index of the row with the matching key in the new dataframe
      new_objs <- new[, key_field] ## TODO this just gives me ensg col
      idx_new <- which(new_objs == key)
      
      # compare the old and new subobjects
      old_subobj <- old_subobjs[[i]]
      new_subobj <- new_subobjs[[idx_new]]
      
      colnames_old <- colnames(old_subobj)
      colnames_new <- colnames(new_subobj)
      
      print(paste("Comparing populated new", subname_new, "object to populated old", subname_old, "object with matching", key_field, "values:", key))
      cat("\n\nis identical: ", identical(old_subobj, new_subobj), sep="\n- ")
      cat("\nis equal: ",   all.equal(old_subobj, new_subobj), sep="\n- ")
      cat("\nColumns dropped: ", setdiff(colnames_old,colnames_new), sep="\n- ")
      cat("\nColumns added: ", setdiff(colnames_new,colnames_old), sep="\n- ")

      break
    }
  }
}

# Prints out a summary information about a dataframe
# - dataframe  The dataframe to summarize
# - name       Friendly name for the dataframe

summarize <- function(dataframe, name) {
  cat("\n\nSummary ", name, "\n")
  summary(dataframe)
}


# Applies the specified set of rules to the specified dataframe for validation
# - dataframe  The dataframe to validate
# - rules      The rules to apply

test <- function(df, rules) {
  out <- confront(df, rules)
  #print(warnings(out)) # uncomment to debug rule warnings
  print(errors(out))  # uncomment to debug rule errors
  print(summary(out))
  #plot(out)   # this is interesting but seems buggy
}

# Extracts the specified nested dataframe from the specified parent dataframe and 
# applies the specified set of rules to that extracted dataframe for validation
# - dataframe  The dataframe to validate
# - subname    The name of the nested object
# - rules      The rules to apply
test_subobject <- function(df, subname, rules) {
  
  subdf <- get_subobject(df, subname)
  
  out <- confront(subdf, rules)
  print(errors(out))  # uncomment to debug rule errors
  print(summary(out))
}

# Extracts the specified nested dataframe from the specified parent dataframe 
# - dataframe  The dataframe to validate
# - subname    The name of the nested object
get_subobject <- function(df, subname) {
  sublist <- df[[subname]]
  bind_rows(sublist)
}

# Replace NULL inner lists with NA
# - x - the list to operate on
replace_null <-  function(x) {
  lapply(x, function(x) {
    if (is.list(x)){
      replace_null(x)
    } else{
      if(is.null(x)) NA else(x)
    } 
  })
}