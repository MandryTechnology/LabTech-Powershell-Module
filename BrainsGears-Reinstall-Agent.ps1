[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/Braingears/PowerShell/master/Automate-Module.psm1');
$server = 'support.mandrytechnology.com'
$token = 'c3d6126258255ea5f5beb09b6382e4d5'

Confirm-Automate

If ($Automate.LocationID) {
	$location = $Automate.LocationID
}
else {
	$location = '1'
}

Install-Automate -Server $server -LocationID $location -Token $token -Transcript
