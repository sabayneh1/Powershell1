<# 
.SYNOPSIS
This script is used to create an unattended install of ADDS. 

.DESCRIPTION
This script contains a function that will NOT accept any parameters,
but will automatically perform all the tasks required to setup
Windows Active Directory / Directory Service reading data from an
"answer file". 

Make certain to first dot-source before calling this function by issuing:
. . \sabayneh1_Lab8_ADinstall.ps1   # use YOUR SenecaID   

.EXAMPLE
New-Domain 

.NOTES
Author: Samander Abayneh
DateLastModified: 3/28/2019

#>  
#Create the function called New-Domain with not parameter
Function New-Domain() { 

#Import the Server Manager Module
Import-Module Servermanager 

#Use the Install-WindowsFeature Cmdlet of Server Manager to add a New Domain Controller
Install-WindowsFeature AD-Domain-Services

#Create a variable called $Unattend to store the pathname to the unattend File contents
$Unattend = "C:\unattend.txt"

#Create variable called $Contents (using the "Here" string) to store the Unattend file contents
$contents= @" 
[DCInstall] 
     ReplicaOrNewDomain=Domain
     NewDomain=Forest
     NewDomainDNSName= sabayneh1.loc
     ForestLevel=4
     DomainNetbiosName= sabayneh1
     DomainLevel=4
     InstallDNS=Yes
     ConfirmGc=Yes
     CreateDNSDelegation=No
     DatabasePath=C:\Windows\NTDS
     LogPath=C:\Windows\NTDS
     SYSVOLPath=C:\Windows\SYSVOL
     SafeModeAdminPassword="P@ssw0rd"
     RebootOnCompletion=Yes
"@   

#Pipe the $contents variable to out-file to create the unattend file (suppress command output)
$contents | Out-File $Unattend

#Create a variable called $dcpromo with the unattend text file pathname
$dcpromo = "dcpromo /unattend:$Unattend" 

#Use invoke-expression to pass the $dcpromo variable value and suppress all command output
Invoke-Expression -Command $dcpromo 

}
  

