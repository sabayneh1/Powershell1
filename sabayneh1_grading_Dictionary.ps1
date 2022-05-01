<#
  .Synopsis
     Converts arrays to a hash table
  .Descrition
     Converts the "Names" array and "Message array to a dictionary
  .EXAMPLE 
    Murray Saul = Unsatisfactory 
    Amy Ng = Excellent 
  .NOTES 
     Aurhor: Samander Abayneh
     Date: 1/3/2019
#> 

Clear-Host
Write-Host "
========================
    Grade Dictionary 
========================" 

$Global:temp = @()
$Global:Hash=@{}

for($i=0; $i -lt $global:names.count; $i++)
{
$Global:temp += $global:names[$i]+"="+$global:messages[$i]
}

$Global:Hash = $Global:temp | Out-String | ConvertFrom-StringData

$Global:Hash | Tee-Object .\scores.txt