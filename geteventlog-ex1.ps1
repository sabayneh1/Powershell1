<#

   Purpose: To Prompt the user for number of lines of recent eventlog entries
            and save the content in a file called ServerEvents.txt in the
            user's current directory

   Author:  Murray Saul

   LastDateModified: December 23, 2018

#>

# Clear the screen
clear-host

# Prompt the user for the number of recent entries

$recentEntryNumber = read-host "Please enter the number of recent entries to diplay"

# Save recent log entries to a text file

get-eventlog system  -newest $recentEntryNumber | Out-file ‘.\Server01Events.txt’

# Indicate results saved in appropriate filename

write-host "Your System Log Events are saved in file pathname: `"$HOME\Server01Events.txt`""
