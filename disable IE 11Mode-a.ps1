# set your path, key, and value for get-property
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Edge'
$Name = 'InternetExplorerIntegrationLevel'
$Value = '2'
#output and get-property statement
$write = 'IE 11 Mode is Already Disabled'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Edge'
$Name = 'InternetExplorerIntegrationLevel'
$Value = '2'
	if ($Property -eq 2) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue
