# ----------------------------------------------------------------------------------
#
# Copyright Microsoft Corporation
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ----------------------------------------------------------------------------------

<#
.SYNOPSIS
Checks whether the first string contains the second one
#>

$resourceGroupName = "PSCmdletTest-RG"
$automationAccountName = "PSCmdletTestAccount01"

function AssertContains
{
    param([string] $str, [string] $substr, [string] $message)

    if (!$message)
    {
        $message = "Assertion failed because '$str' does not contain '$substr'"
    }
  
    if (!$str.Contains($substr)) 
    {
        throw $message
    }
  
    return $true
}  


<#
.SYNOPSIS
Checks whether the automation account exists
#>
function AutomationAccountExistsFn
{
	try
	{
		$account = Get-AzureRmAutomationAccount -ResourceGroupName $resourceGroupName -Name $automationAccountName
    
		return ($account -ne $null)
	}
	catch
	{
		return $false
	}
}
########################################################################### Automation Scenario Tests ###########################################################################


<#
.SYNOPSIS
 New Graphical Runbook
#>
function Test-CreateRunbookGraph
{
   param(
        [string] $Name
    )

	Assert-True {AutomationAccountExistsFn} "Automation Account does not exist."

    $runbook = New-AzureRmAutomationRunbook `
                        -Name $Name `
                        -ResourceGroupName $resourceGroupName `
                        -AutomationAccountName $automationAccountName `
                        -Description "Test Graph runbook" `
                        -Type Graph `
                        -LogProgress $true `
                        -LogVerbose $true

    Assert-NotNull $runbook "New-AzureRmAutomationRunbook failed to create Graph runbook $Name."

    Write-Output "Create Graph runbook - success."

    # Creating the runbook again MUST fail
    Assert-Throws {New-AzureRmAutomationRunbook `
                        -Name $Name `
                        -ResourceGroupName $resourceGroupName `
                        -AutomationAccountName $automationAccountName `
                        -Description "Test Graph runbook" `
                        -Type Graph `
                        -LogProgress $true `
                        -LogVerbose $true
                   }

    # Remove the runbook
    Remove-AzureRmAutomationRunbook -Name $Name -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Force

    Write-Output "Remove created runbook."

    # Get the runbook again and confirm the call fails, i.e. the runbook is deleted
    Assert-Throws {Get-AzureRmAutomationRunbook `
                        -Name $Name `
                        -ResourceGroupName $resourceGroupName `
                        -AutomationAccountName $automationAccountName
                  }

    Write-Output "Remove runbook - success."
}


<#
.SYNOPSIS
 Import PowerShell runbook
#>
function Test-ImportRunbookPowerShell
{
   param(
        [string] $Name, 
        [string] $RunbookPath
    )

	Assert-True {AutomationAccountExistsFn} "Automation Account does not exist."

    $desc = 'PowerShell Tutorial runbook'
    $tags = @{'TagKey1'='TagValue1'}

    $runbook = Import-AzureRmAutomationRunbook `
                        -Path $RunbookPath `
                        -Description $desc `
                        -Name $Name `
                        -Type PowerShell `
                        -ResourceGroup $resourceGroupName `
                        -Tags $tags `
                        -LogProgress $true `
                        -LogVerbose $true `
                        -AutomationAccountName $automationAccountName `
                        -Published 

    Assert-NotNull $runbook "Import-AzureRmAutomationRunbook failed to import PowerShell script runbook $Name."

	Write-Output "Runbook Name: $($runbook.Name)"
	Write-Output "Runbook State: $($runbook.State)"
    Assert-True { $runbook.Name -ieq $Name } "Import-AzureRmAutomationRunbook did not import runbook of type PowerShell successfully."
    Assert-True { $runbook.State -ieq 'Published' } "Import-AzureRmAutomationRunbook did not Publish the PowerShell runbook, as requested."

    Write-Output "Import Graphical runbook - success."

    # Remove the runbook
    Remove-AzureRmAutomationRunbook -Name $Name -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Force

    Write-Output "Remove created runbook."

    # Get the runbook again and confirm the call fails, i.e. the runbook is deleted
    Assert-Throws {Get-AzureRmAutomationRunbook `
                        -Name $Name `
                        -ResourceGroupName $resourceGroupName `
                        -AutomationAccountName $automationAccountName
                  }

    Write-Output "Remove runbook - success."
}

<#
.SYNOPSIS
 Import Graphical runbook, verify; Delete it and verify
