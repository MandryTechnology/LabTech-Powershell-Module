#* Script to reinstall the agent using the BrainGears module
#* Checks if agent is installed, and uses the current LocationID if there already is one.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/MandryTechnology/LabTech-Powershell-Module/master/BrainsGears-Reinstall-Agent.ps1');
$server = 'support.mandrytechnology.com'
$token = 'c3d6126258255ea5f5beb09b6382e4d5'
# Populate the $Automate variable so we can check if there's a LocationID
Confirm-Automate
# If there's a LocationID, use that; otherwise, just put it in the "New Computers" group for later sorting
If ($Automate.LocationID) {
	$location = $Automate.LocationID
}
else {
	$location = '1'
}

# If the agent is already online/checking in, but still needs reinstalled, we'll need to add the -Force switch,
# so this function is added so that you can call it after the invoked web request -- 'iex; ForceReinstall-Agent'
function Install-Agent {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$false)]
		[int]
		$NewLocation,
		[Parameter(Mandatory=$false)]
		[switch]
		$Force
	)
	If ($Force.IsPresent) {
	Install-Automate -Server $server -LocationID $location -Token $token -Transcript -Force
	}
	elseif ($Location.IsPresent) {
		Install-Automate -Server $server -LocationID $NewLocation -Token $token -Transcript
	}
	else {
		Install-Automate -Server $server -LocationID $location -Token $token -Transcript
	}
}
