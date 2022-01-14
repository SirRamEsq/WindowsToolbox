# Will get user accounts from the specified ou that haven't logged in recently

Import-Module ActiveDirectory

$ReportFile = "C:\TempLastLogonTimeStampUsers.csv"
# $SearchBase = Read-Host -Prompt 'Distinguished Name (OU Path in LDAP Format) to Scrub'
$SearchBase = 'OU=Accounts,DC=DOMAIN_HERE,DC=local'
$30_Days_Ago = (Get-Date).AddDays(-30)
$Filter = { LastLogonDate -le $30_Days_Ago }
Get-ADUser -Filter $Filter -SearchBase $SearchBase -Properties CN,LastLogonDate,Description | Export-CSV $ReportFile -NoTypeInformation
