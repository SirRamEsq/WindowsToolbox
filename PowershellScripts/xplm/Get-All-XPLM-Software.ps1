Get-WmiObject -Class Win32_Product | where vendor -like "*XPLM*" | select Name, Version
