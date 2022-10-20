
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
Validates if Restore can be triggered for a DataSource
.Description
Validates if Restore can be triggered for a DataSource
.Example
$instances  = Get-AzDataProtectionBackupInstance -SubscriptionId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -ResourceGroupName "testResourceGroup" -VaultName "testVault" 
$pointInTimeRange = Find-AzDataProtectionRestorableTimeRange -BackupInstanceName $instances[0].BackupInstanceName -ResourceGroupName "testResourceGroup" -SubscriptionId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -VaultName "testVault" -SourceDataStoreType OperationalStore -StartTime (Get-Date).AddDays(-30).ToString("yyyy-MM-ddTHH:mm:ss.0000000Z") -EndTime (Get-Date).AddDays(0).ToString("yyyy-MM-ddTHH:mm:ss.0000000Z")
$vault = Get-AzDataProtectionBackupVault -ResourceGroupName "testResourceGroup" -SubscriptionId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -VaultName "testVault"
$RestoreRequestObject = Initialize-AzDataProtectionRestoreRequest -DatasourceType AzureBlob -SourceDataStore OperationalStore -RestoreLocation $vault.Location -RestoreType OriginalLocation -BackupInstance $instances[0] -PointInTime (Get-Date -Date $pointInTimeRange.RestorableTimeRange.EndTime)
$validateRestore = Test-AzDataProtectionBackupInstanceRestore -Name $instances[0].Name -ResourceGroupName "testResourceGroup" -SubscriptionId "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" -VaultName "testVault" -RestoreRequest $RestoreRequestObject

.Inputs
Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20220501.IValidateRestoreRequestObject
.Inputs
Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.IDataProtectionIdentity
.Outputs
Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20220501.IOperationJobExtendedInfo
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

INPUTOBJECT <IDataProtectionIdentity>: Identity Parameter
  [BackupInstanceName <String>]: The name of the backup instance
  [BackupPolicyName <String>]: 
  [Id <String>]: Resource identity path
  [JobId <String>]: The Job ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).
  [Location <String>]: The location in which uniqueness will be verified.
  [OperationId <String>]: 
  [RecoveryPointId <String>]: 
  [RequestName <String>]: 
  [ResourceGroupName <String>]: The name of the resource group where the backup vault is present.
  [ResourceGuardsName <String>]: The name of ResourceGuard
  [SubscriptionId <String>]: The subscription Id.
  [VaultName <String>]: The name of the backup vault.

PARAMETER <IValidateRestoreRequestObject>: Validate restore request object
  RestoreRequestObject <IAzureBackupRestoreRequest>: Gets or sets the restore request object.
    ObjectType <String>: 
    RestoreTargetInfo <IRestoreTargetInfoBase>: Gets or sets the restore target information.
      ObjectType <String>: Type of Datasource object, used to initialize the right inherited type
      [RestoreLocation <String>]: Target Restore region
    SourceDataStoreType <SourceDataStoreType>: Gets or sets the type of the source data store.
    [SourceResourceId <String>]: Fully qualified Azure Resource Manager ID of the datasource which is being recovered.

RESTOREREQUESTOBJECT <IAzureBackupRestoreRequest>: Gets or sets the restore request object.
  ObjectType <String>: 
  RestoreTargetInfo <IRestoreTargetInfoBase>: Gets or sets the restore target information.
    ObjectType <String>: Type of Datasource object, used to initialize the right inherited type
    [RestoreLocation <String>]: Target Restore region
  SourceDataStoreType <SourceDataStoreType>: Gets or sets the type of the source data store.
  [SourceResourceId <String>]: Fully qualified Azure Resource Manager ID of the datasource which is being recovered.
.Link
https://docs.microsoft.com/powershell/module/az.dataprotection/test-azdataprotectionbackupinstancerestore
#>
function Test-AzDataProtectionBackupInstanceRestore {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20220501.IOperationJobExtendedInfo])]
[CmdletBinding(DefaultParameterSetName='ValidateViaIdentity1', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='Validate1', Mandatory)]
    [Parameter(ParameterSetName='ValidateExpanded1', Mandatory)]
    [Alias('BackupInstanceName')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Path')]
    [System.String]
    # The name of the backup instance
    ${Name},

    [Parameter(ParameterSetName='Validate1', Mandatory)]
    [Parameter(ParameterSetName='ValidateExpanded1', Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Path')]
    [System.String]
    # The name of the resource group where the backup vault is present.
    ${ResourceGroupName},

    [Parameter(ParameterSetName='Validate1')]
    [Parameter(ParameterSetName='ValidateExpanded1')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    # The subscription Id.
    ${SubscriptionId},

    [Parameter(ParameterSetName='Validate1', Mandatory)]
    [Parameter(ParameterSetName='ValidateExpanded1', Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Path')]
    [System.String]
    # The name of the backup vault.
    ${VaultName},

    [Parameter(ParameterSetName='ValidateViaIdentity1', Mandatory, ValueFromPipeline)]
    [Parameter(ParameterSetName='ValidateViaIdentityExpanded1', Mandatory, ValueFromPipeline)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.IDataProtectionIdentity]
    # Identity Parameter
    # To construct, see NOTES section for INPUTOBJECT properties and create a hash table.
    ${InputObject},

    [Parameter(ParameterSetName='Validate1', Mandatory, ValueFromPipeline)]
    [Parameter(ParameterSetName='ValidateViaIdentity1', Mandatory, ValueFromPipeline)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20220501.IValidateRestoreRequestObject]
    # Validate restore request object
    # To construct, see NOTES section for PARAMETER properties and create a hash table.
    ${Parameter},

    [Parameter(ParameterSetName='ValidateExpanded1', Mandatory)]
    [Parameter(ParameterSetName='ValidateViaIdentityExpanded1', Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Models.Api20220501.IAzureBackupRestoreRequest]
    # Gets or sets the restore request object.
    # To construct, see NOTES section for RESTOREREQUESTOBJECT properties and create a hash table.
    ${RestoreRequestObject},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command as a job
    ${AsJob},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Run the command asynchronously
    ${NoWait},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.DataProtection.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName

        $mapping = @{
            Validate1 = 'Az.DataProtection.private\Test-AzDataProtectionBackupInstanceRestore_Validate1';
            ValidateExpanded1 = 'Az.DataProtection.private\Test-AzDataProtectionBackupInstanceRestore_ValidateExpanded1';
            ValidateViaIdentity1 = 'Az.DataProtection.private\Test-AzDataProtectionBackupInstanceRestore_ValidateViaIdentity1';
            ValidateViaIdentityExpanded1 = 'Az.DataProtection.private\Test-AzDataProtectionBackupInstanceRestore_ValidateViaIdentityExpanded1';
        }
        if (('Validate1', 'ValidateExpanded1') -contains $parameterSet -and -not $PSBoundParameters.ContainsKey('SubscriptionId')) {
            $PSBoundParameters['SubscriptionId'] = (Get-AzContext).Subscription.Id
        }

        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {

        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {

        throw
    }

}
end {
    try {
        $steppablePipeline.End()

    } catch {

        throw
    }
} 
}
