# Taken from https://github.com/cyberphor/scripts/blob/master/PowerShell/Find-WirelessComputers.ps1
$Computers = Get-AdComputer -Filter * | Select-Object -ExpandProperty DnsHostname

Invoke-Command -ComputerName $Computers -ErrorAction Ignore -ScriptBlock {
  Get-WmiObject Win32_NetworkAdapter | Where-Object { $_.Name -like '*Wireless*' }
}
