$shell = New-Object -ComObject Shell.Application
$recycleBin = $shell.Namespace(10) # Recycle Bin

# Display contents of the Recycle Bin
$items = $recycleBin.Items()
$items | ForEach-Object {
    [PSCustomObject]@{
        Name              = $_.Name
        OriginalLocation  = $recycleBin.GetDetailsOf($_, 1) # Column for Original Location
        DeletionDate      = $recycleBin.GetDetailsOf($_, 2) # Column for Deletion Date
    }
} | Format-Table -AutoSize

# Prompt user
Write-Host "Do you want to empty the Recycle Bin? (y/n): "
$response = Read-Host

# If the user enters 'y', empty the Recycle Bin
if ($response -eq 'y') {
    $recycleBin = $shell.Namespace(10)
    $recycleBin.Items() | ForEach-Object {
        $_.InvokeVerb("delete")
    }
    Write-Host "Recycle Bin has been successfully emptied."
} else {
    Write-Host "Recycle Bin contents remain unchanged."
}