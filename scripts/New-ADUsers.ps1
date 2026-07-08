# New-ADUsers.ps1
# Bulk gebruikers aanmaken in Active Directory vanuit CSV
# Gebruik: .\New-ADUsers.ps1 -CsvPath ".\gebruikers.csv"

param (
    [Parameter(Mandatory=$true)]
    [string]$CsvPath,

    [string]$DefaultOU = "OU=Gebruikers,DC=school,DC=local",
    [string]$DefaultPassword = "Welkom@2025!"
)

Import-Module ActiveDirectory

$gebruikers = Import-Csv -Path $CsvPath -Delimiter ";"

foreach ($user in $gebruikers) {
    $fullName  = "$($user.Voornaam) $($user.Achternaam)"
    $samAccount = ($user.Voornaam[0] + $user.Achternaam).ToLower() -replace "\s",""

    try {
        New-ADUser `
            -Name            $fullName `
            -GivenName       $user.Voornaam `
            -Surname         $user.Achternaam `
            -SamAccountName  $samAccount `
            -UserPrincipalName "$samAccount@school.local" `
            -Path            $DefaultOU `
            -AccountPassword (ConvertTo-SecureString $DefaultPassword -AsPlainText -Force) `
            -ChangePasswordAtLogon $true `
            -Enabled         $true

        Write-Host "[✓] Aangemaakt: $fullName ($samAccount)" -ForegroundColor Green
    }
    catch {
        Write-Host "[✗] Fout bij $fullName : $_" -ForegroundColor Red
    }
}

