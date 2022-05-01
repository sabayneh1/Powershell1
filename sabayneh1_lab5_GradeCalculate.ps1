#
 Author: Samander Abayneh
 Date: February 2, 2019
 Purpose: TO check and show student the latter of the grade 

#>

	
[int] $studentGrade = Read-host "Enter a percentage for your course (eg. 75)"
switch ($studentGrade){
  {$studentGrade -ge 80} {$letterGrade = "A";break}
  {$studentGrade -ge 70} {$letterGrade = "B";break}
  {$studentGrade -ge 60} {$letterGrade = "C";break}
  {$studentGrade -ge 50} {$letterGrade = "D";break}
  default {$letterGrade = "F"}
}

Write-host "Your letter grade is: $letterGrade” 



