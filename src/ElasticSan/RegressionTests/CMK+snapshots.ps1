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

################################### CMK ######################################################
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


############################### Snapshot ###################################################

$vgname = ""
$volname = ""
$volname2 = ""
$snapshotname1 = ""
$snapshotname2 = ""

# Create snapshots 
$vg = New-AzElasticSanVolumeGroup -ResourceGroupName $rgname -ElasticSanName $esname -Name $vgname
$vol = New-AzElasticSanVolume -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname -Name $volname -SizeGiB 1 
$snapshot = New-AzElasticSanVolumeSnapshot -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname -Name $snapshotname1 -CreationDataSourceId $vol.Id
$snapshot = New-AzElasticSanVolumeSnapshot -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname -Name $snapshotname2 -CreationDataSourceId $vol.Id

# list snapshots 
$snapshots = Get-AzElasticSanVolumeSnapshot -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname
# Get a snapshot 
$snapshot = Get-AzElasticSanVolumeSnapshot -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname -Name $snapshotname1
# list snapshots of a volume 
$snapshots = Get-AzElasticSanVolumeSnapshot -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname -Filter "volumeName eq $volname"
# create a volume with a snapshot id 
New-AzElasticSanVolume -ElasticSanName $esname -ResourceGroupName $rgname -VolumeGroupName $vgname -Name $volname2 -CreationDataSourceId $snapshot.Id -SizeGiB 1
# remove a snapshot
Remove-AzElasticSanVolumeSnapshot -ResourceGroupName $rgname -ElasticSanName $esname -VolumeGroupName $vgname -Name $snapshotname1