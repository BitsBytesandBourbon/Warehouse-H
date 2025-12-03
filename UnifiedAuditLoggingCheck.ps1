#Install the Latest EXOPowerShell Module
Write-Output "Unisntalling Existing Versions of Exchange Online Management"
Start-Job -Name Unistall -ScriptBlock { Uninstall-Module ExchangeOnlineManagement -AllVersions -Force }
Wait-Job -Name Unistall
Write-Output "Exchange Online Management Uninstalled"

Write-Output "Installing Latest Version of Exchange Online Management"
Start-Job -Name Install -ScriptBlock { Install-Module -Name ExchangeOnlineManagement -Force }
Wait-Job -Name Install
Write-Output "Exchange Online Management Installed"

#enter the UPN for the tenant you are acccessig
Write-Output "Logging In"
Connect-ExchangeOnline -UserPrincipalName sk2715@decryptedtech.com -ShowBanner:$false
#function to check to see if Unified Audit Logging is enabled and to enable it if not
Function Check_UnifiedLogging ($AuditlogState) {
	Write-Output "Checking Unified Log Status"
$AuditlogState = (Get-AdminAuditLogConfig).UnifiedAuditLogIngestionEnabled
	If ($AuditlogState -eq "True") {
		Write-Output 'Congrats, you have unified Audit Logs already Enabeld'	
		}
	else {
		Write-Output "Enabling Unified Audit Logs"
		Set-AdminAuditLogConfig -UnifiedAuditLogIngestionEnabled:$true
		Write-Output "Checking status"
		Start-Sleep -Seconds 5
		$NewAuditlogState = (Get-AdminAuditLogConfig).UnifiedAuditLogIngestionEnabled
		If ($NewAuditlogState -eq "True") {
		Write-Output "Unified Audit Logs Enabled"
	}
	else {
		Write-Output "Something Went Wrong Try Again"
	}
}
}
#run the function
Check_UnifiedLogging
