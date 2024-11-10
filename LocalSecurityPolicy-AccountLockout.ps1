secedit /export /cfg $env:TEMP\security.inf
(Get-Content $env:TEMP\security.inf -Raw) -Replace '\bLockoutBadCount\s*=\s*(?:[1-9]|1[1-9])\b','LockoutBadCount = 10' | Set-Content "$env:TEMP\security.inf"
(Get-Content $env:TEMP\security.inf -Raw) -Replace '\bResetLockoutCount\s*=\s*(?:[1-9]|1[0-4]|1[6-9])\b','ResetLockoutCount = 15' | Set-Content "$env:TEMP\security.inf"
(Get-Content $env:TEMP\security.inf -Raw) -Replace '\bLockoutDuration\s=\s*(?:[1-9]|1[0-4]|[2-9]\d|1[6-9])\b','LockoutDuration = 15' | Set-Content "$env:TEMP\security.inf"
secedit /import /cfg "$env:TEMP\security.inf" /db "c:\windows\security\database\local.sdb" /areas SECURITYPOLICY 
secedit /configure /db "c:\windows\security\database\local.sdb"
rm -force "$env:TEMP\security.inf" -confirm:$false
