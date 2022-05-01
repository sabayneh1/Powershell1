<#
Name = Samander Abayneh
Date = 3-13-2019 
purpose = Merging databases involve the process of importing multiple database files and manipulating strings 
(joining or combining strings) in order to create database files that contain fields for the same records, but from other related databases. 

 
 # 
#>

$csv4 = @()
$csv1 = Get-Content C:\Users\Administrator\Documents\Usersf.csv
$csv2 = Get-Content C:\Users\Administrator\Documents\Usersl.csv
$csv3 = Get-Content C:\Users\Administrator\Documents\emailNormalized.csv
$csvFile = import-Csv C:\Users\Administrator\Documents\lab7_db1.csv

for($i=0; $i -lt $csvfile.count; $i++)
{
$csv4 += $csv1[$i]+"="+$csv2[$i]+"="+$csv3[$i]
}

$csv4 | Tee-Object .\merged.csv