# Registry path for shortcut icon overlay
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons"
$valueName = "29"

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set value 29 to an empty string (no arrow overlay)
Set-ItemProperty -Path $regPath -Name $valueName -Value ""

# Restart Explorer for changes to apply
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "Shortcut arrows removed by setting empty string. You may need to refresh or reboot for full effect."
