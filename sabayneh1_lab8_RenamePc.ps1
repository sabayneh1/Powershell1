<# 

.SYNOPSIS 
  This function is used to change the name of Windows server

.DESCRIPTION 
   This function renames the Windows server from the user either by parameter or manual input
   Make certain to first dot-source before calling this function by issuing:
   . . \sabayneh1_Lab8_RenamePC.ps1   # use YOUR SenecaID

.PARAMETER PCName
   Specifies the Name of the Windows server to be changed to

.EXAMPLE 
New-PCName -PCName [newServerName]

.EXAMPLE 
New-PCName 
Enter new PC Name: [newServerName]

.NOTES 
Author: samander Abayneh
DateLastModified: 3/25/2019
#>     
#function to change pcname 
function New-PcName($PCName) {



while ([string]::IsNullOrEmpty($pcname)){$pcname = read-host “Invalid. Please re-enter your new pc name”}

 # Store Win32_ComputerSystem class into the variable called: $ComputerName
 $CN = Get-WMIobject Win32_ComputerSystem name
# Use a pipline to use the Rename() method for $ComputerName to rename the computer
# with the value $PCName and suppress all screen output

 $CN.rename($pcname) | OUT-NULL

 write-host "your new pcname $PCName"

# Display a message indicating that the PC will be renamed, and PC will boot in 10 seconds 
# Pause for 10 seconds 
# Reboot the computer
Start-Sleep -s 10
Restart-Computer -force

  }#end of function to change pcname 

