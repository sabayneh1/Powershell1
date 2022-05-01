<#

   Script Name: Build-Template.ps1
   Author: ## Samander Abayneh ##
   LastDateModified: ## February 6, 2019 ##

   Purpose: This script takes two arguments:
            - First Argument is an existing target directory pathname
            - Second Argument is a new Directory name 
             (to create in target directory pathname)

            Error checking is performed to check for missing arguments, 
            which will then prompt the user for a target directory pathname,
            and that it exists, and a new directory name to be created 
            in the target directory pathname.

            If target directory and directory name is valid, 
            and there is no existing directory with the same name in
            that target directory, then the script will move to the target 
            directory, and create the new directory and the other subdirectories.

            The script will confirm both on the screen and create a log file
            to confirm that the directory was created.

#> 


# Clear screen
Clear-Host

## Assign $WorkingDirectory and $DirectoryName variables from script arguments
[string]$WorkingDirectory = $args[0]
[string]$DirectoryName = $args[1]

## Assign a logfile pathname to a variable 
$logFileName = "directoryContents.log"

## Assign Subdirectory Names to be created in the $SubDirectoryNames variable 
$SubDirectoryNames = "Lecture Notes", "Labs", "Practice", "Exercise Questions", "Exercise Solutions", "Samples" 

# Error checking if no arguments for Working Directory
if ("$WorkingDirectory" -eq "") {
   Write-Warning "A VALID target directory Pathname is Required"
   $WorkingDirectory = Read-Host "Please enter a VALID target directory pathname"
   while($workingDirectory -eq "") {
       Write-warning "That directory pathname is NULL"
       $WorkingDirectory = Read-Host "Please enter a VALID target directory pathname"
   } 
} 

# Test if $WorkingDirectory variable is valid
while (! (Test-Path $WorkingDirectory)) {
    Write-warning "The target directory pathname does not exist"
    $WorkingDirectory = Read-Host "Please enter an EXISTING target directory"
}  


# Error checking if no arguments for Working Directory
if ("$DirectoryName" -eq "") {
   Write-Warning "A VALID target directory Pathname is Required"
   $DirectoryName = Read-Host "Please enter a VALID target directory pathname"
   while($DirectoryName -eq "") {
       Write-warning "That directory pathname is NULL"
       $DirectoryName = Read-Host "Please enter a VALID target directory pathname"
   } 
} 

# Test if $WorkingDirectory variable is valid
while (! (Test-Path $WorkingDirectory)) {
    Write-warning "The target directory pathname exist"
    $WorkingDirectory = Read-Host "Please enter a new target directory pathname"

