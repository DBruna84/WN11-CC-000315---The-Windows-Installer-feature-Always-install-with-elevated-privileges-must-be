<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Danny Bruna
    LinkedIn        : https://www.linkedin.com/in/dr-danny-bruna
    GitHub          : https://github.com/DBruna84
    Date Created    : May 10, 2026
    Last Modified   : May 10, 2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000090 
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-00-000090/

.TESTED ON
    Date(s) Tested  : May 10, 2026
    Tested By       : Danny Bruna
    Systems Tested  : Windows 11 Professional 
    PowerShell Ver. : Major-5 Minor-1 Build-26100  Revision-8115

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# 🎯 Minimal, Direct Remediation (PowerShell)

# Disable AlwaysInstallElevated for Local Machine
New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" `
    -Name "AlwaysInstallElevated" `
    -Type DWord `
    -Value 0

# Disable AlwaysInstallElevated for Current User
New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\Installer" -Force | Out-Null
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Installer" `
    -Name "AlwaysInstallElevated" `
    -Type DWord `
    -Value 0

Write-Host "WN11-CC-000315 remediated: AlwaysInstallElevated disabled."

Verification Commands
Get-ItemProperty `
  -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" `
  -Name AlwaysInstallElevated

Get-ItemProperty `
  -Path "HKCU:\Software\Policies\Microsoft\Windows\Installer" `
  -Name AlwaysInstallElevated
