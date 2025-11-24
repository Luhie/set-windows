[Console]::OutputEncoding = [Text.Encoding]::UTF8
chcp 65001

# 관리자 권한 체크 및 자동 승격
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "관리자 권한이 필요합니다. 관리자 권한으로 실행합니다..."
    Start-Process -FilePath "powershell" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Chocolatey 설치
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

# Chocolatey 업그레이드
choco upgrade chocolatey -y

# 개발용 폰트 설치 (Fira Code, Hack)
choco install firacode hackfont -y

# Python3 설치
choco install python313 --version=3.13.7 -y

# PHP 설치 (필요 시 주석 해제)
# choco install php --version=8.4.8 -y

# PicPick 포터블 설치 (필요 시 주석 해제)
# choco install picpick.portable -y

# Git 설치
choco install git -y

#mysql
choco install mysql -y
choco install heidisql -y

choco install filezilla -y
# 도커 설치
# choco install docker-desktop -y

# Chocolatey 버전 확인
choco -v

# 설치된 패키지 목록만 확인
choco list

Write-Host "`n스크립트가 완료되었습니다. 설치된 프로그램을 확인하세요."
pause
