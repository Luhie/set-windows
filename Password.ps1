## 암호 설정 확인
$users = Get-LocalUser
foreach ($user in $users) {
    if ($user.PasswordRequired -eq $false) {
        Write-Output "$($user.Name) 계정은 암호가 설정되지 않았습니다."
    }
}

# 현재 로그인 사용자만 확인
$user = Get-LocalUser -Name $env:USERNAME
$user | Select-Object Name, PasswordRequired, PasswordNeverExpires, Enabled


$Password = Read-Host "새 암호를 입력하세요" -AsSecureString
Set-LocalUser -Name "사용자명" -Password $Password
Set-LocalUser -Name $env:USERNAME -Password $Password

Set-LocalUser -Name "사용자명" -Password (ConvertTo-SecureString -AsPlainText "새암호" -Force)
