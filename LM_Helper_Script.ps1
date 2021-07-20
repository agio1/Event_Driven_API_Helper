[CmdletBinding()]
    Param(
      [Parameter(Mandatory=$true)]
      [string] $git_url,
      [Parameter(Mandatory=$true)]
      [string] $PAT,
      [Parameter(Mandatory=$true)]
      [string] $script_name

    )

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$token = ("token " + $PAT)

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Authorization","$token")
$headers.Add("Accept","application/vnd.github.v3.raw")

$httpVerb = "GET"
$path = "C:\temp\$script_name"
$download_url = $git_url
$response = wget -Uri $download_url -Method $httpVerb -Header $headers -OutFile $path
Write-output "File should be saved as $path"
