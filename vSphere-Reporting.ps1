<#
.SYNOPSIS
Log into vCloud Datacentre 01

.DESCRIPTION
Log into vCloud Datacentre 01

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

Get-VM * | select Name,Description,PowerState,Guest,VMHost,GuestID, @{ Name = 'LastBackup'; Expression = { $_.CustomFields | Where-Object {$_.Key -eq "Last Backup"} | Select-Object -ExpandProperty Value }} | Export-CSV C:\Temp\VM-VSphere.csv -Verbose -NoTypeInformation