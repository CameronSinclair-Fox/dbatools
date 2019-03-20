﻿# constants
if (Test-Path C:\temp\constants.ps1) {
    Write-Verbose "C:\temp\constants.ps1 found."
    . C:\temp\constants.ps1
} elseif (Test-Path "$PSScriptRoot\constants.local.ps1") {
    Write-Verbose "tests\constants.local.ps1 found."
    . "$PSScriptRoot\constants.local.ps1"
} else {

    $password = "yourStrong(!)Password" | ConvertTo-SecureString -asPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential("sa", $password)
    $script:instance1 = Connect-DbaInstance -sqlinstance sql1:1433 -SqlCredential $credential
    $script:instance2 = Connect-DbaInstance -sqlinstance sql2:1433 -SqlCredential $credential
    $script:instance1Sep = Get-DbaPathSep -Server $script:instance1
    $script:instance2Sep = Get-DbaPathSep -Server $script:instance2
    $script:instance3 = "localhost\sql2017"
    $script:instance2_detailed = "localhost,14333\sql2016" #Just to make sure things parse a port properly
    $script:appveyorlabrepo = "/opt/mssql/github/appveyor-lab"
    $instances = @($script:instance1, $script:instance2)
    $ssisserver = "localhost\sql2016"
    $script:azureblob = "https://dbatools.blob.core.windows.net/sql"
    $script:azureblobaccount = "dbatools"
    $script:azureserver = 'psdbatools.database.windows.net'
    $script:azuresqldblogin = "appveyor@clemairegmail.onmicrosoft.com"
}

if ($env:appveyor) {
    $PSDefaultParameterValues['*:WarningAction'] = 'SilentlyContinue'
}