<#
.SYPNOSIS
Exports Active Directory user account information to a CSV file.

.DESCRITPION
This script retrieves user account information from Active Directory.
The user can specify either a Domain or an Organization Unit (OU) to filter the results.

.PARAMETER SearchBase
Distinguished Name (DN) of the Domain or OU to search.

.PARAMETER OutputPath
Path where the CSV report will be saved.

.EXAMPLE
.\Export-ADUserReport.ps1 -SearchBase "OU=Sales,DC=company,DC=com" -OutputPath "C:\Reports\SalesUsers.csv"
#>

[CmdletBinding()]
param (
    [Parameter(
        Mandatory = $true,
        HelpMessage = "Enter full Distinguished Name. Example: OU=IT,DC=Company,DC=com"
    )]
    [string]$SearchBase,

    [Parameter(
        Mandatory = $true,
        HelpMessage = "Enter full file path. Example: C:\Reports\Users.csv"
    )]
    [ValidatePattern("\.csv$")]
    [string]$OutputPath
)

# Import Active Directory module
try {
    Import-Module ActiveDirectory -ErrorAction Stop
}
catch {
    Write-Error "Active Directory module could not be loaded. Please ensure RSAT tools are installed."
    exit
}

#Retrieve AD users
try {
    Write-Host "Retrieving users from: $SearchBase" -ForegroundColor Cyan

    $Users = Get-ADUser `
        -Filter * `
        -SearchBase $SearchBase `
        -Properties DisplayName, EmailAddress, Enabled, LastLogonDate, Department

    if (-not $Users) {
        Write-Warning "No users found in the specified location."
        exit
    }

    #Select relevant properties
    $Report = $Users | Select-Object `
        sAMAccountName,
        DisplayName,
        EmailAddress,
        Department,
        Enabled,
        LastLogonDate

    #Export to CSV
    $Report | Export-Csv -Path $OutputPath -NoTypeInformation

    Write-Host "Report successfully exported to $OutputPath" -ForegroundColor Green
}
catch {
    Write-Error "An error occured while retrieving users: $_"
}
