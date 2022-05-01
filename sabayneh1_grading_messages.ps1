<#
  .Synopsis
     Evaluate grades and store a message into an array
  .Descrition
     First tests to see if the stored mark is within he range: 1 - 100.
     If the grade is NOT within the range, a message on the screen will 
     display "Invalid Grade" (is it stored in array as well?)

     If the mark is within the acceptable range, then the following messages
     will be displayed based on their value:

     Greater than 79 - Display Excellent
     Between 67 and 79 - Display Satisfactory
     Less than 67 - Display Unsatisfactory

     .EXAMPLE (not for user to enter or display - what message to add to he Message array)
     Murray Saul - 45 - Unsatisfactory
     Amy Ng - 99 - Excellent
     Mohammed Patel - 76 - Satisfactory
     Betty White - 105 - Invalid Grade

     .NOTES
     Aurhor: samander abayneh 
     Date: 1/3/2019
#> 

$Global:Messages = @()
$Global:Values = 1..100

Clear-Host
$Global:grades | ForEach-Object { 
if ( $Global:values -notcontains $_ ) {$Global:Messages += "Invalid Grade"} 
elseif ($_ -gt $Global:values[79] ) {$Global:Messages += "Excellent"}
elseif ($_ -ge $Global:values[67]) {$Global:Messages += "Satisfactory"} 
else{$Global:Messages += "Unsatisfactory"}

} 
 Write-Host "Grading Comments have been added"