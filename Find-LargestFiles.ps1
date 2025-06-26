<#
.SYNOPSIS
    Lists the largest files in a specified directory and its subdirectories.

.DESCRIPTION
    This script scans a given folder (including subfolders) and outputs the N largest files, sorted by size (descending).
    The output includes the file size in megabytes and the full file path.

.PARAMETER Path
    The directory to search. Defaults to "C:\Users\Hanka\Downloads" but can be changed.

.PARAMETER TopN
    The number of largest files to display. Defaults to 10.

.EXAMPLE
    .\Find-LargestFiles.ps1 -Path "C:\Users\YourName\Documents" -TopN 20

.NOTES
    Author: hrosicka
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$Path = "C:\Users\Hanka\Downloads",    # Default search path, can be changed as needed

    [Parameter(Mandatory = $false)]
    [int]$TopN = 10                               # Number of largest files to display
)

Write-Host "Searching for the $TopN largest files in $Path..." -ForegroundColor Cyan

# Get all files recursively, sort by size descending, select the top N, and format the output
Get-ChildItem -Path $Path -Recurse -File -ErrorAction SilentlyContinue |
    Sort-Object Length -Descending |
    Select-Object -First $TopN |
    Select-Object @{Name = "Size (MB)"; Expression = { "{0:N2}" -f ($_.Length / 1MB) } }, FullName |
    Format-Table -AutoSize