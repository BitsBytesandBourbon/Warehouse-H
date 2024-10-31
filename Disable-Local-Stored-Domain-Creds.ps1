# set your path, key, and value here for the propery grab
$RegistryPath = 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa'
$Name = 'DisableDomainCreds'
$Value = '1'
#output and property vairable setting
$write = 'Already Set Properly'
$Property = (Get-ItemProperty -Path $RegistryPath -Name $Name)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\'
$Name = 'DisableDomainCreds'
$Value = '1'
	if ($null -ne $Property) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue
