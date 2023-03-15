BeforeAll {
    # Modify the path to your own
    Import-Module .\utils.ps1
    
    [xml]$config = Get-Content .\config.xml
    $globalNode = $config.SelectSingleNode("config/section[@id='global']")
    $testNode = $config.SelectSingleNode("config/section[@id='dataplanePreview']")

    $resourceGroupName = $globalNode.resourceGroupName
    $storageAccountName = $testNode.SelectSingleNode("accountName[@id='1']").'#text'

    $key = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName)[0].Value
    $ctx = New-AzStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $key
    $localSrcFile = ".\data\testfile_1K_0" #The file need exist before test, and should be 512 bytes aligned
    $localSrcFile2 = ".\data\testfile_300M"
    $localDestFile = ".\created\testpreview.txt" # test will create the file
    $containerName = GetRandomContainerName

    New-AzStorageContainer $containerName -Context $ctx
    New-AzStorageShare $containerName -Context $ctx
}

Describe "dataplane test for preview" { 

    It "container access policy -preview"  -Tag "accesspolicy"  {
        $Error.Clear()
        
        $con = get-AzStorageContainer $containerName -Context $ctx

        New-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx -Policy test1 -Permission xcdlrwt -StartTime (Get-Date) -ExpiryTime (Get-Date).AddDays(6)
        New-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx -Policy test2 -Permission ctr -ExpiryTime (Get-Date).AddDays(6)
        $policy = get-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx 
        $policy 
        get-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx -Policy test2
        Set-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx -Policy test2 -Permission xacdlrwt -StartTime (Get-Date).Add(-6) -ExpiryTime (Get-Date).AddDays(365)
        get-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx 
        Remove-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx -Policy test2
        Remove-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx -Policy test1 -PassThru
        get-AzStorageContainerStoredAccessPolicy -Container $containerName -Context $ctx 

        $Error.Count | should -be 0

    }

    It "Cold tier preview" {
        $Error.Clear()

        $accountName = $testNode.SelectSingleNode("accountName[@id='2']").'#text'
        $ctx1 = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $accountName).Context
        $container = New-AzStorageContainer -Name $containerName -Context $ctx1
        
        $blob = Set-AzStorageBlobContent -Container $containerName -File $localSrcFile -Blob test1 -StandardBlobTier Cold -Properties @{"ContentType" = "image/jpeg"} -Metadata @{"tag1" = "value1"} -Context $ctx1
        $blob.Name | Should -Be "test1"
        $blob.AccessTier | Should -Be "Cold"
        $blob.BlobProperties.ContentType | Should -Be "image/jpeg"

        $blob = Set-AzStorageBlobContent -Container $containerName -File $localSrcFile2 -Blob test2 -StandardBlobTier Cold -Context $ctx1
        $blob.Name | Should -Be "test2"
        $blob.AccessTier | Should -Be "Cold"

        $blob.BlobBaseClient.SetAccessTier("Cold")
        $blob.AccessTier | Should -Be "Cold"
        $blob.Name | Should -Be "test2"

        $blob = Get-AzStorageBlob -Container $containerName -Blob test1 -Context $ctx1 
        $blob.AccessTier | Should -Be "Cold"
        $blob.Name | Should -Be "test1"
        $blob.BlobProperties.ContentType | Should -Be "image/jpeg"

        $destBlobName = "destblob1"
        $copyblob = $blob | Copy-AzStorageBlob -DestContainer $containerName -DestBlob $destBlobName -Force
        $copyblob.Name | Should -Be $destBlobName
        $copyblob.AccessTier | Should -Be "Hot"
        $copyBlob.BlobProperties.ContentType | Should -Be "image/jpeg"

        $copyblob = $blob | Copy-AzStorageBlob -DestContainer $containerName -DestBlob $destBlobName -StandardBlobTier Cold -Force
        $copyblob.Name | Should -Be $destBlobName
        $copyblob.AccessTier | Should -Be "Cold"
        $copyBlob.BlobProperties.ContentType | Should -Be "image/jpeg"

        $largeBlob = Get-AzStorageBlob -Blob test2 -Container $containerName -Context $ctx1 
        $copyblob = $largeblob | Copy-AzStorageBlob -DestContainer $containerName -DestBlob $destBlobName -StandardBlobTier Cold -Force
        $copyblob.Name | Should -Be $destBlobName
        $copyblob.AccessTier | Should -Be "Cold"

        Start-AzStorageBlobCopy -DestContainer $containerName -DestBlob $destBlobName -StandardBlobTier Cold -SrcContainer $containerName -SrcBlob test1 -Force -Context $ctx1 -RehydratePriority Standard
        $copyblob = Get-AzStorageBlob -Container $containerName -Blob $destBlobName -Context $ctx1
        $copyblob.Name | Should -Be $destBlobName
        $copyblob.AccessTier | Should -Be "Cold"
        $copyBlob.BlobProperties.ContentType | Should -Be "image/jpeg"

        Remove-AzStorageContainer -Name $containerName -Context $ctx1 -Force

    }
    
    AfterAll {    
        Remove-AzStorageShare -Name $containerName -Force -Context $ctx -PassThru
        Remove-AzStorageContainer -Name $containerName -Force -Context $ctx -PassThru
    }
}