# datascience_3_project: Course project for "Getting and Cleaning Data"

## Introduction

This repository provides an R script to produce a summary table giving mean values for each unique (subject, activity, variable) triplet across both "test" and "train" subsets in the "Human Activity Recognition Using Smartphones" data set available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Contents
The contents of this repository are:

#### run_analysis.R
> Source R to generate a data file giving the mean values for each (subject, activity, variable) triplet across both "test" and "train" data sets.

#### CodeBook.md
> Code book giving the meanings of the variables and values in the resulting data file, and the procedures that generated the file.

## Generating summary table

### Prerequisites

* Install RStudio 0.99.441.
* Ensure that the following R libraries are available in the RStudio installation:
  * <tt>stringr</tt>
  * <tt>plyr</tt>
  * <tt>dplyr</tt>
  * <tt>reshape2</tt>
* Download and unzip the "Human Activity Recognition Using Smartphones" data set at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Download <tt>run_analysis.R</tt> from this repository 

### Generating the table

* Start RStudio.
* Set RStudio's  working directory to the "UCI HAR Dataset" directory unzipped from the "Human Activity Recognition Using Smartphones" data set, using the <tt>setwd()</tt> command.
* <tt>Code->Source File...</tt>, selecting the file <tt>run_analysis.R</tt> 

### Locating the results

The resulting summary file <tt>result.txt</tt> will be found in the current R working directory, i.e., the "UCI HAR Dataset" directory unzipped from the "Human Activity Recognition Using Smartphones" data set.

### Interpreting the results

Please see the file CodeBook.md in this repository for result.txt's data dictionary.
