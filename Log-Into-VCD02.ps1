
<#
.SYNOPSIS
Log into vCloud Datacentre 02

.DESCRIPTION
Log into vCloud Datacentre 02

.NOTES
AUTHOR  : Jonathon Taylor
CREATED : 01/06/2017
VERSION : 1.0

.INPUTS
None. This script does not accept pipelines

.OUTPUTS
None. This script does not output parameters
#>
#Requires -Version 3

### Written Aurion Web Build Automation
### Declaring Variables for Authentication ###
$global:DefaultVIServer = "vcd02.local"
$vCloud_Org = "s01_i1"

### Authentication prompt, shouldn't need to change anything here ###
$LogIntoVDC01 = Connect-CIServer -server $global:DefaultVIServer -org $vCloud_Org -SaveCredentials