# set your path, key, and value for get-property
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa'
$Name = 'LmCompatibilityLevel'
$Value = '5'
#output and get-property statement
$write = 'NTLM Version 2 Already Set'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue)
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

# set your path, key, and value for get-property
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$Name = 'RestrictSendingNTLMToDC'
$Value = '2'
#output and get-property statement
$write = 'NTLM Traffic Send to DC Restrictions Set'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue1 ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$Name = 'RestrictSendingNTLMToDC'
$Value = '2'
	if ($Property -eq 2) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue1

# set your path, key, and value for get-property
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$Name = 'RestrictReceivingNTLMTraffic'
$Value = '2'
#output and get-property statement
$write = 'NTLM Traffic Recieving Restrictions Set'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue2 ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$Name = 'RestrictReceivingNTLMTraffic'
$Value = '2'
	if ($Property -eq 2) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue2

# set your path, key, and value for get-property
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$Name = 'RestrictSendingNTLMTraffic'
$Value = '2'
#output and get-property statement
$write = 'NTLM Traffic Sending Restrictions Set'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue3 ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0'
$Name = 'RestrictSendingNTLMTraffic'
$Value = '2'
	if ($Property -eq 2) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue3

# set your path, key, and value for get-property
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters'
$Name = 'RestrictNTLMInDomain'
$Value = '7'
#output and get-property statement
$write = 'NTLM Traffic Sending Restrictions Set'
$Property = (Get-ItemPropertyValue -Path $RegistryPath -Name $Name -ErrorAction SilentlyContinue)
#Function to check the value you are looking For and enter if absent
Function Test-RegistryValue4 ($RegsitryPath, $Name, $Value) {
$RegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters'
$Name = 'RestrictNTLMInDomain'
$Value = '7'
	if ($Property -eq 7) {
		Write-Output "$write"
		}
	else {
		New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force
	}
}
#run the funciton
Test-RegistryValue4
