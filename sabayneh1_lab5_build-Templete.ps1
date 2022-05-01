<#

   Script Name: Build-Template.ps1
   Author: ## Samander Abayneh ##
   LastDateModified: ## Februray 2, 2019 ##

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

# Error checking if no arguments for Directory Name
if ("$DirectoryName" -eq "") {
   Write-Warning "A VALID directory name is Required"
   $DirectoryName = Read-Host "Please enter a VALID target directory pathname"
   while($DirectoryName -eq "") {
       Write-warning "That directory pathname is NULL"
       $DirectoryName = Read-Host "Please enter a VALID target directory pathname"
   } 
} 

# Test if $DirectoryName variable is valid
while ((Test-Path $DirectoryName)) {
    Write-warning "The directory name already exists"
    $DirectoryName = Read-Host "Please enter a new directory"
}

## Move to the target directory
   ## use a cmdlet to change to the target directory (use appropriate variable)
 $LocGo = Set-Location $WorkingDirectory

## Create the new subdirectory
   ## use a cmdlet to create the new directory (use -name and -itemtype dir  
   ## parameters with cmdlet) and pipe to Out-Null cmdlet 

$LocGo | New-Item -name $DirectoryName -ItemType -directory | Out-Null

## Cycle through the folder names in $SubDirectoryNames to create 
## subfolders using a foreach loop
   ## Enter foreach loop here with appropriate variables and for list
   ## to create subdirectories each time in that newly created directory
   ## Hint: for cmdlet, use -name, -path (for newly-create directory)
   ## and -itemtype parameters with cmdlet. Again, pipe to out-null

foreach ( $name in $SubDirectoryNames) {
    New-Item -name $name -Path $WorkingDirectory\$DirectoryName -ItemType directory | Out-Null
} 

## Verify Directories created by listing the new Directory name
  ## Display in console and store in log file (overwriting previous contents the
  ## message: The directory pathname (display full pathname using variables)
  ## has been created
  
  ## Display in console and store in log file contents of new directory 
  Get-ChildItem $DirectoryName | Tee-Object $DirectoryName\logfilecontents.log

write-host "$WorkingDirectory\$DirectoryName now exists along with a .log file of the contents of the $DirectoryName"
