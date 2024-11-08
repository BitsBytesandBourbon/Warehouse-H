# set your path, key, and value here
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\'
$Name = 'LocalDumps'
#output and value check statements
$write = 'Key Does Not Exist'
$Property = (Get-ItemProperty -Path $RegistryPath -Name $Name -ErrorAction Ignore)
#Function to check the value you are looking For and enter if absent
$RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting\'
$Name = 'LocalDumps'
Function Test-RegistryValue ($RegsitryPath, $Name) {
	if ($Property -Like '*LocalDumps*') {
		Remove-ItemProperty -Path $RegistryPath -Name 'LocalDumps'
		}
	else {
		Write-Output $write
	}
}
#run the funciton
Test-RegistryValue
