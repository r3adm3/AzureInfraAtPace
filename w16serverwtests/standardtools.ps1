Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

$packages = 'googlechrome', `
            'visualstudiocode', `
            'git'

forEach ($packageName in $packages){
    choco install $packageName -y
}

get-date | set-content c:\windows\temp\installFinished.txt
