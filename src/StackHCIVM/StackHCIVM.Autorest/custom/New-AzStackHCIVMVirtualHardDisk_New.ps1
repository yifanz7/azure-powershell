
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
The operation to create or update a virtual hard disk.
Please note some properties can be set only during virtual hard disk creation.
.Description
The operation to create or update a virtual hard disk.
Please note some properties can be set only during virtual hard disk creation.

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Models.IVirtualHardDisks
.Link
https://learn.microsoft.com/powershell/module/az.stackhcivm/new-azstackhcivmvirtualharddisk
#>
function New-AzStackHCIVMVirtualHardDisk {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Models.IVirtualHardDisks])]
[CmdletBinding(PositionalBinding=$false,SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Alias('VirtualHardDiskName')]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Path')]
    [System.String]
    # Name of the virtual hard disk. 
    # Must contain all alphanumeric characters or ‘-’ or ‘_’. Max length is 80 characters, and min length is 1 character.  
    ${Name},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Path')]
    [System.String]
    # The name of the resource group.
    # The name is case insensitive.
    ${ResourceGroupName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The ID of the target subscription.
    ${SubscriptionId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.String]
    # The geo-location where the resource lives
    ${Location},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.Int32]
    # The block size, in bytes, of the virtual hard disk.  
    ${BlockSizeByte},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.String]
    # Storage ContainerID of the storage container to be used for VHD
    ${StoragePathId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.String]
    # Storage Container Name to be used for the VHD 
    ${StoragePathName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.String]
    # Storage Container resource group. The resource group of the virtual hard disk will be used if this value is not provided. 
    ${StoragePathResourceGroup},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.String]
    # The ARM Id of the extended location to create virtual hard disk resource in.
    ${CustomLocationId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.PSArgumentCompleterAttribute("vhdx", "vhd")]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    # The format of the actual VHD file [vhd, vhdx]
    ${DiskFileFormat},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.Int64]
    # Size of the disk in GB
    ${SizeGb},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.Management.Automation.SwitchParameter]
    # Boolean for enabling dynamic sizing on the virtual hard disk
    ${Dynamic},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.PSArgumentCompleterAttribute("V1", "V2")]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    # The hypervisor generation of the Virtual Machine [V1, V2]
    ${HyperVGeneration},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.Int32]
    # Logical Sector Bytes of the Disk
    ${LogicalSectorByte},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [System.Int32]
    # Physical Sector Bytes of the Disk
    ${PhysicalSectorByte},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Models.ITrackedResourceTags]))]
    [System.Collections.Hashtable]
    # Resource tags.
    ${Tag},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command as a job
    ${AsJob},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command asynchronously
    ${NoWait},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.StackHCIVM.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

        if (-Not ($Name -match $vhdNameRegex)){
            Write-Error "Invalid Name:  $Name. The name must contain all alphanumeric characters or '-' or '_'. The max length is 80 characters." -ErrorAction Stop
        }

        if ($CustomLocationId -notmatch $customLocationRegex){
             Write-Error "Invalid CustomLocationId: $CustomLocationId" -ErrorAction Stop
        } 

        if ($DiskFileFormat){
            if ($DiskFileFormat.ToString().ToLower() -ne "vhd" -and $DiskFileFormat.ToString().ToLower() -ne "vhdx"){
                Write-Error "Invalid disk file format provided. Allowed values are 'vhd' and 'vhdx'. " -ErrorAction Stop
            }
        }

        
        if ($LogicalSectorByte){
            if ($LogicalSectorByte -ne 512 -and $LogicalSectorByte -ne 4096){
                Write-Error "Invalid value for logical sector bytes provided. Allowed values are 512 and 4096. " -ErrorAction Stop
            }
        }

              
        if ($PhysicalSectorByte){
            if ($PhysicalSectorByte -ne 512 -and $PhysicalSectorByte -ne 4096){
                Write-Error "Invalid value for physical sector bytes provided. Allowed values are 512 and 4096'. "  -ErrorAction Stop
            }
        }

        if ($SizeGb){
            if ($SizeGb -gt 4095){
                Write-Error "Maximum value for $SizeGb is 4095."  -ErrorAction Stop
            }
        }

        if($StoragePathId){
            if (-Not ($StoragePathId -match $storagePathRegex)){
                Write-Error "Invalid resource ID provided for storage path $StoragePathId " -ErrorAction Stop
            }
        } elseif ($StoragePathName){
            if ($StoragePathResourceGroup){
                $StoragePathId = "/subscriptions/$SubscriptionId/resourceGroups/$StoragePathResourceGroup/providers/Microsoft.AzureStackHCI/storagecontainers/$StoragePathName"
            } else {
                $StoragePathId= "/subscriptions/$SubscriptionId/resourceGroups/$ResourceGroupName/providers/Microsoft.AzureStackHCI/storagecontainers/$StoragePathName"
            }
            $PSBoundParameters.Add('StoragePathId', $StoragePathId)
            $null = $PSBoundParameters.Remove("StoragePathName")
            $null = $PSBoundParameters.Remove("StoragePathResourceGroup")
        }

        return Az.StackHCIVM.internal\New-AzStackHCIVMVirtualHardDisk @PSBoundParameters
    
}