#>
function Test-ImportAndDeleteRunbookGraphical
{
   param(
        [string] $Name, 
        [string] $RunbookPath
    )

    Assert-True {AutomationAccountExistsFn} "Automation Account does not exist."

	$desc = 'Graphical Tutorial runbook'
    $tags = @{'TagKey1'='TagValue1'}

    $runbook = Import-AzureRmAutomationRunbook `
                        -Path $RunbookPath `
                        -Description $desc `
                        -Name $Name `
                        -Type Graph `
                        -ResourceGroup $resourceGroupName `
                        -Tags $tags `
                        -LogProgress $true `
                        -LogVerbose $true `
                        -AutomationAccountName $automationAccountName `
                        -Published 

    Assert-NotNull $runbook "Import-AzureRmAutomationRunbook failed to import Graphical runbook $Name."
    Assert-True { $runbook.Name -ieq $Name } "Import-AzureRmAutomationRunbook did not import runbook of type Graph successfully."
    Assert-True { $runbook.State -ieq 'Published' } "Import-AzureRmAutomationRunbook did not Publish the Graph runbook, as requested."

    Write-Output "Import Graphical runbook - success."

    # Remove the runbook
    Remove-AzureRmAutomationRunbook -Name $Name -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Force

    Write-Output "Remove created runbook."

    # Get the runbook again and confirm the call fails, i.e. the runbook is deleted
    Assert-Throws {Get-AzureRmAutomationRunbook `
                        -Name $Name `
                        -ResourceGroupName $resourceGroupName `
                        -AutomationAccountName $automationAccountName
                  }

    Write-Output "Remove runbook - success."
}

<#
.SYNOPSIS
 Start Job of PowerShell Script runbook, get output
   and get Output records (both success & failure records).
#>
function Test-CreateJobAndGetOutputPowerShellScript
{
   param(
        [string] $Name, 
        [string] $RunbookPath
    )

	Assert-True {AutomationAccountExistsFn} "Automation Account does not exist."

    $desc = 'PowerShell Script runbook'
    $tags = @{'TagKey1'='TagValue1'}

    $runbook = Import-AzureRmAutomationRunbook `
                        -Path $RunbookPath `
                        -Description $desc `
                        -Name $Name `
                        -Type PowerShell `
                        -ResourceGroup $resourceGroupName `
                        -Tags $tags `
                        -LogProgress $true `
                        -LogVerbose $true `
                        -AutomationAccountName $automationAccountName `
                        -Published 

    Assert-NotNull $runbook "Import-AzureRmAutomationRunbook failed to import PowerShell Script runbook $Name."

    $job = Start-AzureRmAutomationRunbook -Name $Name -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Parameters $null

    Assert-True { $job.Status -ieq 'New' } "Start-AzureRmAutomationRunbook failed to create job for PowerShell Script runbook!"
    $jobId = $job.JobId

    Write-Output "Create Job of PowerShell runbook - success."

	# Wait for max 6 minutes and keep checking for the status of the job
	$waitTime = 0

	while ($waitTime -lt 360)
	{
		sleep -Seconds 60
		$waitTime += 60

		# Get Job and check the status 
		$job = Get-AzureRmAutomationJob -Id $jobId -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName
		Assert-True { $job.JobId -ieq $jobId } "Get-AzureRmAutomationJob failed to get automation job!"

		if ($job.Status -ieq 'Failed')
		{ $waitTime = 360 }
	}
	 
    # Verify that there are at least 5 output records for the Job
    $allOutput = Get-AzureRmAutomationJobOutput -Id $jobId -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Stream Any
    Assert-True { $allOutput.Count -gt 0 } "Get-AzureRmAutomationJobOutput failed to get automation Job Output!" 

    Write-Output "Get $($allOutput.Count) output records - success."

    # Get the output of type Error
    $errOutput = Get-AzureRmAutomationJobOutput -Id $jobId -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Stream Error
	$streamId = $errOutput.StreamRecordId
    Assert-True { $errOutput.Type -eq 'Error' } "Get-AzureRmAutomationJobOutput failed to get automation Job Error record!"

    Write-Output "Get error output of the job - success."

    # Get a single Error ouput record
    $errRecord = Get-AzureRmAutomationJobOutputRecord -JobId $jobId -Id $streamId -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName
    Assert-True { $errRecord -ne $null } "Get-AzureRmAutomationJobOutputRecord failed to get automation Job Error record Output!"

    Write-Output "Get single error record of the job - success."

    # Remove the runbook
    Remove-AzureRmAutomationRunbook -Name $Name -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Force

    Write-Output "Remove created runbook."

    # Get the runbook again and confirm the call fails, i.e. the runbook is deleted
    Assert-Throws {Get-AzureRmAutomationRunbook `
                        -Name $Name `
                        -ResourceGroupName $resourceGroupName `
                        -AutomationAccountName $automationAccountName
                  }

    Write-Output "Remove runbook - success."
}
