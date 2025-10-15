# 원드라이브 프로세스 중지
Stop-Process -Name OneDrive -ErrorAction SilentlyContinue

# winget uninstall Microsoft.OneDrive
winget uninstall Microsoft.OneDrive --silent --accept-source-agreements --disable-interactivity


Remove-Item -Path "$env:UserProfile\OneDrive" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LocalAppData\Microsoft\OneDrive" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:ProgramData\Microsoft OneDrive" -Recurse -Force -ErrorAction SilentlyContinue

# 재설치 방지
Remove-Item "C:\Windows\SysWOW64\OneDriveSetup.exe" -Force -ErrorAction SilentlyContinue
Remove-Item "C:\Windows\System32\OneDriveSetup.exe" -Force -ErrorAction SilentlyContinue

# 재설치
#winget install Microsoft.OneDrive

Write-Output "OneDrive 완전 삭제 및 재설치 차단이 완료되었습니다."
