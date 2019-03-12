### Written Aurion Web Build Automation
# Script to remove one or more vApps
### Declaring variables for VM creation ###

$vAppNamePrefix = "QSSJONNY"        # Name of the vApps to be deleted
$vmCount = 1                       # The number of vApps to delete, VMCount = 2, $VMName1 and $VMName2 will be deleted
$vmIndex = 1                       # The starting number to start deleting from (e.g. 1= VMName1 will be the first VM)

### Deploying VMs, you shouldn't need to change any of the script below ###
$vmCount = ($vmIndex + $vmCount)-1
for($i=$vmIndex; $i -le $vmCount; $i++)

{
$vAppName = $vAppNamePrefix+"$i"
$VMName = $VMNamePrefix+"$i"

### Delete new vApp ###
# -WhatIif paramter test runs the action, no vApp will be deleted as long as this is present.
# Once you're happy with the output, comment out the -WhatIf parameter from both of the below lines

Stop-CIVApp $vAppName 
Remove-CIVApp -vApp $vAppName -Confirm 
}
