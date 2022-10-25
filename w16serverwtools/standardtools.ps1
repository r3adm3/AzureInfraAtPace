function Disable-InternetExplorerESC {
    $AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"
    $UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"
    Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0
    Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0
    Stop-Process -Name Explorer
    Write-Host "IE Enhanced Security Configuration (ESC) has been disabled." -ForegroundColor Green
}

Set-ExecutionPolicy Bypass -Scope Process -Force
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$packages = 'googlechrome', `
            'visualstudiocode', `
            'git', `
            'microsoft-teams', `
            'dotnet-sdk', `
            'setdefaultbrowser'

forEach ($packageName in $packages){
    choco install $packageName -y --ignore-checksums
}

write-host "Setting Default Browser to Chrome"
setdefaultbrowser chrome

write-host "Disabling IE Security Config"
Disable-InternetExplorerESC

get-date | set-content c:\windows\temp\installFinished.txt
 





