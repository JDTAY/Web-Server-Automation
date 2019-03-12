
<#
.SYNOPSIS
Create new Jumpboxes on vCloud

.DESCRIPTION
Create new Jumpboxes on vCloud

.NOTES
AUTHOR  : Jonathon Taylor
CREATED : 2017
VERSION : 1.0

.INPUTS
None. This script does not accept pipelines

.OUTPUTS
None. This script does not output parameters
#>
#Requires -Version 3
#TODO: Turn these into params
$OrgVDC = "" # org VDC that will be used to host your machine
$OrgVDCNetwork = "" # The Network that your vApp will be connected to
$templateVM = "" # The Template VM Name that you want to replicate from within the Catalogue.
$vmCount = 1                       # The number of VM's to create
$vmIndex = 1                       # This will be the first VM copy that's made, e.g. defining 1 will mean the first vApp will be [vAppname]1, the next will be vAppname]2 and so on.
$vAppNamePrefix = ""      # Prefix string that will be used for the vApp Name.
$VMNamePrefix = ""        # Prefix string in the VM Name.

# Variables that don't need to be changed, should stay the same
$orgNetwork = get-orgvdc $OrgVDC | get-orgvdcnetwork $OrgVDCNetwork # Define the Org-VDC where the host will be placed, and the network that you want to use for the vApp

### Deploying VMs, you shouldn't need to change any of the script below ###
$vmCount = ($vmIndex + $vmCount)-1
for($i=$vmIndex; $i -le $vmCount; $i++)

{
$vAppName = $vAppNamePrefix+"$i"
$VMName = $VMNamePrefix+"$i"

### Creating new vApp ###
New-CIVApp -Name $vAppName -OrgVdc $OrgVDC

### Deploy the VM from template inside the newly created vApp###

New-CIVM -Name "$VMName" -VMTemplate $templateVM -VApp $vAppName -ComputerName "$VMName"

### Get existing vApp Network ###
New-CIVAppNetwork -VApp $vAppName -Direct -ParentOrgVDCNetwork $orgNetwork
$vAppNetwork = get-civapp $vAppName | Get-CIVAppNetwork $orgNetwork
$cldVMs = get-civapp $vAppName | get-civm

### Connecting the vNIC to the network ###
### Please change the allocation model if required, vreate variable for IP allocation increments, this script replies on vCloud
### allocating an IP address to the host via DHCP, not desirable at the moment. When time permits, I'd like to use the Invoke-VMScript
### to determine what the IP address of each host is but, it's not there yet
### You may want to change the -IPaddressAlloctionMode from pool, static, DHCP or manual depending on how you prefer the IP allocation to be set

foreach ($cldvm in $cldVMs) {
    $cldvm | Get-CINetworkAdapter | Set-CINetworkAdapter -vappnetwork $vAppNetwork -IPaddressAllocationMode Pool -Connected $True
    }

### Powering on the vApps ###
### Self explanatory, this turns the vApp on after it's built, commenting this line out will stop that if it's not desirable
get-CIVApp -Name $vAppName | Start-CIVApp

}