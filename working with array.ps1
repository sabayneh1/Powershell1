Clear-Host

$temparray = @()
$arrayelemennumber = Read-Host "enter number of array elements ot add"

$x = 1

 do { 
 $temparray += Read-Host "enter array elements $x"
 $x++


 } until ($x -gt $arrayelemennumber)

 write-host "first array element:" $temparray[0]
write-host "second array element:" $temparray[1]
write-host "last array element:"  $temparray[-1]

write-host "here are all the element"


for ($i = 0; $i -lt $temparray.Count; $i++)
{
$temparray[$i]
}

Write-Host "here are all araay elements in reverse order:"
$temparray | Sort-Object -Descending
