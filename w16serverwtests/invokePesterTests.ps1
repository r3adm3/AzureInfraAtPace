param(
    [Parameter(Mandatory=$true)][string]$SourceDir,
    [string]$TempDir = $env:TEMP,
    [Parameter(Mandatory=$true)][bool]$local = $false
)

#set the build_sourcesdirectory environment for later. 
$env:BUILD_SOURCESDIRECTORY = $SourceDir
write-output "SourceDir is $SourceDir"
write-output "TempDir is $TempDir"
write-output "Local is $local"

$modulePath = Join-Path $TempDir Pester-master\Pester.psm1

#Check if we need to login (local vs azure devops)
#if ([string]::IsNullOrEmpty($(Get-AzureRmContext).Account)) {Login-AzureRmAccount}

if (-not(Test-Path $modulePath)) {
 
    # Note: PSGet and chocolatey are not supported in hosted vsts build agent  
    $tempFile = Join-Path $TempDir pester.zip
    
    if ($local -eq $true){

        #running locally, issue with github being on tls 1.2 vs tls 1.0
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    }
    Invoke-WebRequest https://github.com/pester/Pester/archive/master.zip -OutFile $tempFile 
 
    [System.Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem') | Out-Null
    [System.IO.Compression.ZipFile]::ExtractToDirectory($tempFile, $tempDir)
 
    Remove-Item $tempFile
}
 
Import-Module $modulePath -DisableNameChecking
 
$outputFile = Join-Path $SourceDir "TEST-pester.xml";

if ($local -eq $true){
    #locally don't exit at end of script execution
    Invoke-Pester -Path $SourceDir -PassThru -OutputFile $outputFile -OutputFormat NUnitXml
} else {
    Invoke-Pester -Path $SourceDir -PassThru -OutputFile $outputFile -OutputFormat NUnitXml -EnableExit
}