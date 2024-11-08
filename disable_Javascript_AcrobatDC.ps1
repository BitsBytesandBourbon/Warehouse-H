# set your path, key, and value here
$RegistryPath = 'HKLM:SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\'
$Name = 'bDisableJavaScript'
$Value = '1'
#output and value check statements
$write = 'JavaScript is Disbaled for Acrobat DC'
$Property = (Get-ItemPropertyValue -Path $RegistryPath).$Name
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:SOFTWARE\Policies\Adobe\Adobe Acrobat\DC\FeatureLockDown\'
$Name = 'bDisableJavaScript'
$Value = '1'
	if ($Property eq 1) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue
