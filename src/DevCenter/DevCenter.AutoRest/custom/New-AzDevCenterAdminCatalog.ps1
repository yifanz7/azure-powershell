
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
Creates or updates a catalog.
.Description
Creates or updates a catalog.
.Example
{{ Add code here }}
.Example
{{ Add code here }}

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Models.IDevCenterIdentity
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Models.Api20240501Preview.ICatalog
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IDevCenterIdentity>: Identity Parameter
  [AttachedNetworkConnectionName <String>]: The name of the attached NetworkConnection.
  [CatalogName <String>]: The name of the Catalog.
  [DevBoxDefinitionName <String>]: The name of the Dev Box definition.
  [DevCenterName <String>]: The name of the devcenter.
  [EncryptionSetName <String>]: The name of the devcenter encryption set.
  [EnvironmentDefinitionName <String>]: The name of the Environment Definition.
  [EnvironmentTypeName <String>]: The name of the environment type.
  [GalleryName <String>]: The name of the gallery.
  [Id <String>]: Resource identity path
  [ImageName <String>]: The name of the image.
  [Location <String>]: The Azure region
  [MemberName <String>]: The name of a devcenter plan member.
  [NetworkConnectionName <String>]: Name of the Network Connection that can be applied to a Pool.
  [OperationId <String>]: The ID of an ongoing async operation
  [PlanName <String>]: The name of the devcenter plan.
  [PoolName <String>]: Name of the pool.
  [ProjectName <String>]: The name of the project.
  [ResourceGroupName <String>]: The name of the resource group. The name is case insensitive.
  [ScheduleName <String>]: The name of the schedule that uniquely identifies it.
  [SubscriptionId <String>]: The ID of the target subscription.
  [TaskName <String>]: The name of the Task.
  [VersionName <String>]: The version of the image.
.Link
https://learn.microsoft.com/powershell/module/az.devcenter/new-azdevcenteradmincatalog
#>
function New-AzDevCenterAdminCatalog {
  [OutputType([Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Models.Api20240501Preview.ICatalog])]
  [CmdletBinding(DefaultParameterSetName='CreateExpandedAdo', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
  param(
      [Parameter(ParameterSetName='CreateExpandedAdo', Mandatory)]
      [Parameter(ParameterSetName='CreateExpandedGitHub', Mandatory)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Path')]
      [System.String]
      # The name of the devcenter.
      ${DevCenterName},
  
      [Parameter(ParameterSetName='CreateExpandedAdo', Mandatory)]
      [Parameter(ParameterSetName='CreateExpandedGitHub', Mandatory)]
      [Alias('CatalogName')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Path')]
      [System.String]
      # The name of the Catalog.
      ${Name},
  
      [Parameter(ParameterSetName='CreateExpandedAdo', Mandatory)]
      [Parameter(ParameterSetName='CreateExpandedGitHub', Mandatory)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Path')]
      [System.String]
      # The name of the resource group.
      # The name is case insensitive.
      ${ResourceGroupName},
  
      [Parameter(ParameterSetName='CreateExpandedAdo', Mandatory)]
      [Parameter(ParameterSetName='CreateExpandedGitHub', Mandatory)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Path')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
      [System.String]
      # The ID of the target subscription.
      ${SubscriptionId},
  
      [Parameter(ParameterSetName='CreateViaIdentityExpandedAdo', Mandatory, ValueFromPipeline)]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedGitHub', Mandatory, ValueFromPipeline)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Path')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Models.IDevCenterIdentity]
      # Identity Parameter
      # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
      ${InputObject},
  
      [Parameter(ParameterSetName='CreateExpandedAdo')]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedAdo')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # Git branch.
      ${AdoGitBranch},
  
      [Parameter(ParameterSetName='CreateExpandedAdo')]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedAdo')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # The folder where the catalog items can be found inside the repository.
      ${AdoGitPath},
  
      [Parameter(ParameterSetName='CreateExpandedAdo', Mandatory)]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedAdo', Mandatory)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # A reference to the Key Vault secret containing a security token to authenticate to a Git repository.
      ${AdoGitSecretIdentifier},
  
      [Parameter(ParameterSetName='CreateExpandedAdo', Mandatory)]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedAdo', Mandatory)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # Git URI.
      ${AdoGitUri},
  
      [Parameter(ParameterSetName='CreateExpandedGitHub')]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedGitHub')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # Git branch.
      ${GitHubBranch},
  
      [Parameter(ParameterSetName='CreateExpandedGitHub')]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedGitHub')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # The folder where the catalog items can be found inside the repository.
      ${GitHubPath},

      [Parameter(ParameterSetName='CreateExpandedGitHub', Mandatory)]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedGitHub', Mandatory)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # A reference to the Key Vault secret containing a security token to authenticate to a Git repository.
      ${GitHubSecretIdentifier},

      [Parameter(ParameterSetName='CreateExpandedGitHub', Mandatory)]
      [Parameter(ParameterSetName='CreateViaIdentityExpandedGitHub', Mandatory)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [System.String]
      # Git URI.
      ${GitHubUri},
  
      [Parameter()]
      [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Support.CatalogSyncType])]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Support.CatalogSyncType]
      # Indicates the type of sync that is configured for the catalog.
      ${SyncType},
  
      [Parameter()]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Body')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Models.Api20240501Preview.ICatalogUpdatePropertiesTags]))]
      [System.Collections.Hashtable]
      # Resource tags.
      ${Tag},
  
      [Parameter()]
      [Alias('AzureRMContext', 'AzureCredential')]
      [ValidateNotNull()]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Azure')]
      [System.Management.Automation.PSObject]
      # The DefaultProfile parameter is not functional.
      # Use the SubscriptionId parameter when available if executing the cmdlet against a different subscription.
      ${DefaultProfile},
  
      [Parameter()]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [System.Management.Automation.SwitchParameter]
      # Run the command as a job
      ${AsJob},
  
      [Parameter(DontShow)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [System.Management.Automation.SwitchParameter]
      # Wait for .NET debugger to attach
      ${Break},
  
      [Parameter(DontShow)]
      [ValidateNotNull()]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Runtime.SendAsyncStep[]]
      # SendAsync Pipeline Steps to be appended to the front of the pipeline
      ${HttpPipelineAppend},
  
      [Parameter(DontShow)]
      [ValidateNotNull()]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Runtime.SendAsyncStep[]]
      # SendAsync Pipeline Steps to be prepended to the front of the pipeline
      ${HttpPipelinePrepend},
  
      [Parameter()]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [System.Management.Automation.SwitchParameter]
      # Run the command asynchronously
      ${NoWait},
  
      [Parameter(DontShow)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [System.Uri]
      # The URI for the proxy server to use
      ${Proxy},
  
      [Parameter(DontShow)]
      [ValidateNotNull()]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [System.Management.Automation.PSCredential]
      # Credentials for a proxy server to use for the remote call
      ${ProxyCredential},
  
      [Parameter(DontShow)]
      [Microsoft.Azure.PowerShell.Cmdlets.DevCenter.Category('Runtime')]
      [System.Management.Automation.SwitchParameter]
      # Use the default credentials for the proxy
      ${ProxyUseDefaultCredentials}
  )


process {
    Az.DevCenter.internal\New-AzDevCenterAdminCatalog @PSBoundParameters
}

}
