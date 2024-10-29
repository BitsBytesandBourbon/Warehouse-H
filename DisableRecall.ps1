$RecallVersionCheck = (Get-ComputerInfo -Property "OSDisplayVersion").OSDisplayVersion
If ($RecallVersionCheck -match '^(2[4-9]|[3-9]\d)H[1-2]$')
{
If ((Get-WindowsOptionalFeature -Online -FeatureName Recall).State -eq "Enabled")
{
Write-Host "Recall Enabled - Disabling Recall"
Disable-WindowsOptionalFeature -Online -FeatureName Recall
}else{Write-Host "Recall Already Disabled"
}
}else{Write-Host "Version Wrong For Recall Feature"
}
