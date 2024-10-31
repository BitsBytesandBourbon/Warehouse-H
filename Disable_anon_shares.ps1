# set your path, key, and value for Get-ItemPropertyValue call
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\'
$Name = 'RestrictAnonymous'
$Value = '1'
#output and Get-ItemProperty
$write = 'Anonymous Shares are Already Disabled'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\'
$Name = 'RestrictAnonymous'
$Value = '1'
	if ($Property -eq 1) {
		Write-Host "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
