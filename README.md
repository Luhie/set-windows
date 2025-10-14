$dest = "$HOME\Desktop\install.ps1"
Invoke-WebRequest -Uri "https://github.com/Luhie/set-windows/raw/refs/heads/main/install.ps1" -OutFile $dest
Start-Process powershell.exe -Verb RunAs -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$dest`""
