$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons"
Remove-ItemProperty -Path $regPath -Name "29" -ErrorAction SilentlyContinue

# Restart Explorer
Stop-Process -Name explorer -Force
Start-Process explorer

Write-Host "Shortcut arrows restored."
