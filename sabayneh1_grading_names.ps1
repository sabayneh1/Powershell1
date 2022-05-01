<#
  .Synopsis
     Store student names in an array 
  .Descrition
     Use read-host to prompt and add student name into an array
  .EXAMPLE
     Enter student full name [samander abayneh] :
  .NOTES
     Aurhor: Samander Abayneh
     Date: 1/3/2019
#>

$userResponse = "y"
$Global:Names = @()

clear-host 
write-host "
==========================
        Student Names
=========================="


while ($UserResponse -ne "N")
{
$student = Read-Host "Enter the Student Name [eg jane doe]"
$Global:Names += "$student"
$userResponse = Read-Host "Enter another name [Y/N]"
}PAUSE

