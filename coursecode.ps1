
clear-host 

$courses = @{“WIN213” = “PowerShell”; “OPS235” = “Linux Administration”; “WIN210” = “Window Administratio"}


$coursecode = Read-Host "enter course code"

if ($courses.keys -contains $coursecode) {

write-host $courses.$coursecode
}
else { 
Write-Host "course code not found"
}