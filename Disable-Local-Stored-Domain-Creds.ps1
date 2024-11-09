# set your path, key, and value here
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\'
$Name = 'DisableDomainCreds'
$Value = '1'
#output and value check statements
$write = 'Already Set Properly'
$ErrorActionPreference = "silentlycontinue"
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\'
$Name = 'DisableDomainCreds'
$Value = '1'
	if ($Property -eq 1) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue
