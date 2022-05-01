
clear-host
#Calculate Sales commission
#Check to see file QI Sales.txt exist
$file1 = "c:\MyScripts"
$file2 = "c:\MyScripts\01Sales .txt" 

if((Test-Path $file2) -eq "true")
{Remove-item $file2 -confirm}

New-item -path $file1 -itemtype file -name Q1Sales.txt # create variable to test if user wants to continue

$userResponse = "Y"
#Loop Until User says No More
 Do{

[string]$name = Read-Host "Enter sales person name uohn Jones]"

[double]$DecSales = Read-Host "Enter total sales for December [75000]'$" 

[double]$JanSales = Read-Host "Enter total sales for January'$"
[double]$FebSales = Read-Host "Enter total sales for February' $" 
[double]$MarSales = Read-Host "Enter total sales for March' $"
$SUM = ($DecSales + $JanSales + $FebSal + $MarSales) 
if($sum -ge 500000)
{$commission = ("{0:C}" -f($sum *.0875))}

elseif($sum -ge 100000 -and $sum -lt 500000)
{$commission = ("{0:C}" -f($sum *.0525))}

else{$commission = ("{0:C}" -f($sum *0))}
Write-output "Name: $name Commission: $commission" I Add-content
$file2

$userResponse = Read-Host "Do you wish to continue [Y/N]"
$name= $null

$DecSales = $null
$JanSales = $null
$FebSales = $null
$MarSales = $null
$commission = $null

} Until($userResponse -eq "N") 

####################################### answer using an array ##############################
#Calculate Sales commission #Check to see file Q1Sales.txt exist

$file1 = "c:\MyScrip ts"
$file2 = "c:\MyScripts\O1Sales.txt" 
if(Test-Path $file2 -eq "true")
{Remove-item $file2 -confirm}

New-item -path $file1 -itemtype file -name Q1Sales.txt
Write-output"####### SALES COMMISSION OF Q1 ######" I Add-Content
$file2

#create variable to test if user wants to continue

$userResponse = "Y"
$name = @()
$sales = @()

$month = @("December","January","February","March") #Loop Until User says No More
