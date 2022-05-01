<#
Author: Samander Abayneh
Date: 3/29/2019
Purpose: Bulk installation of users in Active Directory from the given CSV File
#> 

Function New-BulkUser{
$CSVPath = "C:\Users\Administrator\Documents\Lab9_NewADUsers.csv"

#Create NewPassword Variable to hold the Encrypted Password
##########################################################
$NewPassword = (ConvertTo-SecureString "Ch@ngMe2" -AsPlainText -force)  

if((Test-Path $CSVPath) -eq $false )
{
Write-Host "File Not Found"
pause;exit} 

if ((Get-Content $CSVPath).count -eq 0){ 
Write-Host "File Is Empty"
pause;
exit} 

$User = Import-CSV "C:\Users\Administrator\Documents\Lab9_NewADUsers.csv"

$User | ForEach-Object {
#Create AD Variables to hold Data

$SamAccountName = $_.SamAccountName
$Name = $_.Name
$FirstName = $_.FirstName
$LastName = $_.LastName
$DisplayName = $_.DisplayName
$Title = $_.Title
$UserPrincipalName = $_.userPrincipalName
$Email = $_.Email
$EmployeeID = $_.EmployeeID
$Enabled = $true
$ChangePasswordAtLogon = $false
$PasswordNeverEpires = $true
$AccountPassword = $NewPassword


New-ADUser -SamAccountName $SamAccountName `
-Name $Name `
-GivenName $FirstName `
-Surname $LastName `
-DisplayName $DisplayName `
-Title $Title `
-UserPrincipalName $UserPrincipalName `
-EmailAddress $Email `
-EmployeeID $EmployeeID `
-Enabled $Enabled `
-ChangePasswordAtLogon $false `
-PasswordNeverExpires $PasswordNeverEpires `
-AccountPassword $AccountPassword `
-PassThru


}
}