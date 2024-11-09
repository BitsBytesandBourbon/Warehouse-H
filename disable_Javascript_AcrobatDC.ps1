# set your path, key, and value here
$RegistryPath = 'HKLM:SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\'
$Name = 'bDisableJavaScript'
$Value = '1'
#output and value check statements
$write = 'JavaScript is Disbaled for Acrobat DC'
$ErrorActionPreference = "silentlycontinue"
$Property = (Get-ItemProperty -Path $RegistryPath -Name $Name -ErrorAction silentlycontinue)
$Property1 = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name -ErrorAction silentlycontinue)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\'
$Name = 'bDisableJavaScript'
$Value = '1'
	if (($Property -like '*bDisableJavaScript*') -and ($Property1 -match '^1$')) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue
