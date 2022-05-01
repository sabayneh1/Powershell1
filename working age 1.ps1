[int]$userage = Read-Host "enter your age"

if ($userage -ge 65) {write congruatulation you can retire"
}
elseif ($userage -ge 15 -AND $userage -lt 65) {write-host "you are too young to retire, back to work ..." }

else { write-host "you are too young to retire, back to work ..." }

elseif ($userage -le 15) {write-host "you are too young to work come when you are over 15"
      