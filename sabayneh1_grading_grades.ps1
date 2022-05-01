<#
  .Synopsis
     Store student grades in an array 
  .Descrition
     Use read-host to prompt the user to enter grade
     after the student name and add to the array called grades
  .EXAMPLE
     Enter student grade for [student name in array]: 80
  .NOTES
     Aurhor: samander Abayneh
     Date: 1/3/2019
#> 
$UserResponse = "Y"
$Global:Grades = @()

Clear-Host
Write-host " 
==========================
        Student Grades
==========================" 
while ($UserResponse -ne "N")
{foreach ($n in $names){
$mark = Read-Host "Enter the Student grade $n "
$Global:grades += $mark
$UserResponse = Read-Host "Enter another grade [Y/N]"
}}PAUSE
