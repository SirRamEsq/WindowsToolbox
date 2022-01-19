# Taken From
# https://arminreiter.com/2021/01/add-exchange-online-shell-to-windows-terminal/
# If this fails, may need to install exchange online
#   Install-Module ExchangeOnlineManagement

Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline
# sign in
Get-MailUser

# If Connect-ExchangeOnline throws:
# Could not load type ‘System.Security.Cryptography.SHA256Cng’ from assembly ‘System.Core, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089'
# switch to “classic” Powershell. This error occurs if you use Powershell Core. ExchangeOnlineManagement only works within Powershell.

# Can add Exchange Online to Windows Terminal
# Open settings of Windows Terminal and add:
#      {
#        "guid": "{2f59be3b-a8a2-4131-98c9-e8531cbc4dd9}",
#        "name": "Exchange Online Shell",
#        "commandline": "powershell.exe -NoExit -Command \"Import-Module ExchangeOnlineManagement; Connect-ExchangeOnline\"",
#        "background": "#012456",
#        "icon": "ms-appx:///ProfileIcons/{61c54bbd-c2c6-5271-96e7-009a87ff44bf}.png"
#      }
#If you always use the same user, you can add “-UserPrincipalName myuser@example.com” to the config:
#      {
#        "guid": "{2f59be3b-a8a2-4131-98c9-e8531cbc4dd9}",
#        "name": "Exchange Online Shell",
#        "commandline": "powershell.exe -NoExit -Command \"Import-Module ExchangeOnlineManagement; Connect-ExchangeOnline -UserPrincipalName myuser@example.com\"",
#        "background": "#012456",
#        "icon": "ms-appx:///ProfileIcons/{61c54bbd-c2c6-5271-96e7-009a87ff44bf}.png"
#      }
