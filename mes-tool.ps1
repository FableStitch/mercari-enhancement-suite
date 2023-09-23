Write-Host ""
Write-Host Removing old version of MES

Remove-Item mercari-enhancement-suite-* -Recurse

$repo = "fablestitch/mercari-enhancement-suite"
$file = "mercari-enhancement-suite-"

Write-Host ""
Write-Host Getting latest tag from $repo
$tag=(Invoke-WebRequest -Uri "https://api.github.com/repos/fablestitch/mercari-enhancement-suite/releases" -UseBasicParsing | ConvertFrom-Json)[0].tag_name


$file = $file + $tag.Split("v")[1] + ".zip"
$download = "https://github.com/$repo/releases/download/$tag/$file"
Write-Host ""
Write-Host Downloading version $tag of MES


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
curl.exe -sLO $download

Write-Host ""
Write-Host Extracting release files
Expand-Archive $file -Force


Write-Host ""
Write-Host DONE