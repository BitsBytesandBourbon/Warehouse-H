# set your path, key, and value for get-property
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'
$Name = 'LmCompatibilityLevel'
$Value = '5'
#output and get-property statement
$write = 'NTLM Version 2 Already Set'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'
$Name = 'LmCompatibilityLevel'
$Value = '5'
	if ($Property -eq 5) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue
