foreach ($program in (Get-WmiObject -Class Win32_Product | where vendor -like "*XPLM*")){
	Write-Host "Uninstalling" + $program.Name + "..."
	$program.Uninstall()
}
