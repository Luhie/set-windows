# 현재 실행 중인 Windows Update 서비스를 중지합니다.
Stop-Service wuauserv

# Windows Update 서비스의 시작 유형을 '사용 안 함'으로 변경합니다.
Set-Service wuauserv -StartupType Disabled

# 레지스트리 경로 설정
$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"

# 해당 경로가 없으면 새로 생성
if (-not (Test-Path $RegistryPath)) {
    New-Item -Path $RegistryPath -Force | Out-Null
}

# 자동 업데이트 사용 안 함(2)으로 설정
Set-ItemProperty -Path $RegistryPath -Name NoAutoUpdate -Value 1 -Type DWord -Force

# 자동 업데이트 옵션 설정 (알림 후 다운로드 및 설치)
Set-ItemProperty -Path $RegistryPath -Name AUOptions -Value 5 -Type DWord -Force
