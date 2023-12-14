
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
Creates a Smb file share endpoint resource, which represents a data transfer source or destination.
.Description
Creates a Smb file share endpoint resource, which represents a data transfer source or destination.
.Example
New-AzStorageMoverAzSmbFileShareEndpoint -Name $endpointName -ResourceGroupName $rgname -StorageMoverName $storagemovername -StorageAccountResourceId $accountresourceid -FileShareName $fileshareName -Description "Description"

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Models.Api20231001.IEndpoint
.Inputs
Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Models.IStorageMoverIdentity
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Models.Api20231001.IEndpoint
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

.Link
https://learn.microsoft.com/powershell/module/az.storagemover/new-azstoragemoverazsmbfileshareendpoint
#>
function New-AzStorageMoverAzSmbFileShareEndpoint {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Models.Api20231001.IEndpoint])]
    [CmdletBinding(DefaultParameterSetName = 'CreateExpanded', PositionalBinding =$false, SupportsShouldProcess, ConfirmImpact = 'Medium')]
    [Alias("New-AzStorageMoverSmbFileShareEndpoint")]
    param(
        [Parameter(ParameterSetName='CreateExpanded', Mandatory)]
        [Alias('EndpointName')]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Path')]
        [System.String]
        # The name of the endpoint resource.
        ${Name},

        [Parameter(ParameterSetName='CreateExpanded', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},

        [Parameter(ParameterSetName='CreateExpanded', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Path')]
        [System.String]
        # The name of the Storage Mover resource.
        ${StorageMoverName},

        [Parameter(ParameterSetName = 'CreateExpanded')]
        [Parameter(Mandatory, HelpMessage="The Azure Resource ID of the storage account that is the target destination.")]
        [string]
        ${StorageAccountResourceId},

        [Parameter(ParameterSetName = 'CreateExpanded')]
        [Parameter(Mandatory, HelpMessage="The name of the Azure Storage file share.")]
        [string]
        ${FileShareName},
    
        [Parameter(ParameterSetName = 'CreateExpanded')]
        [Parameter(HelpMessage="A description for the endpoint.")]
        [string]
        ${Description},

        [Parameter(ParameterSetName='CreateExpanded')]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # The ID of the target subscription.
        ${SubscriptionId},

        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},

        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},

        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )

    process {
        $Properties = [Microsoft.Azure.PowerShell.Cmdlets.StorageMover.Models.Api20231001.AzureStorageSmbFileShareEndpointProperties]::New()

        if ($PSBoundParameters.ContainsKey('FileShareName')) {
            $Properties.FileShareName = $FileShareName
            $null = $PSBoundParameters.Remove("FileShareName")
        }
        if ($PSBoundParameters.ContainsKey('StorageAccountResourceId')) {
            $Properties.StorageAccountResourceId = $StorageAccountResourceId
            $null = $PSBoundParameters.Remove("StorageAccountResourceId")
        }
        if ($PSBoundParameters.ContainsKey('Description')) {
            $Properties.Description = $Description
            $null = $PSBoundParameters.Remove("Description")
        }

        $Properties.EndpointType = "AzureStorageSmbFileShare"
        $PSBoundParameters.Add("Property", $Properties)

        Az.StorageMover.internal\New-AzStorageMoverEndpoint @PSBoundParameters
    }
}
