Add-AzAccount

$keyvaultname = ""
$keyname = ""
$keyvaultUri = ""

$rgname = ""
$esname = ""

$useridentityname1 = ""
$useridentityname2 = ""
$useridentity = Get-AzUserAssignedIdentity -ResourceGroupName $rgname -Name $useridentityname1
$useridentity2 = Get-AzUserAssignedIdentity -ResourceGroupName $rgname -Name $useridentityname2

# CMK + SAI 
# 1. Create a key vault with a key in it. Key type should be RSA. Assign key vault the access to the current user 
# 2. PUT a volume group with PMK and a system assigned identity with it
$vgname = ""
$vg = New-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -IdentityType SystemAssigned -ProtocolType Iscsi -Encryption EncryptionAtRestWithPlatformKey

# 3. Get the system identity's principalId from the response of PUT volume group request. Grant access to  the system assigned identity to the key vault created in  step1 (key permissions: Get, Unwrap Key, Wrap Key) 
Set-AzKeyVaultAccessPolicy -VaultName $keyvaultname -ResourceGroupName $rgname -ObjectId $vg.IdentityPrincipalId -PermissionsToKeys get,UnwrapKey,WrapKey -BypassObjectIdValidation

# 4. PATCH the volume group with the key created in step 1 
$vg = Update-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -Encryption EncryptionAtRestWithCustomerManagedKey -KeyName $keyname -KeyVaultUri $keyvaultUri

# CMK + SAI -> CMK + UAI/SAI
$vg = Update-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -IdentityType "SystemAssigned,UserAssigned" -KeyName $keyname -KeyVaultUri $keyvaultUri -EncryptionUserAssignedIdentity $useridentity.Id -IdentityUserAssignedIdentityId $useridentity.Id

# CMK + UAI/SAI -> CMK + UAI
$vg = Update-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -IdentityType "UserAssigned" -KeyName $keyname -KeyVaultUri $keyvaultUri  -EncryptionUserAssignedIdentity $useridentity.Id -IdentityUserAssignedIdentityId $useridentity.Id


# CMK + UAI 
# 1. Create an user assigned identity and grant it the access to the key vault 
$useridentity = Get-AzUserAssignedIdentity -ResourceGroupName $rgname -Name $useridentityname1

# 2. PUT a volume group with CMK 
$vgname = ""
New-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -IdentityType UserAssigned -IdentityUserAssignedIdentity $useridentity.Id -Encryption EncryptionAtRestWithCustomerManagedKey -KeyName $keyname -KeyVaultUri $keyvaultUri -EncryptionUserAssignedIdentity $useridentity.Id -ProtocolType Iscsi

# 3. Create a volume under the volume group 
New-AzElasticSanVolume -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname -Name testvol1 -SizeGiB 1 


# CMK + UAI1 --> UAI2 

$useridentity2 = Get-AzUserAssignedIdentity -ResourceGroupName $rgname -Name $useridentityname2

Update-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -IdentityType UserAssigned -IdentityUserAssignedIdentityId $useridentity2.Id -EncryptionUserAssignedIdentity $useridentity2.Id


# CMK + UAI -> CMK + SAI 
# 1. Update to PMK 
Update-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -Encryption EncryptionAtRestWithPlatformKey
# 2. Update to SystemAssigned
Update-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname -IdentityType SystemAssigned
# 3. Follow steps in CMK + SAI