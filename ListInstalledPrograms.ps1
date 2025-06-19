# ListInstalledPrograms.ps1
# PowerShell script to list all installed programs on Windows.
# Handles registry entries with problematic property types.
# Author: hrosicka

# All registry paths to search for installed applications
$registryPaths = @(
    "HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall",
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall"
)

$programs = @()

foreach ($path in $registryPaths) {
    # Get all subkeys under the registry path
    Get-ChildItem $path -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            # Try to get properties of each subkey
            $item = Get-ItemProperty $_.PSPath
            if ($item.DisplayName) {
                # Add to the list if DisplayName exists
                $programs += [PSCustomObject]@{
                    DisplayName     = $item.DisplayName
                    DisplayVersion  = $item.DisplayVersion
                    Publisher       = $item.Publisher
                    InstallDate     = $item.InstallDate
                }
            }
        } catch {
            # Ignore entries that cause errors (e.g., type casting issues)
        }
    }
}

# Sort the result by DisplayName
$programs = $programs | Sort-Object DisplayName

# Output to console
$programs | Format-Table -AutoSize

# Export the results to a CSV file on the desktop:
$exportPath = "$env:USERPROFILE\Desktop\InstalledPrograms.csv"
$programs | Export-Csv -Path $exportPath -NoTypeInformation -Encoding UTF8
Write-Host "Exported list to $exportPath"