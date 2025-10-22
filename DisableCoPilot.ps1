$user = (Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty Username) 
$sid = (New-Object System.Security.Principal.NTAccount($user)).Translate([System.Security.Principal.SecurityIdentifier]).Value
New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS

#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue1 ($RegsitryPath1, $Name1) {
$RegistryPath1 = "HKU:\$sid\Software\Policies\Microsoft\Windows\WindowsCopilot"
$Name1 = "WindowsCopilot"
$Property1 = (Get-Item -Path $RegistryPath1).PSChildName
	if ( $Property1 -eq $Name1 ) {
		Write-Output 'Key Already Exists'
			
		}
	else {
		New-Item -Path $RegistryPath1 -Name $Name1 -Force
	}
}
#run funciton1
Test-RegistryValue1

#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue2 ($RegsitryPath2, $Name2, $Value2) {
$RegistryPath2 = "HKU:\$sid\Software\Policies\Microsoft\Windows\WindowsCopilot"
$Name2 = "TurnOffWindowsCopilot"
$Value2 = "1"
$Property2 = (Get-ItemPropertyValue -Path $RegistryPath2 -Name $Name2)
	if ($Property2 -ne 1) {
		New-ItemProperty -Path $RegistryPath2 -Name $Name2 -Value $Value2 -PropertyType DWORD -Force
		}
	else {
		Write-Host 'Copilot Already Disabled'	
	}
	Get-AppxPackage *copilot* | Remove-AppxPackage
}
#run funciton2 
Test-RegistryValue2
