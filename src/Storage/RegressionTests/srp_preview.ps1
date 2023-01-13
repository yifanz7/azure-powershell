# Invoke-Pester C:\Users\weiwei\Desktop\PSH_Script\PSHTest\dataplane.ps1 -Show All -Strict -ExcludeTagFilter "Preview" 

BeforeAll {
    Import-Module D:\code\azure-powershell\src\Storage\RegressionTests\utils.ps1

    [xml]$config = Get-Content D:\code\azure-powershell\src\Storage\RegressionTests\config.xml
    $globalNode = $config.SelectSingleNode("config/section[@id='global']")
    $testNode = $config.SelectSingleNode("config/section[@id='srp']")

    $secpasswd = ConvertTo-SecureString $globalNode.secPwd -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential ($globalNode.applicationId, $secpasswd)
    Add-AzAccount -ServicePrincipal -Tenant $globalNode.tenantId -SubscriptionId $globalNode.subscriptionId -Credential $cred 

    $rgname = $globalNode.resourceGroupName
    $accountName = GetRandomAccountName
    $containerName = GetRandomContainerName
}

Describe "Management plan test - preview" { 
    It "Copy Scope" {
        $Error.Clear()
        
        $accountNameCopyScope = $accountName + "cpys"
        # Create account 
        $account = New-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameCopyScope -Location centraluseuap -SkuName Standard_LRS -Kind StorageV2 -AllowedCopyScope AAD 
        $account.AllowedCopyScope | should -be AAD

        # update account 
        $account = Set-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameCopyScope -AllowedCopyScope PrivateLink
        $account.AllowedCopyScope | should -be PrivateLink

        # clean up
        Remove-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameCopyScope -Force -AsJob

        $Error.Count | should -be 0
    }

    It "LCM TierTo Cold, TierToHot" {
        $Error.Clear()

        $accountNameLCM = $accountName + "lcm"
        $accountNameLCMPremium = $accountName + "lcmp"

        New-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameLCM -SkuName Standard_LRS -Location eastus2
        New-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameLCMPremium -SkuName Premium_LRS -Location eastus2 -Kind BlockBlobStorage

        # TierToCold
        $action1 = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToCold -DaysAfterCreationGreaterThan 50 
        $action1 = Add-AzStorageAccountManagementPolicyAction -InputObject $action1 -BaseBlobAction TierToCool -DaysAfterModificationGreaterThan 50 
        $action1 = Add-AzStorageAccountManagementPolicyAction -InputObject $action1 -SnapshotAction TierToCold -DaysAfterCreationGreaterThan 20
        $filter1 = New-AzStorageAccountManagementPolicyFilter -PrefixMatch prefix1,prefix2 
        $rule1 = New-AzStorageAccountManagementPolicyRule -Name Test1 -Action $action1 -Filter $filter1

        $action2 = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction Delete -daysAfterModificationGreaterThan 100
        $action2 = Add-AzStorageAccountManagementPolicyAction -InputObject $action2 -BaseBlobAction TierToCold -DaysAfterModificationGreaterThan 100 
        $action2 = Add-AzStorageAccountManagementPolicyAction -InputObject $action2 -SnapshotAction TierToCold -DaysAfterCreationGreaterThan 50 
        $filter2 = New-AzStorageAccountManagementPolicyFilter -PrefixMatch prefix1,prefix2 
        $rule2 = New-AzStorageAccountManagementPolicyRule -Name Test2 -Action $action2 -Filter $filter2

        $policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName $rgname -StorageAccountName $accountNameLCM -Rule $rule1,$rule2 
        $policy.Rules.Count | Should -Be 2 
        $policy.Rules[0].Name | Should -Be "Test1"
        $policy.Rules[0].Enabled | Should -Be $true
        $policy.Rules[0].Definition.Actions.BaseBlob.TierToCold.DaysAfterCreationGreaterThan | Should -Be 50
        $policy.Rules[0].Definition.Actions.BaseBlob.TierToCool.DaysAfterModificationGreaterThan | Should -Be 50
        $policy.Rules[0].Definition.Actions.Snapshot.TierToCold.DaysAfterCreationGreaterThan | Should -Be 20
        $policy.Rules[0].Definition.Filters.PrefixMatch.Count | Should -Be 2 
        $policy.Rules[1].Name | Should -Be "Test2"
        $policy.Rules[1].Enabled | Should -Be $true 
        $policy.Rules[1].Definition.Actions.BaseBlob.Delete.DaysAfterModificationGreaterThan | Should -Be 100
        $policy.Rules[1].Definition.Actions.BaseBlob.TierToCold.DaysAfterModificationGreaterThan | Should -Be 100 
        $policy.Rules[1].Definition.Actions.Snapshot.TierToCold.DaysAfterCreationGreaterThan | Should -Be 50
        $policy.Rules[1].Definition.Filters.PrefixMatch.Count | Should -Be 2
     
        $policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName $rgname -StorageAccountName $accountNameLCM -Policy (@{
            Rules=(@{
                Enabled=$false;
                Name="Test3";
                Definition=(@{
                    Actions=(@{
                        BaseBlob=(@{
                            TierToCold=@{DaysAfterCreationGreaterThan=100};
                        });
                    });
                    Filters=(@{
                        BlobTypes=@("blockBlob","appendblob");
                    })
                })
            })
        })
        $policy.Rules.Count | Should -Be 1 
        $policy.Rules[0].Name | Should -Be "Test3"
        $policy.Rules[0].Enabled | Should -Be $false
        $policy.Rules[0].Definition.Actions.BaseBlob.TierToCold.DaysAfterCreationGreaterThan | Should -Be 100
        $policy.Rules[0].Definition.Filters.BlobTypes.Count | Should -Be 2 

        #TierToHot
        $action1 = Add-AzStorageAccountManagementPolicyAction -BaseBlobAction TierToHot -DaysAfterCreationGreaterThan 50 
        $action1 = Add-AzStorageAccountManagementPolicyAction -InputObject $action1 -BaseBlobAction TierToCool -DaysAfterCreationGreaterThan 100
        $filter1 = New-AzStorageAccountManagementPolicyFilter -PrefixMatch prefix1,prefix2 
        $rule1 = New-AzStorageAccountManagementPolicyRule -Name Test1 -Action $action1 -Filter $filter1

        $policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName $rgname -StorageAccountName $accountNameLCMPremium -Rule $rule1
        $policy.Rules.Count | Should -Be 1 
        $policy.Rules[0].Enabled | Should -Be $true 
        $policy.Rules[0].Name | Should -Be "Test1"
        $policy.Rules[0].Definition.Actions.BaseBlob.TierToHot.DaysAfterCreationGreaterThan | Should -Be 50 
        $policy.Rules[0].Definition.Actions.BaseBlob.TierToCool.DaysAfterCreationGreaterThan | Should -Be 100 
        $policy.Rules[0].Definition.Filters.PrefixMatch.Count | Should -Be 2 

        $policy = Set-AzStorageAccountManagementPolicy -ResourceGroupName $rgname -StorageAccountName $accountNameLCMPremium -Policy (@{
            Rules=(@{
                Enabled=$false;
                Name="Test3";
                Definition=(@{
                    Actions=(@{
                        BaseBlob=(@{
                            TierToHot=@{DaysAfterCreationGreaterThan=100};
                        });
                    });
                    Filters=(@{
                        BlobTypes=@("blockBlob","appendblob");
                    })
                })
            })
        })
        $policy.Rules.Count | Should -Be 1 
        $policy.Rules.Name | Should -Be "Test3"
        $policy.Rules[0].Definition.Actions.BaseBlob.TierToHot.DaysAfterCreationGreaterThan | Should -Be 100
        $policy.Rules[0].Definition.Filters.BlobTypes.Count | Should -Be 2

        Remove-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameLCM -Force 
        Remove-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameLCMPremium -Force

    }

    It "Soft failover" -Skip {
        $Error.Clear()
        $accountNameFailover = $accountName + "sfl"
        New-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameFailover -SkuName Standard_RAGRS -Location eastus2euap -Kind StorageV2 

        $a = Get-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameFailover -IncludeGeoReplicationStats
        $a.GeoReplicationStats

        $taskfailover = Invoke-AzStorageAccountFailover -ResourceGroupName $rgname -Name $accountNameFailover -FailoverType Planned -Force -debug
        $taskfailover | Wait-Job
        # TODO: Add validations
        $a = Get-AzStorageAccount -ResourceGroupName $rgname -Name $accountNameFailover
    }
    
    It "TODO" {
        $Error.Clear()

        $Error.Count | should -be 0
    }
    
    AfterAll { 
        #Cleanup 

    }
}