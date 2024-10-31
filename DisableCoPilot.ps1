$RegistryPath1 = 'HKCU:\Software\Policies\Microsoft\Windows\'
$Name1 = 'WindowsCopilot'
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue1 ($RegsitryPath1, $Name1) {
$RegistryPath1 = 'HKCU:\Software\Policies\Microsoft\Windows\'
$Name1 = 'WindowsCopilot'
$Property1 = (Get-ItemProperty -Path $RegistryPath1 -Name $Name)
	if ($Property1) {
		New-Item -Path $RegistryPath1 -Name $Name1 -Force	
		
		}
	else {
		Write-Host 'The Key is Already Present'
	}
}
#run funciton1
Test-RegistryValue1
$RegistryPath2 = 'HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot\'
$Name2 = 'TurnOffWindowsCopilot'
$Value2 = '1'
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue2 ($RegsitryPath2, $Name2, $Value2) {
$RegistryPath2 = 'HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot\'
$Name2 = 'TurnOffWindowsCopilot'
$Value2 = '1'
$Property2 = (Get-ItemPropertyValue -Path $RegistryPath2 -Name $Name2)
	if ($Property2 -ne 1) {
		New-ItemProperty -Path $RegistryPath2 -Name $Name2 -Value $Value2 -PropertyType DWORD -Force
		
		}
	else {
		Write-Host 'Copilot is Disabled Already'	
	}
}
#run funciton2 
Test-RegistryValue2
