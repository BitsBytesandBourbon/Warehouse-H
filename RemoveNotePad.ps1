If ((Get-appxpackage -allusers Microsoft.WindowsNotepad).Status -eq "OK")
{
	$Notepad = (Get-appxpackage -allusers Microsoft.WindowsNotepad).PackageFullName
Remove-AppxPackage -Package $Notepad -AllUsers 
}else{
	write-host = "NotePad is Already Gone"
}
