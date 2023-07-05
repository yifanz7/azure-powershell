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


    It "File OAuth"  {
        $Error.Clear()     

        $accountname = $testNode.SelectSingleNode("accountName[@id='3']").'#text'
        $accountname2 =$testNode.SelectSingleNode("accountName[@id='4']").'#text' 
 
        $localSrcFile = ".\data\testfile_1K_0"
        $localSrcFileName = "testfile_1K_0"
        $localDestFile = ".\created\testoauth" # test will create the file
        $localDestFileName = "testoauth"
        $shareName = "sharefileoauth"
        $filename = "filefileoauth"
        $dirname = "dir1"
        $filepath = "dir1\test1"

        # create oauth context
        $secpasswd = ConvertTo-SecureString $globalNode.secPwd -AsPlainText -Force
        $cred = New-Object System.Management.Automation.PSCredential ($globalNode.applicationId, $secpasswd)
        Add-AzAccount -ServicePrincipal -Tenant $globalNode.tenantId -SubscriptionId $globalNode.subscriptionId -Credential $cred 

        $ctxoauth = New-AzStorageContext -StorageAccountName $accountname -EnableFileBackupRequestIntent
        $ctxkey = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $accountname).Context
        $ctxoauth2 = New-AzStorageContext -StorageAccountName $accountname2 -EnableFileBackupRequestIntent
        $ctxkey2 = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $accountname2).Context

        New-AzStorageShare -Name $shareName -Context $ctxkey
        Set-AzStorageFileContent -ShareName $shareName -Source $localSrcFile -Path $filename -Context $ctxoauth
        New-AzStorageDirectory -ShareName $shareName -Path $dirname -Context $ctxoauth

        # Share object w/0 fetching properties with OAuth 
        $share = Get-AzStorageShare -Name $shareName -Context $ctxoauth -SkipGetProperty
        $dir = $share | Get-AzStorageFile -Path $dirname 
        $file = $share | Get-AzStorageFile -Path $filename

        # Set and get permission
        $permission = $testNode.permission 
        $response = $share.ShareClient.CreatePermission($permission);
        $key = $response.Value.FilePermissionKey
        $outputPermission = $share.ShareClient.GetPermission($key)
        $outputPermission.Value | Should -Be $permission

        # file handler
        $handleCount = Close-AzStorageFileHandle -ShareName $shareName -CloseAll -Context $ctxoauth -PassThru
        $handleCount | should -be 0
        Close-AzStorageFileHandle -ShareName $shareName -CloseAll -Recursive -Context $ctxoauth
        $share | Close-AzStorageFileHandle -CloseAll
        $dir | Close-AzStorageFileHandle -CloseAll
        $file | Close-AzStorageFileHandle -CloseAll
        Get-AzStorageFileHandle -ShareName $shareName -Context $ctxoauth
        Get-AzStorageFileHandle -ShareName $shareName -Context $ctxoauth -Recursive        
        Get-AzStorageFileHandle -ShareName $shareName -Context $ctxoauth -Recursive -Skip 1 -First 3
        $share | Get-AzStorageFileHandle 
        $dir | Get-AzStorageFileHandle 
        $file | Get-AzStorageFileHandle 

        # upload and download file
        $file = Set-AzStorageFileContent -ShareName $shareName -Source $localSrcFile -Path $filepath -Context $ctxoauth -PassThru -Force
        $file.ShareFileClient.Path | Should -BeLike $filepath
        Get-AzStorageFileContent -ShareName $shareName -Path $filepath -Destination $localDestFile -Context $ctxoauth -Force
        $src = (Get-ChildItem -Path ".\data" -Filter $localSrcFileName).FullName
        $dest = (Get-ChildItem -Path ".\created" -Filter $localDestFileName).FullName
        CompareFileMD5 $src $dest
        Remove-Item $localDestFile

        # file pipeline 
        $file = Set-AzStorageFileContent -ShareName $shareName -Source $localSrcFile -Path $filepath -Context $ctxoauth -PassThru -Force
        $file.ShareFileClient.Path | should -be $filepath
        $file | Get-AzStorageFileContent -Destination $localDestFile -Force
        CompareFileMD5 $src $dest 
        Remove-Item $localDestFile

        # share pipeline 
        $file = $share | Set-AzStorageFileContent -Source $localSrcFile -Path $filepath -PassThru  -Force
        $file.ShareFileClient.Path | should -be $filepath
        $share | Get-AzStorageFileContent -Path $filepath -Destination $localDestFile -Force -Context $ctxoauth
        CompareFileMD5 $src $dest  
        Remove-Item $localDestFile

        # dir pipeline 
        $file = $dir | Set-AzStorageFileContent -Source $localSrcFile -Path test3 -PassThru  -Force    
        $file.ShareFileClient.Path | should -BeLike "dir1?test3"
        $dir | Get-AzStorageFileContent -Path test3 -Destination $localDestFile -Force -Context $ctxoauth
        CompareFileMD5 $src $dest  
        Remove-Item $localDestFile

        # Get and list files 
        $items = Get-AzStorageFile -ShareName $shareName -Context $ctxoauth
        $items.count | should -BeGreaterThan 1

        $items = Get-AzStorageFile -ShareName $shareName -Path $filepath -Context $ctxoauth
        $items.count | should -be 1
        $items[0].ShareFileClient.Path | should -be $filepath

        $items = $share | Get-AzStorageFile 
        $items.count | should -BeGreaterThan 1

        $items = $share | Get-AzStorageFile -Path $dirname
        $items.count | should -be 1
        $items[0].ShareDirectoryClient.Path | should -be $dirname

        $items = $dir | Get-AzStorageFile 
        $items.count | should -BeGreaterThan 1

        $items = $dir | Get-AzStorageFile -Path test1
        $items.count | should -be 1
        $items[0].ShareFileClient.Path | should -BeLike "dir1/test1"

        # Create and delete directory/file 
        $d0 = New-AzStorageDirectory -ShareName $shareName -Path "dirtoDelete" -Context $ctxoauth
        $d1 = $d0 | New-AzStorageDirectory -Path "dir1" 
        $d2 = $share | New-AzStorageDirectory -Path "dirtoDelete/dir2"
        $d3 = $share | New-AzStorageDirectory -Path "dirtoDelete/dir3"

        $f0 = $share | Set-AzStorageFileContent -Source $localSrcFile -Path "dirtoDelete/test0" -PassThru -Force
        $f1 = Set-AzStorageFileContent -ShareName $shareName -Source $localSrcFile -Path "dirtoDelete/dir1/test1" -Context $ctxoauth -PassThru -Force
        $f2 = $d2 | Set-AzStorageFileContent -Source $localSrcFile -Path "test2" -PassThru -Force
        $f3 = $d2 | Set-AzStorageFileContent -Source $localSrcFile -Path "test3" -PassThru -Force

        $items1 = $d0 | Get-AzStorageFile 
        $items1.Count | should -be 4
        $items2 = $d1 | Get-AzStorageFile
        $items2.Count | should -be 1
        $items3 = $d2 | Get-AzStorageFile
        $items3.Count | should -be 2

        # delete them
        Remove-AzStorageFile -ShareName $shareName -Path "dirtoDelete/dir1/test1" -Context $ctxoauth -PassThru
        $d2 | Remove-AzStorageFile -Path "test2" 
        $f3 | Remove-AzStorageFile 
        $share  | Remove-AzStorageFile -Path "dirtoDelete/test0" 
        Remove-AzStorageDirectory -ShareName $shareName -Path "dirtoDelete/dir1" -Context $ctxoauth
        $d0  | Remove-AzStorageDirectory -Path "dir2" 
        $d3  | Remove-AzStorageDirectory 
        $items1 = $d0 | Get-AzStorageFile 
        $items1.Count | should -be 0
        $share  | Remove-AzStorageDirectory -Path "dirtoDelete" -PassThru

        New-AzStorageContainer -Name $shareName -Context $ctxoauth -ErrorAction SilentlyContinue
        $b = Set-AzStorageblobContent -Container $shareName -File $localSrcFile -blob testblob -Context $ctxoauth -Force
        New-AzStorageShare -Name $shareName -Context $ctxkey2 -ErrorAction SilentlyContinue
        New-AzStorageDirectory -ShareName $shareName -Path dir1 -Context $ctxoauth2 -ErrorAction SilentlyContinue
        Set-AzStorageFileContent -ShareName $shareName -Source $localSrcFile -Path dir1/test1 -Context $ctxoauth -Force
        $Error.Clear()

        # copy 
        $fsrc = Get-AzStorageFile -ShareName $shareName -Path dir1/test1 -Context $ctxoauth
        $f = Start-AzStorageFileCopy -SrcShareName $shareName -SrcFilePath dir1/test1 -DestShareName $shareName -DestFilePath dir1/copydest -Context $ctxkey -DestContext $ctxoauth2 -Force
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -be $fsrc.Length
        $f = Start-AzStorageFileCopy -SrcShareName $shareName -SrcFilePath dir1/test1 -DestShareName $shareName -DestFilePath dir1/copydest -Context $ctxoauth -Force
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -be $fsrc.Length

        $f = Start-AzStorageFileCopy -SrcContainerName  $shareName -SrcBlobName testblob -DestShareName $shareName -DestFilePath dir1/copydest -Context $ctxoauth -DestContext $ctxoauth2 -Force
        $copystatus = Get-AzStorageFileCopyState -ShareName $shareName -FilePath $f.ShareFileClient.Path -Context $ctxoauth2 -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -be $b.Length      
        $copystatus.Status | should -be Success
        $copystatus.Source| should -BeLike "$($b.ICloudBlob.SnapshotQualifiedStorageUri.PrimaryUri.ToString())*"
        $copystatus.TotalBytes | should -be $b.Length
        $copystatus.BytesCopied | should -be $b.Length

        $f = Start-AzStorageFileCopy -SrcContainerName  $shareName -SrcBlobName testblob -DestShareName $shareName -DestFilePath dir1/copydest -Context $ctxoauth -Force
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -Be $b.Length


        $f1 = Get-AzStorageFile -ShareName $shareName -Path dir1/test1 -Context $ctxoauth
        $fd = Get-AzStorageFile -ShareName $shareName  -Path dir1/copydest -Context $ctxoauth

        $f2 = $f1  | Start-AzStorageFileCopy  -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth 
        $f2 | Get-AzStorageFileCopyState -WaitForComplete
        $f2.ShareFileClient.AccountName | should -be $ctxoauth.StorageAccountName
        $f2.ShareFileClient.Path | should -be "dir1/copydest"
        $f2.FileProperties.ContentLength | should -Be $f1.Length

        $f2 = Start-AzStorageFileCopy -SrcFile $f1.CloudFile  -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth
        $f2 | Get-AzStorageFileCopyState -WaitForComplete
        $f2.ShareFileClient.AccountName | should -be $ctxoauth.StorageAccountName
        $f2.ShareFileClient.Path | should -be "dir1/copydest"
        $f2.FileProperties.ContentLength | should -Be $f1.Length
                
        $f1 = Get-AzStorageFile -ShareName $shareName -Path dir1/test1 -Context $ctxkey
        $fdest = Get-AzStorageFile -ShareName $shareName -Path dir1/copydest -Context  $ctxoauth2
        $f2 = Start-AzStorageFileCopy -SrcFile $f1.CloudFile  -DestShareFileClient $fdest.ShareFileClient -Force -DestContext $ctxoauth2   
        $f2 | Get-AzStorageFileCopyState -WaitForComplete
        $f2.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f2.ShareFileClient.Path | should -be "dir1/copydest"
        $f2.FileProperties.ContentLength | should -Be $f1.Length
         
        $f2 = $f1  | Start-AzStorageFileCopy  -DestShareFileClient $fdest.ShareFileClient -Force -DestContext $ctxoauth2 
        $copystatus = $f2 | Get-AzStorageFileCopyState -WaitForComplete
        $f2.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f2.ShareFileClient.Path | should -be "dir1/copydest"
        $f2.FileProperties.ContentLength | should -Be $f1.Length       
        $copystatus.Status | should -be Success
        $copystatus.Source| should -BeLike "$($f1.CloudFile.SnapshotQualifiedStorageUri.PrimaryUri.ToString())*"
        $copystatus.TotalBytes | should -be $f1.Length
        $copystatus.BytesCopied | should -be $f1.Length

        $s = Get-AzStorageShare -Name $shareName -Context $ctxkey
        $f2 = Start-AzStorageFileCopy -SrcShare $s.CloudFileShare -SrcFilePath dir1/test1 -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth2 
        $copystatus = $f2 | Get-AzStorageFileCopyState -WaitForComplete
        $f2.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f2.ShareFileClient.Path | should -be "dir1/copydest"
        $f2.FileProperties.ContentLength | should -Be (Get-AzStorageFile -ShareName $shareName -Path dir1/test1 -Context $ctxoauth).Length
        #check copy status
        $srcfile = Get-AzStorageFile -ShareName $shareName -Path dir1/test1 -Context $ctxoauth       
        $copystatus.Status | should -be Success
        $copystatus.Source| should -BeLike "$($srcfile.CloudFile.SnapshotQualifiedStorageUri.PrimaryUri.ToString())*"
        $copystatus.TotalBytes | should -be $srcfile.Length
        $copystatus.BytesCopied | should -be $srcfile.Length

        $b = Get-AzStorageBlob -Containe $shareName -Blob testblob -Context $ctxoauth
        $bs = $b.ICloudBlob
        $bs.FetchAttributes()

        $f = $b | Start-AzStorageFileCopy  -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth2
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -Be $b.Length

        $f = Start-AzStorageFileCopy -SrcBlob $b.ICloudBlob  -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth2 
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -Be $b.Length

        $fdest = Get-AzStorageFile -ShareName $shareName -Path dir1/copydest -Context $ctxoauth2
        $f = Start-AzStorageFileCopy -SrcBlob $bs -DestShareFileClient $fdest.ShareFileClient -destContext $ctxoauth2 -Force
        $copystatus = $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -Be $bs.Properties.Length
        #check copy status      
        $copystatus.Status | should -be Success
        $copystatus.Source| should -BeLike "$($bs.SnapshotQualifiedStorageUri.PrimaryUri.ToString())*"
        $copystatus.TotalBytes | should -be $bs.Properties.Length
        $copystatus.BytesCopied | should -be $bs.Properties.Length

        # from container object
        $c = Get-AzStorageContainer -Name  $shareName -Context $ctxoauth
        $f = Start-AzStorageFileCopy -SrcContainer $c.CloudBlobContainer -SrcBlobName testblob -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth2
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        $f.FileProperties.ContentLength | should -Be $b.Length
        # from Uri
        $uri1 = New-AzStorageFileSASToken -ShareName $shareName -Path dir1/test1 -Permission rwdl -FullUri -Context $ctxkey 
        $f = Start-AzStorageFileCopy -AbsoluteUri $uri1  -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth2
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        #$f.FileProperties.ContentLength | should -Be $f1.Length

        $f = Start-AzStorageFileCopy -AbsoluteUri $uri1  -DestShareFileClient $fdest.ShareFileClient -destContext  $ctxoauth2 -Force 
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"

        $f = Start-AzStorageFileCopy -AbsoluteUri $uri1  -DestShareName $shareName -DestFilePath dir1/copydest -Force -DestContext $ctxoauth2 
        $f | Get-AzStorageFileCopyState -WaitForComplete
        $f.ShareFileClient.AccountName | should -be $ctxoauth2.StorageAccountName
        $f.ShareFileClient.Path | should -be "dir1/copydest"
        #check copy status
        $copystatus = $f | Get-AzStorageFileCopyState 
        $srcfile = Get-AzStorageFile -ShareName $shareName -Path dir1/test1 -Context $ctxoauth     
        $copystatus.Status | should -be Success
        $copystatus.Source| should -BeLike "$($srcfile.CloudFile.SnapshotQualifiedStorageUri.PrimaryUri.ToString())*"
        $copystatus.TotalBytes | should -be $srcfile.Length
        $copystatus.BytesCopied | should -be $srcfile.Length

        # Stop copy 

        $fd = Get-AzStorageFile -ShareName $shareName  -Path dir1/copydest -Context $ctxoauth 
        $error.Clear()
        $stopmessage = $fd | Stop-AzStorageFileCopy -CopyId $fd.FileProperties.CopyId -ErrorAction SilentlyContinue
        $error[0].Exception.Message | should -BeLike "There is currently no pending copy operation*"
        $error.Clear()
        $stopmessage = Stop-AzStorageFileCopy -ShareName $shareName  -FilePath dir1/copydest -Context $ctxoauth -Force -ErrorAction SilentlyContinue
        $error[0].Exception.Message | should -BeLike "There is currently no pending copy operation*"
        $error.Clear()
        $stopmessage = Stop-AzStorageFileCopy -File  $fd.CloudFile -ShareFileClient $fd.ShareFileClient -Context $ctxoauth -Force -ErrorAction SilentlyContinue
        $error[0].Exception.Message | should -BeLike "There is currently no pending copy operation*"
        $error.Clear()

        # should fail
        $Error.Count | should -be 0
        $error.Clear()
        New-AzStorageShare -Name $shareName -Context $ctxoauth -ErrorAction SilentlyContinue
        Get-AzStorageShare -Context $ctxoauth -ErrorAction SilentlyContinue
        Get-AzStorageShare -Name $shareName -Context $ctxoauth -ErrorAction SilentlyContinue
        Remove-AzStorageShare -Name $shareName -Context $ctxoauth -Force -ErrorAction SilentlyContinue
        Set-AzStorageShareQuota -Name $shareName -Quota 1024 -Context $ctxoauth -ErrorAction SilentlyContinue
        New-AzStorageShareStoredAccessPolicy -ShareName $shareName -Policy 123 -Permission rw  -Context $ctxoauth -ErrorAction SilentlyContinue
        Set-AzStorageShareStoredAccessPolicy -ShareName $shareName -Policy 123 -Permission rw  -Context $ctxoauth -ErrorAction SilentlyContinue
        Get-AzStorageShareStoredAccessPolicy -ShareName $shareName -Context $ctxoauth -ErrorAction SilentlyContinue
        Remove-AzStorageShareStoredAccessPolicy -ShareName $shareName -Policy 123 -Context $ctxoauth -ErrorAction SilentlyContinue
        $error.Count | should -be 9
        foreach ($e in $error)
        {
            $e.Exception.Message | should -BeLike "*This API does not support bearer tokens. For OAuth, use the Storage Resource Provider APIs instead. Learn more: https://aka.ms/azurefiles/restapi.*"
        }
        $error.Clear()

        Set-AzStorageServiceMetricsProperty -ServiceType File -MetricsType Hour -Context $ctxoauth -ErrorAction SilentlyContinue
        $error[0].Exception.Message | should -BeLike "*Server failed to authenticate the request. Make sure the value of Authorization header is formed correctly including the signature.*"

         #should fail, since ClouldFile is Mandatory
        $file.ShareFileClient |  Get-AzStorageFileContent  -Destination C:\temp\testfile -Context $ctxoauth  -ErrorAction SilentlyContinue
        $error[0].Exception.Message | should -BeLike "*The input object cannot be bound because it did not contain the information required to bind all mandatory parameters:  File*"

        # should fail since oauth only support with Track2 object 
        $file.CloudFile |  Get-AzStorageFileContent  -Destination $localDestFile -ErrorAction SilentlyContinue 
        $error[0].Exception.Message | should -BeLike "*Only support run action on this Azure file with 'ShareFileClient', not support with 'CloudFile'.*"
        $Error.Count | should -be 3
        $error.Clear()

        # should fail since file sas can only create with sharedkey 
        $file | New-AzStorageFileSASToken -Permission rw -ErrorAction SilentlyContinue
        New-AzStorageFileSASToken -ShareName $shareName -Path $file.ShareFileClient.Path -Permission rw -Context $ctxoauth -ErrorAction SilentlyContinue
        $file | New-AzStorageFileSASToken -Policy 123 -ErrorAction SilentlyContinue
        New-AzStorageFileSASToken -ShareName $shareName -Path $file.ShareFileClient.Path -Policy 123 -Context $ctxoauth -ErrorAction SilentlyContinue
        $share | New-AzStorageShareSASToken -Permission rw  -ErrorAction SilentlyContinue
        New-AzStorageShareSASToken -ShareName $shareName  -Policy 123 -Context $ctxoauth -ErrorAction SilentlyContinue
        $share | New-AzStorageShareSASToken -Permission rw -ErrorAction SilentlyContinue
        New-AzStorageShareSASToken -ShareName $shareName  -Policy 123 -Context $ctxoauth -ErrorAction SilentlyContinue
        $error.Count | should -be 8
        foreach ($e in $error)
        {
            $e.Exception.Message | should -BeLike "*Create File service SAS only supported with SharedKey credentail.*"
        }
        $error.Clear()

        Remove-AzStorageShare -Name $shareName -Context $ctxkey -Force
        Remove-AzStorageShare -Name $shareName -Context $ctxkey2 -Force

        $Error.Count | should -be 0
    }

    It "Test case name"  {
        $Error.Clear()     

        $Error.Count | should -be 0
    }
    
    AfterAll {    
        Remove-AzStorageShare -Name $containerName -Force -Context $ctx -PassThru
        Remove-AzStorageContainer -Name $containerName -Force -Context $ctx -PassThru
    }
}