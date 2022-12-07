# Look in HKEY_CLASSES_ROOT\Aras.IOM.IomFactory.*.* exists (where * is a number)
$nl = [Environment]::NewLine
$pattern = "*IOM*"
Write-Host "Results in HKEY_CLASSES_ROOT that match '$pattern':" -BackgroundColor White -ForegroundColor Black
$iomKeys = Get-ChildItem -Path "Registry::HKEY_CLASSES_ROOT" | Where-Object {$_.name  -Like $pattern}
 
$i = 0
foreach ($iomKey in $iomKeys){
    if ($i -ne 0){Write-Host $newline}
    Write-Host "  $iomKey.Name" -ForegroundColor Green
    $regPath = "Registry::" + $iomKey.Name + "\CLSID"
    $clsID = (Get-ItemProperty -Path $regPath -Name "(Default)").'(default)'
    Write-Host "    CLSID: $clsID"
    $i += 1
}

Write-Host "Press any key to continue ....."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")