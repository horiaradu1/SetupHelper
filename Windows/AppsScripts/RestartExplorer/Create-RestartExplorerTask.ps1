param (
    [string]$ScriptPath
)

if (-not (Test-Path $ScriptPath)) {
    Write-Error "The script path '$ScriptPath' does not exist."
    exit 1
}

$taskName = "RestartExplorer"

# Get current user
$currentUser = "$env:USERDOMAIN\$env:USERNAME"

# Create the action
$action = New-ScheduledTaskAction -Execute $ScriptPath

# Create the trigger: At startup with 30 seconds delay
$trigger = New-ScheduledTaskTrigger -AtStartup
$trigger.Delay = "PT30S"

# Set principal: current user, only when logged on
$principal = New-ScheduledTaskPrincipal -UserId $currentUser -LogonType Interactive -RunLevel Highest

# Register the task
Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Principal $principal

Write-Host "Task '$taskName' created for user '$currentUser' to run '$ScriptPath' at startup (when logged on), with 30 seconds delay."

# Example .\Create-RestartExplorerTask.ps1 -ScriptPath "C:\Path\To\Restart-Explorer.bat"
