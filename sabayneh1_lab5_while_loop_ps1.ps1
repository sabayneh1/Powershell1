
<#
 Author: Samander Abayneh
 Date: February 6, 2019
 Purpose: To create a script that prompts user to give number frome one to ten and if they give wrong number, it will give an error message. 
 
#>


[int]$UserGuess = read-host "pick a number between 1 and 10"
while ($UserGuess -lt 1 -or $UserGuess -gt 10) {
   $UserGuess = read-host "Invalid number: Please re-enter (1 - 10)"
}
write-host "You guessed: $UserGuess" 



