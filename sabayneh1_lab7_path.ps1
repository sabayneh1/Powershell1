$files =get-childitem -path C:\Users\Administrator\Documents\* | Resolve-Path

foreach($input in $files){
$temp = $input.ToString()
$split = $temp.split("\")
$split[3]= "sabayneh1"
$split -join "\"

}
write-host $files