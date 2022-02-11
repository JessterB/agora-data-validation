# agora-data-validation
The agora-data-validation project provides a framework for validating the integrity and consistency of Agora's data files across versions.

## Features

The framework allows you to:

* Quickly compare two versions of a file to detect changes in:
  * Entity counts
  * Number of columns
  * Column names
* Validate data against rules to detect missing or unexpected values
* Investigate validation failures
* Generate file-specific validation reports


## Caveats

The framework attempts to handle comparing and validating in as generic a way as possible to minimize the amount of code required for each test class. However, this means that there are some variables with non-unique names across test classes. 

When switching between test classes, ensure that you execute the "Validation run metadata" chunk to properly set the variables for your current file before attempting to compare/validate. If you forget this, you will see unexpected results.


## First time setup

Ensure that your synapse PAT or login credentials are available to the synapser client; see https://r-docs.synapse.org/articles/manageSynapseCredentials.html

## Comparing, validating, analyzing and reporting on an already supported file

The project's /src/validate directory contains an R notebook for each of the 10 Agora data files.

### Compare and validate
To compare and validate a version of one of these files against another version of the same file:
1. Open the appropriate R Notebook in src/validate
2. Update the "Valdiation run metadata" section with the synIds of the files you want to compare
3. Run the Notebook and analyze the results

Note that the validation rules are applied only to the 'new' file.

### Analyze
To analyze the validation results:
- Examine the 'fails' column of the results for any non-0 values
- Examine the 'errors' column for any TRUE values
- There may be multiple pages of validation results to review

See the 'Investigations' section for tips on how to analyze validation failures. 

See the 'Rule debugging' section for tips on debugging rule errors.

### Report
Once you are happy with the results displayed in your Notebook, you can generate an HTML version to share and archive.

File > Knit Document

Examine the generated HTML page, make any tweaks to the Notebook that you want, and save your Notebook to see the HTML update.

Move the final version of your report into a meaningfully named folder in src/archive for posterity.

### Tips
Make sure to rerun the variable section when switching between Notebooks to reset old_name and new_name to the expected values.

## Adding support for a new file

This section describes how to set up the framework to compare and validate files. 
Note that you must set up the comparison as described before you can validate.

Compare
1. Add a new R Notebook to src/validation
2. Copy the contents of src/validate/test_template.Rmd into your new validation file
3. Give your test file a meaningful title
4. Fill in the file-specific metadata values in the "Validation run metadata" section
5. Run the first four chunks of R code to see your comparison!
6. Save your validation file as '<name>_test.Rmd'

If the file you are trying to validate includes nested objects, check out `gene_info_test.Rmd` for an example of how to compare and validate subobject fields.

Validate
1. Add a new R Script to src/rules
2. Copy the contents of src/rules/rules_template.R into your new rules file
3. Replace the NAMEHERE text with the same 'name' value you used in your file-specific metadata above
4. Author your column-specific validation rules; for more information, see the existing rules files and https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html
5. Save your rules file as 'rules_<name>.R'
6. Update the 5th chunk of your R Notebook to reference your new rules file (..../rules_REPLACEME.R). 
7. Execute the rules by running the 'Validated new file against rules' (fifth) chunk of R code in the Notebook
8. Examine the 'errors' column for any TRUE values

See the Rule debugging section for tips on debugging rule errors.

## Investigations

- Use the templated code in the Investigations section to get detailed information about a rule's failure cases
- Write your own exploratory code to better understand what is happening as required
- See the existing Investigations in src/validate and/or src/archive for inspiration and suggested formatting

## Rule authoring & debugging
https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html
https://www.markvanderloo.eu/yaRb/2016/03/25/easy-data-validation-with-the-validate-package/ (see comments)

Uncommenting these lines in src/utils.R's test() function to output warning and error info in the Notebook:
* print(warnings(out))
* print(errors(out))

### Frequently encountered cryptic errors:
* Error in .identC(class(slotVal), slotClass) : argument "slotVal" is missing, with no default
-> You have a trailing comma at the end of your last rule
