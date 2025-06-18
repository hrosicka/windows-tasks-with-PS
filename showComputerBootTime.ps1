# Retrieve the time of the last boot using WMI
$os = Get-CimInstance -ClassName Win32_OperatingSystem
$lastBootTime = $os.LastBootUpTime

# Convert the last boot time to a readable format
$lastBootTimeFormatted = $lastBootTime.ToLocalTime()

# Get the current time
$currentTime = Get-Date

# Calculate the uptime (how long the PC has been running)
$uptime = $currentTime - $lastBootTime

# Display the results
Write-Output "Last boot time: $lastBootTimeFormatted"
Write-Output "Uptime: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes, $($uptime.Seconds) seconds"