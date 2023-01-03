
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
Create an in-memory object for AzureFileDatastore.
.Description
Create an in-memory object for AzureFileDatastore.
.Example
New-AzMLWorkspaceDatastoreFileObject

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Models.Api20220501.AzureFileDatastore
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

PROPERTY <IResourceBaseProperties>: The asset property dictionary.
  [(Any) <String>]: This indicates any property can be added to this object.

TAG <IResourceBaseTags>: Tag dictionary. Tags can be added, removed, and updated.
  [(Any) <String>]: This indicates any property can be added to this object.
.Link
https://learn.microsoft.com/powershell/module/az.MLWorkspace/new-AzMLWorkspaceDatastoreFileObject
#>
function New-AzMLWorkspaceDatastoreFileObject {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Models.Api20220501.AzureFileDatastore])]
[CmdletBinding(PositionalBinding=$false)]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [System.String]
    # [Required] Storage account name.
    ${AccountName},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [System.String]
    # [Required] The name of the Azure file share that the datastore points to.
    ${FileShareName},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [System.String]
    # Azure cloud endpoint for the storage account.
    ${Endpoint},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [System.String]
    # Protocol used to communicate with the storage account.
    ${Protocol},

    [Parameter()]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Support.ServiceDataAccessAuthIdentity])]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Support.ServiceDataAccessAuthIdentity]
    # Indicates which identity to use to authenticate service data access to customer's storage.
    ${ServiceDataAccessAuthIdentity},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [System.String]
    # The asset description text.
    ${Description},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Models.Api20220501.IResourceBaseProperties]
    # The asset property dictionary.
    # To construct, see NOTES section for PROPERTY properties and create a hash table.
    ${Property},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Models.Api20220501.IResourceBaseTags]
    # Tag dictionary.
    # Tags can be added, removed, and updated.
    # To construct, see NOTES section for TAG properties and create a hash table.
    ${Tag}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName

        if ($null -eq [Microsoft.WindowsAzure.Commands.Utilities.Common.AzurePSCmdlet]::PowerShellVersion) {
            [Microsoft.WindowsAzure.Commands.Utilities.Common.AzurePSCmdlet]::PowerShellVersion = $Host.Version.ToString()
        }         
        $preTelemetryId = [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::TelemetryId
        if ($preTelemetryId -eq '') {
            [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::TelemetryId =(New-Guid).ToString()
            [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.module]::Instance.Telemetry.Invoke('Create', $MyInvocation, $parameterSet, $PSCmdlet)
        } else {
            $internalCalledCmdlets = [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::InternalCalledCmdlets
            if ($internalCalledCmdlets -eq '') {
                [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::InternalCalledCmdlets = $MyInvocation.MyCommand.Name
            } else {
                [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::InternalCalledCmdlets += ',' + $MyInvocation.MyCommand.Name
            }
            [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::TelemetryId = 'internal'
        }

        $mapping = @{
            __AllParameterSets = 'Az.MachineLearningServices.custom\New-AzMLWorkspaceDatastoreFileObject';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::ClearTelemetryContext()
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::ClearTelemetryContext()
        throw
    }

    finally {
        $backupTelemetryId = [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::TelemetryId
        $backupInternalCalledCmdlets = [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::InternalCalledCmdlets
        [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::ClearTelemetryContext()
    }

}
end {
    try {
        $steppablePipeline.End()

        [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::TelemetryId = $backupTelemetryId
        [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::InternalCalledCmdlets = $backupInternalCalledCmdlets
        if ($preTelemetryId -eq '') {
            [Microsoft.Azure.PowerShell.Cmdlets.MachineLearningServices.module]::Instance.Telemetry.Invoke('Send', $MyInvocation, $parameterSet, $PSCmdlet)
            [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::ClearTelemetryContext()
        }
        [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::TelemetryId = $preTelemetryId

    } catch {
        [Microsoft.WindowsAzure.Commands.Common.MetricHelper]::ClearTelemetryContext()
        throw
    }
} 
}
