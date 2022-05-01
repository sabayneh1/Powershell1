<#
 Author: Samander Abayneh
 Date: February 2, 2019
 Purpose: To create a log file that have infromation about woindsos servr mode, size and hard disk and display in web browser.
 
#>

### Pathnames specified need to be created prior to running script!!! ###

$WebFilePath = "$HOME\Documents\Win213\Lab4\YourSenecaID_Lab4_report.html" 

### Create variables for Disk bios, an instad product ###
### Create log file and output log file title ###

$Date = "Get-Date"
$DiskInfo = Get-CimInstance cim_diskdrive | Select-Object -Property model, size
$BIOSInfo = Get-CimInstance CIM_BIOSElement 
$InstaldProductsInfo = Get-CimInstance cim_product 

### Generate first part of web-page document ###
Write-Output "
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 <html>
   <head><style>body{background-color:peachpuff;}</style></head>
   <body>
      <h1>PowerShell Scripted Web Page</h1>
      <pre>

" > $WebFilePath 


### Create Log file and output Log File Title with Computer Name
### and Date of Report

Write-Output "Summary Information for computer $env:COMPUTERNAME on $date" | Out-file -FilePath "$WebFilePath" -append  

  
Write-Output "------------------------------------------------------------------------ " | Out-file -FilePath "$WebFilePath" -append 

### Create a Disk Drive Summary Header, Get Disk Information and Output
### to log file ###

Write-Output "`n`n"| Out-File  "$WebFilePath" -append
Write-Output "Disk Drive Summary" |Out-file "$WebFilePath" -append
Write-Output "====================================" | Out-file "$WebFilePath"  -append

Write-Output $DiskInfo | Out-file "$WebFilePath"  -append 
 
### Create a bios Summary Header, Get Disk Information and Output
### to log file ###

Write-Output "`n`n"| Out-File  "$WebFilePath" -append
Write-Output "bios Summary" |Out-file "$WebFilePath" -append
Write-Output "====================================" | Out-file "$WebFilePath"  -append

Write-Output $BIOSInfo | Out-file "$WebFilePath"  -append 

### Create a application Summary Header, Get Disk Information and Output
### to log file ###

Write-Output "`n`n"| Out-File  "$WebFilePath" -append
Write-Output "Application Summary" |Out-file "$WebFilePath" -append
Write-Output "====================================" | Out-file "$WebFilePath"  -append

Write-Output $InstaldProductsInfo | Out-file "$WebFilePath"  -append 


### Display ON SCREEN a Message Log File Created ###

Write-Output "`n`nLog File Saved as:  $WebFilePath" 


