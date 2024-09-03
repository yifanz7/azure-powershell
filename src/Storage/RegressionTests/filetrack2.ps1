Import-Module D:\code\pshrepo\azure-powershell\artifacts\Debug\Az.Accounts\Az.Accounts.psd1
Import-Module D:\code\pshrepo\azure-powershell\artifacts\Debug\Az.Storage\Az.Storage.psd1 

$accountname = "yifantestaccount1" #yifantestpfile2
$rgname = "yifanz1" 

# Update-AzStorageFileServiceProperty -ResourceGroupName $rgname -StorageAccountName $accountname -EnableShareDeleteRetentionPolicy $true -ShareRetentionDays 10

$ctx = (Get-AzStorageAccount -ResourceGroupName $rgname -Name $accountname).Context
$ctxoauth = New-AzStorageContext -StorageAccountName $accountname -EnableFileBackupRequestIntent
$sastoken = New-AzStorageAccountSASToken -Service Blob,File,Table,Queue -Context $ctx -ResourceType Object,Container,Service -Permission racwdlup -ExpiryTime 2222-01-01
$ctxsas = New-AzStorageContext -StorageAccountName $accountname -SasToken $sastoken

# Create shares 
$share = New-AzStorageShare -Name testshare1 -Context $ctx 
$share.Name | Should -Be "testshare1" 

$share = New-AzStorageShare -Name testshare2 -Context $ctxsas
$share.Name | Should -Be "testshare2"
# create a share snapshot 
$share.ShareClient.CreateSnapshot()
$share.ShareClient.CreateSnapshot()

$share = New-AzStorageShare -Name newtestshare1 -Context $ctxsas
$share.Name | Should -Be "newtestshare1"

# List shares 
$shares = Get-AzStorageShare -Context $ctx 
$shares.Count | Should -Be 5 
$shares = Get-AzStorageShare -Context $ctxsas 
$shares.Count | Should -Be 5 
$shares = Get-AzStorageShare -Prefix "test" -Context $ctx 
$shares.Count | Should -Be 4
$shares = Get-AzStorageShare -Prefix "test" -Context $ctxsas
$shares.Count | Should -Be 4 

New-AzStorageShare -Name testshare4 -Context $ctx 
Remove-AzStorageShare -Name testshare4 -Context $ctx -Force
# List shares including deleted shares 
$shares = Get-AzStorageShare -Context $ctx -IncludeDeleted
$shares = Get-AzStorageShare -Context $ctxsas -IncludeDeleted

# Set share quota 
$share = Get-AzStorageShare -Name newtestshare1 -Context $ctx 
$share = Set-AzStorageShareQuota -ShareName newtestshare1 -Quota 200 -Context $ctx 
$share.Quota | Should -Be 200
$share = Set-AzStorageShareQuota -ShareName newtestshare1 -Quota 200 -Context $ctxsas 
$share.Quota | Should -Be 200
$share = $share | Set-AzStorageShareQuota -Quota 300
$share.Quota | Should -Be 300
$share = Set-AzStorageShareQuota -ShareClient $share.ShareClient -Quota 400 -Context $ctxsas
$share.Quota | Should -Be 400
$share = Set-AzStorageShareQuota -ShareClient $share.ShareClient -Quota 400 -Context $ctx
$share.Quota | Should -Be 400

# Get a share 
$share = Get-AzStorageShare -Name testshare1 -Context $ctx
$share.Name | Should -Be "testshare1"
$share.IsSnapshot | Should -Be $false

$share = Get-AzStorageShare -Name testshare1 -Context $ctxsas
$share.Name | Should -Be "testshare1"
$share.IsSnapshot | Should -Be $false

$shareskip = Get-AzStorageShare -Name testshare1 -SkipGetProperty -Context $ctx 
$shareskip.Quota | Should -Be $null
$shareskip.LastModified | Should -Be $null
$shareskip = Get-AzStorageShare -Name testshare1 -SkipGetProperty -Context $ctxsas
$shareskip.Quota | Should -Be $null
$shareskip.LastModified | Should -Be $null

# Get a share snapshot 
$sharesnapshot = Get-AzStorageShare -Context $ctxsas | ?{$_.SnapshotTime -ne $null} | Select-Object -First 1
$sharesnapshot = Get-AzStorageShare -Name testshare2 -SnapshotTime $sharesnapshot.SnapshotTime -Context $ctx
$sharesnapshot.SnapshotTime | Should -Not -Be $null

# remove share 
$sharetoremove = New-AzStorageShare -Name testsharetoremove -Context $ctx 
$sharetoremove.ShareClient.CreateSnapshot()
$sharetoremove.ShareClient.CreateSnapshot()
$sharetoremove.ShareClient.CreateSnapshot()
$snapshot = Get-AzStorageShare -Context $ctx | ?{($_.SnapshotTime -ne $null) -and ($_.Name -eq "testsharetoremove")} | Select-Object -First 1
Remove-AzStorageShare -Name testsharetoremove -SnapshotTime $snapshot.SnapshotTime -Force -PassThru -Context $ctx 
$sharetoremove | Remove-AzStorageShare -IncludeAllSnapshot -Force -PassThru

$sharetoremove = New-AzStorageShare -Name testsharetoremove2 -Context $ctx
Remove-AzStorageShare -ShareClient $sharetoremove.ShareClient -Force -Context $ctxsas


# share access policy
# creare share access policy 
New-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p001 -Permission "rwdl" -StartTime 2023-01-01 -ExpiryTime 2111-01-01 -Context $ctx
$share = Get-AzStorageShare -Name testshare1 -Context $ctx 
$share | New-AzStorageShareStoredAccessPolicy -Policy p002 -Permission "rwdl"

$policy = Get-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p001 -Context $ctx
$policy.Policy | Should -Be "p001"
$policy = $share | Get-AzStorageShareStoredAccessPolicy -Policy p001 
$policy.Policy | Should -Be "p001"
$policy.Permissions | Should -Be "rwdl" 

$policy = Get-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p002 -Context $ctx
$policy.Policy | SHould -Be "p002"

# list share access policies
New-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p003 -Permission "rwdl" -ExpiryTime 2111-01-01 -Context $ctx 
New-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p004 -Permission "rwdl" -StartTime 2023-01-01  -Context $ctx 
$share | New-AzStorageShareStoredAccessPolicy -Policy p005 -Permission "rwdl" 

$policies = Get-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Context $ctx 
$policies.Count | Should -Be 5

$policies = $share | Get-AzStorageShareStoredAccessPolicy
$policies.Count | Should -Be 5

# get a single share access policy
$policy = Get-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p001 -Context $ctx
$policy.Policy | Should -Be "p001"
$policy = $share | Get-AzStorageShareStoredAccessPolicy -Policy p001 
$policy.Policy | Should -Be "p001"
$policy = $policy | Get-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Context $ctx 
$policy.Policy | Should -Be "p001"

# update a share access policy 

$policy = Set-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p002 -StartTime 2023-01-01 -ExpiryTime 2111-01-01 -Permission "rwld" -Context $ctx
$policy.Policy | Should -Be p002 
$policy.StartTime | Should -Not -Be $null
$policy.ExpiryTime | Should -Not -Be $null
$policy.Permissions | Should -Be "rwdl"

$policy = $share | Set-AzStorageShareStoredAccessPolicy -Policy p002 -NoStartTime -NoExpiryTime 
$policy.Policy | Should -Be p002 
$policy.StartTime | Should -Be $null
$policy.ExpiryTime | Should -Be $null

# remove share access policy
Remove-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p004 -Context $ctx 
$share | Remove-AzStorageShareStoredAccessPolicy -Policy p005 
$policy= Get-AzStorageShareStoredAccessPolicy -ShareName testshare1 -Policy p003 -Context $ctx 
$policy | Remove-AzStorageShareStoredAccessPolicy -ShareName testshare1 -context $ctx 

# create share SAS token
$shareSASToken = New-AzStorageShareSASToken -ShareName testshare1 -Permission rwdl -Protocol HttpsOrHttp -IPAddressOrRange "0.0.0.0-255.255.255.255" -StartTime 2024-05-01 -ExpiryTime 2222-01-01 -Context $ctx 
$shareSASCtx1 = New-AzStorageContext -SasToken $shareSASToken -StorageAccountName $accountname
Get-AzStorageFile -ShareName testshare1 -Context $shareSASCtx1

$shareSASToken2 = $share | New-AzStorageShareSASToken -Permission "rwdl"
$shareSASCtx2 = New-AzStorageContext -SasToken $shareSASToken2 -StorageAccountName $accountname
Get-AzStorageFile -ShareName testshare1 -Context $shareSASCtx2

$shareSASToken3 = New-AzStorageShareSASToken -ShareName testshare1 -Policy p001 -Context $ctx 
$shareSASCtx3 = New-AzStorageContext -SasToken $shareSASToken3 -StorageAccountName $accountname
Get-AzStorageFile -ShareName testshare1 -Context $shareSASCtx3


# create directory 
$dir = New-AzStorageDirectory -ShareName testshare1 -Path dir1 -Context $ctxoauth 
$dir.Name | Should -Be "dir1" 

$dir = $share | New-AzStorageDirectory -Path "dir2..." 
$dir3 = New-AzStorageDirectory -ShareName testshare1 -Path dir3... -DisAllowTrailingDot -Context $ctx 
$dir3.Name | Should -Be "dir3..."

$share = Get-AzStorageShare -Name testshare1 -Context $ctx 
$dir4 = $share | New-AzStorageDirectory -path dir4 
$dir4.Name | Should -Be "dir4"

$dir4a = $dir4 | New-AzStorageDirectory -path dir4a
$dir4a.Name | Should -Be "dir4a"

$dir = New-AzStorageDirectory -ShareClient $share.ShareClient -Path "dir5" -Context $ctxoauth
$dir.Name | Should -Be "dir5"
$dir = New-AzStorageDirectory -ShareDirectoryClient $dir.ShareDirectoryClient -Path "dir5a..." -Context $ctxoauth
$dir.Name | Should -Be "dir5a..."
$dir.ShareDirectoryClient.Path | Should -Be "dir5/dir5a..."
$dir.ShareDirectoryClient.ShareName | Should -Be "testshare1"

$dir | New-AzStorageDirectory -Path "dir5a1" 


# should fail: Get directory with trailing dots 
$dir = Get-AzStorageFile -ShareName testshare1 -Path "dir1..." -Context $ctx 
# should succeed: Get directory with disallowTrailingDot 
$dir = Get-AzStorageFile -ShareName testshare1 -Path "dir1..." -DisAllowTrailingDot -Context $ctxoauth 


# Get a single directory
$dir = Get-AzStorageFile -ShareName testshare1 -path dir1 -Context $ctxoauth
$dir.Name | Should -Be "dir1"
$dir.ShareDirectoryClient.ShareName | Should -Be "testshare1"

$dir = Get-AzStorageFile -ShareName testshare1 -path dir1... -DisAllowTrailingDot -Context $shareSASCtx3 
$dir.Name | Should -Be "dir1..."
$dir.ShareDirectoryClient.ShareName | Should -Be "testshare1"

$dir = Get-AzStorageFile -ShareClient $share.ShareClient -Path "dir1" -Context $ctxsas
$dir.Name | Should -Be "dir1"
$dir.ShareDirectoryClient.ShareName | Should -Be "testshare1"

$dir = $share | Get-AzStorageFile -Path "dir2..." 
$dir.Name | Should -Be "dir2..."

$parentdir = Get-AzStorageFile -ShareName testshare1 -Path dir4 -Context $ctxoauth
$dir = $parentdir | Get-AzStorageFile -Path dir4a 
$dir.Name | Should -Be "dir4a"
$dir.ShareDirectoryClient.ShareName | Should -Be "testshare1"

$dir = Get-AzStorageFile -ShareDirectoryClient $parentdir.ShareDirectoryClient -Path "dir4a"
$dir.Name | Should -Be "dir4a"
$dir.ShareDirectoryClient.ShareName | Should -Be "testshare1"

$files = $parentdir | Get-AzStorageFile 
$files.Count | Should -BeGreaterOrEqual 1 

$files = Get-AzStorageFile -ShareDirectoryClient $parentdir.ShareDirectoryClient 
$files.Count | Should -BeGreaterOrEqual 1 

# List files/directories under a share 
$files = Get-AzStorageFile -ShareName testshare1 -Context $ctxoauth
$files.Count | Should -BeGreaterThan 1 

$files = $share | Get-AzStorageFile 
$files.Count | Should -BeGreaterThan 1 

$files = Get-AzStorageFile -ShareClient $share.ShareClient -Context $ctxsas
$files.Count | Should -BeGreaterThan 1 

# Upload file 
New-AzStorageDirectory -ShareName testshare1 -Path dir2 -Context $ctxoauth
Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path "dir2.../file1" -Context $ctx -Force
Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path "dir2/file1" -Context $ctx -Force -PassThru
Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path "dir2/file1.png" -Context $ctx -Force -PassThru
Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path "dir2/file1.png..." -Context $ctxsas -Force -PassThru
Set-AzStorageFileContent -ShareName testshare1 -Source D:\test30mb -Path "dir2/file1_30" -Context $ctxoauth -Force -PassThru

Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path "dir2/file2..." -DisAllowTrailingDot -Force -PassThru -Context $ctxoauth
$f = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file2" -Context $ctxoauth
$f.name | Should -Be "file2"

$share = Get-AzStorageShare -Name testshare1 -Context $ctx 
$share | Set-AzStorageFileContent -Source D:\test30mb -Path "dir2/file3..." -PassThru -Force
$f = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file3..." -Context $ctxoauth
$f.Name | Should -Be "file3..."
$share | Set-AzStorageFileContent -Source D:\test512 -Path "dir2/file4" -PassThru -Force

$dir = Get-AzStorageFile -ShareName testshare1 -Path dir2 -Context $ctx
$dir | Set-AzStorageFileContent -Source D:\test30mb -Path "file5" -PassThru -Force
$f = $dir | Get-AzStorageFile -Path "file5" 
$f.Name | Should -Be "file5"

$dir | Set-AzStorageFileContent -Source D:\test512 -Path "file55..." -PassThru -Force
$f = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file55..." -Context $ctx 
$f.Name | Should -Be "file55..."

$dir = Get-AzStorageFile -ShareName testshare1 -Path dir2... -Context $ctxoauth 
$dir | Set-AzStorageFileContent -Source D:\test30mb -Path "file6" -PassThru -Force
$f = $dir | Get-AzStorageFile -Path "file6" 
$dir | Set-AzStorageFileContent -Source D:\test512 -Path "file7.." -PassThru -Force
$f = $dir | Get-AzStorageFile -Path "file7.."
$f.Name | Should -Be "file7.." 

Set-AzStorageFileContent -Source D:\test30mb -Path "dir2/file3..." -PassThru -Force -ShareClient $share.ShareClient -Context $ctx
Set-AzStorageFileContent -Source D:\test30mb -Path "dir2/file3..." -PassThru -Force -ShareClient $share.ShareClient -Context $ctxsas
Set-AzStorageFileContent -Source D:\test30mb -Path "dir2/file3..." -PassThru -Force -ShareClient $share.ShareClient -Context $ctxoauth

Set-AzStorageFileContent -Source D:\test512 -Path "file6" -ShareDirectoryClient $dir.ShareDirectoryClient -Context $ctx -Force
Set-AzStorageFileContent -Source D:\test512 -Path "file6" -ShareDirectoryClient $dir.ShareDirectoryClient -Context $ctxsas -Force
Set-AzStorageFileContent -Source D:\test512 -Path "file6" -ShareDirectoryClient $dir.ShareDirectoryClient -Context $ctxoauth -Force

# Download file 
# share name and path 
Get-AzStorageFileContent -ShareName testshare1 -Path "dir2/file1" -Destination D:\testdownloadfile -Context $ctx -Force -PassThru 
Get-AzStorageFileContent -ShareName testshare1 -Path "dir2/file1..." -Destination D:\testdownloadfile\file1dot -Context $ctxoauth -DisAllowTrailingDot -Force -PassThru
Get-AzStorageFileContent -ShareName testshare1 -Path "dir2/file1..." -Destination D:\testdownloadfile -Context $ctxoauth -DisAllowTrailingDot -CheckMd5 -Force -PassThru

# share client 
$share | Get-AzStorageFilecontent -Path "dir2.../file6" -Destination D:\testdownloadfile -Force -PassThru 
$share | Get-AzStorageFileContent -Path "dir2/file4" -Destination D:\testdownloadfile -Force -PassThru -CheckMd5
Get-AzStorageFileContent -ShareClient $share.ShareClient -Path "dir2/file4" -Destination D:\testdownloadfile -Force -PassThru -Context $ctx

#directory client 
$dir = Get-AzStorageFile -ShareName testshare1 -Path "dir2..." -Context $ctx 
$dir | Get-AzStorageFileContent -Path "file6" -Destination D:\testdownloadfile -Force -PassThru
Get-AzStorageFileContent -Path "file6" -ShareDirectoryClient $dir.ShareDirectoryClient -Destination D:\testdownloadfile -Force -PassThru -Context $ctxoauth

$dir = $share | Get-AzStorageFile -Path dir2 
$dir | Get-AzStorageFileContent -Path "file4" -Destination D:\testdownloadfile\file4download -Force -PassThru

# file client 
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctxoauth
$file | Get-AzStorageFileContent -Destination D:\testdownloadfile -Force -PassThru
Get-AzStorageFileContent -ShareFileClient $file.ShareFileClient -Destination D:\testdownloadfile -PassThru -Force -Context $ctxoauth

# get all directories and files under a share 
$files = Get-AzStorageFile -ShareName testshare1 -Context $ctx 
# Get a single file 
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2.../file1" -Context $ctx 
# Get files under a directory 
$dir = Get-AzStorageFile -ShareName testshare1 -Path "dir2..." -Context $ctxoauth
$files = $dir | Get-AzStorageFile 

Get-AzStorageFile -ShareDirectoryClient $dir.ShareDirectoryClient -Context $ctx
Get-AzStorageFile -ShareDirectoryClient $dir.ShareDirectoryClient -Path "file6" -Context $ctxoauth

# Start Copy
# FILE TO FILE 
# [ShareName] share name -> file path
Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "/dir2.../file1......." -DestShareName testshare1 -DestFilePath "dir2.../file2" -DisAllowSourceTrailingDot -Context $ctx -Force
Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "/dir2.../file1......." -DestShareName testshare1 -DestFilePath "dir2.../file2" -DisAllowSourceTrailingDot -Context $ctxoauth -DestContext $ctx -Force


Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "/dir2.../file1.png....." -DestShareName testshare1 -DestFilePath "dir2.../file3png..." -DisAllowSourceTrailingDot -Context $ctx -Force
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2.../file3png..." -Context $ctx
$file.Name | Should -Be "file3png..."


Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "/dir2/file1.png..." -DestShareName testshare1 -DestFilePath "dir2.../file3png..."  -DisAllowDestTrailingDot -Context $ctx -Force
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file3png" -Context $ctx
$file.Name | Should -Be "file3png"

Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "dir2.../file1" -DestShareName testshare1 -DestFilePath "dir2.../file2..." -Context $ctx -Force


$f = Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "dir2.../file1" -DestShareName testshare1 -DestFilePath "dir2.../file2" -Context $ctx -Force
$copystate = $f | Get-AzStorageFileCopyState -WaitForComplete

$f = Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "dir2.../file1" -DestShareName testshare1 -DestFilePath "dir2.../file2" -Context $ctx -Force
Get-AzStorageFileCopyState -ShareName testshare1 -FilePath "dir2.../file2" -Context $ctx 

$f = Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "dir2.../file1" -DestShareName testshare1 -DestFilePath "dir2/file2" -Context $ctx -Force
Get-AzStorageFileCopyState -ShareName testshare1 -FilePath "dir2.../file2" -Context $ctx -DisAllowTrailingDot


# [FileFile] file client to file client 
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctx 
$destFile = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1.png" -Context $ctx 
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareFileClient $destFile.ShareFileClient -Context $ctx -DestContext $ctx -Force 
$file | Start-AzStorageFileCopy -DestShareFileClient $destFile.ShareFileClient -DestContext $ctx -Force

$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctxsas 
$destFile = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1.png" -Context $ctxsas
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareFileClient $destFile.ShareFileClient -Context $ctxsas -DestContext $ctx -Force 
$file | Start-AzStorageFileCopy -DestShareFileClient $destFile.ShareFileClient -DestContext $ctxsas -Force

$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctxoauth 
$destFile = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1.png" -Context $ctxoauth
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareFileClient $destFile.ShareFileClient -Context $ctxoauth -DestContext $ctx -Force 
$file | Start-AzStorageFileCopy -DestShareFileClient $destFile.ShareFileClient -DestContext $ctxsas -Force


# [FileFilePath] file client to file path
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctx
$file | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force
$file | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -DestContext $ctx
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -Context $ctx
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -Context $ctx -DestContext $ctx

# for SAS, the source file context should align with the input context
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctxsas 
$file | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force
$file | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -DestContext $ctx
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -Context $ctxsas
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -Context $ctxsas -DestContext $ctx

$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctxoauth
$file | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force
$file | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -DestContext $ctx
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -Context $ctxoauth
Start-AzStorageFileCopy -SrcFile $file.ShareFileClient -DestShareName testshare1 -DestFilePath "dir2/shareclientfil1" -Force -Context $ctxoauth -DestContext $ctx

# [Share] share object -> file path
$share = Get-AzStorageShare -Name testshare1 -Context $ctx 
Start-AzStorageFileCopy  -SrcShare $share.ShareClient -SrcFilePath "dir2/file1" -DestFilePath "dir2/shareclientfile2" -DestShareName testshare1 -Force -Context $ctx

$share = Get-AzStorageShare -Name testshare1 -Context $ctxsas 
Start-AzStorageFileCopy  -SrcShare $share.ShareClient -SrcFilePath "dir2/file1" -DestFilePath "dir2/shareclientfile2" -DestShareName testshare1 -Force -Context $ctx


# BLOB TO FILE

New-AzStorageContainer -Name testc1 -Context $ctx 
#$container = Get-AzStorageContainer -Name testc1 -Context $ctxsas
Set-AzStorageBlobContent -File D:\test512 -Container testc1 -Blob testblob1 -Context $ctx -Force
#$b = Get-AzStorageBlob -Blob testblob1 -Container testc1 -Context $ctx 

# [ContainerName]
Start-AzStorageFileCopy -SrcBlobName testblob1 -SrcContainerName testc1 -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Context $ctx -Force
Start-AzStorageFileCopy -SrcBlobName testblob1 -SrcContainerName testc1 -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Context $ctxoauth -DestContext $ctxsas -Force

# [BlobFilePath] blob object -> file path 
$b = Get-AzStorageBlob -Blob testblob1 -Container testc1 -Context $ctx 
$b | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force #-DestContext $ctx
$b | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force -DestContext $ctxsas
Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -SrcBlob $b.BlobBaseClient -Force -Context $ctx
Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force -DestContext $ctx -SrcBlob $b.BlobBaseClient -Context $b.Context

$b = Get-AzStorageBlob -Blob testblob1 -Container testc1 -Context $ctxsas 
$b | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force #-DestContext $ctx
$b | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force -DestContext $ctxsas
Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -SrcBlob $b.BlobBaseClient -Force -Context $ctxsas
Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force -DestContext $ctx -SrcBlob $b.BlobBaseClient -Context $b.Context

$b = Get-AzStorageBlob -Blob testblob1 -Container testc1 -Context $ctxoauth 
$b | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force #-DestContext $ctx
$b | Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force -DestContext $ctxsas
Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -SrcBlob $b.BlobBaseClient -Force -Context $ctx
Start-AzStorageFileCopy -DestShareName testshare1 -DestFilePath dir2/testblobfile1 -Force -DestContext $ctx -SrcBlob $b.BlobBaseClient -Context $b.Context

# [BlobFile] blob object -> file object 
$b = Get-AzStorageBlob -Blob testblob1 -Container testc1 -Context $ctx 
$f = Get-AzStorageFile -ShareName testshare1 -Path dir2/file1 -Context $ctx 
Start-AzStorageFileCopy -SrcBlob $b.BlobBaseClient -DestShareFileClient $f.ShareFileClient -Context $ctx -DestContext $ctx -Force

$b = Get-AzStorageBlob -Blob testblob1 -Container testc1 -Context $ctxsas 
$f = Get-AzStorageFile -ShareName testshare1 -Path dir2/file1 -Context $ctxsas 
Start-AzStorageFileCopy -SrcBlob $b.BlobBaseClient -DestShareFileClient $f.ShareFileClient -Context $ctxsas -DestContext $ctxsas -Force

$b = Get-AzStorageBlob -Blob testblob1 -Container testc1 -Context $ctxoauth 
$f = Get-AzStorageFile -ShareName testshare1 -Path dir2/file1 -Context $ctxoauth 
Start-AzStorageFileCopy -SrcBlob $b.BlobBaseClient -DestShareFileClient $f.ShareFileClient -Context $ctxoauth -DestContext $ctxoauth -Force

# [Container] container object -> file path 
$container = Get-AzStorageContainer -Name testc1 -Context $ctx
Start-AzStorageFileCopy -SrcContainer $container.BlobContainerClient -SrcBlobName testblob1 -DestShareName testshare1 -DestFilePath dir2/copyf1  -Force -Context $ctx
Start-AzStorageFileCopy -SrcContainer $container.BlobContainerClient -SrcBlobName testblob1 -DestShareName testshare1 -DestFilePath dir2/copyf1  -Force -Context $ctx -DestContext $ctxsas

$container = Get-AzStorageContainer -Name testc1 -Context $ctxsas
Start-AzStorageFileCopy -SrcContainer $container.BlobContainerClient -SrcBlobName testblob1 -DestShareName testshare1 -DestFilePath dir2/copyf1  -Force -Context $ctxsas
Start-AzStorageFileCopy -SrcContainer $container.BlobContainerClient -SrcBlobName testblob1 -DestShareName testshare1 -DestFilePath dir2/copyf1  -Force -Context $ctxsas -DestContext $ctxsas

$container = Get-AzStorageContainer -Name testc1 -Context $ctxoauth
Start-AzStorageFileCopy -SrcContainer $container.BlobContainerClient -SrcBlobName testblob1 -DestShareName testshare1 -DestFilePath dir2/copyf1  -Force -Context $ctxoauth
Start-AzStorageFileCopy -SrcContainer $container.BlobContainerClient -SrcBlobName testblob1 -DestShareName testshare1 -DestFilePath dir2/copyf1  -Force -Context $ctxoauth -DestContext $ctxsas

# uri to file 
# [UriFilePath]
$fileuri = New-AzStorageFileSASToken -ShareName testshare1 -Path dir2/file1 -Permission rwdl -FullUri -Context $ctx 
Start-AzStorageFileCopy -AbsoluteUri $fileuri -DestShareName testshare1 -DestFilePath dir2/filec1 -DestContext $ctx -Force

# [UriFile]
$fileuri = New-AzStorageFileSASToken -ShareName testshare1 -Path dir2/file1 -Permission rwdl -FullUri -Context $ctx 
$file = Get-AzStorageFile -ShareName testshare1 -Path dir2/filec1 -Context $ctx
Start-AzStorageFileCopy -AbsoluteUri $fileuri -DestShareFileClient $file.ShareFileClient -DestContext $ctx -Force 



# Get copy state 
$f = Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "/dir2.../file1......." -DestShareName testshare1 -DestFilePath "dir2.../file2" -DisAllowSourceTrailingDot -Context $ctx -Force
$copystate = Get-AzStorageFileCopyState -ShareName testshare1 -FilePath "dir2.../file2" -Context $ctx 
$copystate.Status | Should -Be "Success"

$f = Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "/dir2.../file1......." -DestShareName testshare1 -DestFilePath "dir2.../file2" -DisAllowSourceTrailingDot -Context $ctx -Force
$copystate = Get-AzStorageFileCopyState -ShareName testshare1 -FilePath "dir2.../file2" -WaitForComplete -Context $ctx
$copystate.Status | Should -Be "Success"
$copystate = $f | Get-AzStorageFileCopyState -WaitForComplete
$copystate.Status | Should -Be "Success"
$copystate = Get-AzStorageFileCopyState -ShareFileClient $f.ShareFileClient -Context $ctx 
$copystate.Status | Should -Be "Success"

#Stop copy 
$ctxdest = New-AzStorageContext -StorageAccountName yifantesttask1 -EnableFileBackupRequestIntent
Set-AzStorageFileContent -ShareName testshare1 -Path "dir2/largesrcfile1" -Source D:\t300mb.txt -Force -Context $ctxoauth
Start-AzStorageFileCopy -SrcShareName testshare1 -SrcFilePath "dir2/largesrcfile1" -DestShareName testshare1 -DestFilePath "largedestfile1" -Context $ctx -Force -DestContext $ctxdest
Get-AzStorageFileCopyState -ShareName testshare1 -FilePath "largedestfile1" -Context $ctxdest
Stop-AzStorageFileCopy -ShareName testshare1 -FilePath "largedestfile1" -Context $ctxdest -Force

##
# file SAS 
$dir = Get-AzStorageFile -ShareName testshare1 -Path "dir2" -Context $ctx 
$file = Get-AzStorageFile -ShareName testshare1 -Path "dir2/file1" -Context $ctx

$filesastoken = New-AzStorageFileSASToken -ShareName testshare1 -Path dir2/file1 -Permission "rwdl" -Protocol HttpsOrHttp -Context $ctx
$filesasctx = New-AzStorageContext -SasToken $filesastoken -StorageAccountName $accountname
Get-AzStorageFile -ShareName testshare1 -Path dir2/file1 -Context $filesasctx

$filesastoken = New-AzStorageFileSASToken -ShareFileClient $file.ShareFileClient -Permission "rwdl" -IPAddressOrRange "0.0.0.0-255.255.255.255" -StartTime 2024-01-01 -ExpiryTime 2222-01-01 -Context $ctx
$filesasctx = New-AzStorageContext -SasToken $filesastoken -StorageAccountName $accountname
Get-AzStorageFile -ShareName testshare1 -Path dir2/file1 -Context $filesasctx

$filesastoken = $file | New-AzStorageFileSASToken -Permission "rwdl" -Protocol HttpsOnly 
$filesasctx = New-AzStorageContext -SasToken $filesastoken -StorageAccountName $accountname
Get-AzStorageFile -ShareName testshare1 -Path dir2/file1 -Context $filesasctx


# File handle 
Get-AzStorageFileHandle -ShareName testshare1 -Path dir2/file1 -Context $ctx
Get-AzStorageFileHandle -ShareName testshare1 -Path dir2 -Context $ctx -Recursive
Get-AzStorageFileHandle -ShareName testshare1 -Path dir2/file1... -DisAllowTrailingDot -Context $ctx

$share = Get-AzStorageShare -Name testshare1 -Context $ctx 
$share | Get-AzStorageFileHandle -Recursive
$share | Get-AzStorageFileHandle -Path dir2 -Recursive
Get-AzStorageFileHandle -ShareClient $share.ShareClient -Path dir2/file1 -Context $ctxsas 

$dir = Get-AzStorageFile -ShareName testshare1 -Path dir2 -Context $ctxoauth
$dir | Get-AzStorageFileHandle -Path file1 -Skip 1 -First 3 
Get-AzStorageFileHandle -ShareDirectoryClient $dir.ShareDirectoryClient -Recursive -Context $ctxsas

$file = Get-AzStorageFile -ShareName testshare1 -Path dir2/file1 -Context $ctxsas
$file | Get-AzStorageFileHandle 
Get-AzStorageFileHandle -ShareFileClient $file.ShareFileClient -Context $ctxoauth

Close-AzStorageFileHandle -ShareName testshare1 -Path dir2/file1 -CloseAll -Context $ctx
Close-AzStorageFileHandle -ShareName testshare1 -Path dir2 -Recursive -CloseAll -Context $ctxsas

$share | Close-AzStorageFileHandle -Path dir2 -CloseAll 
$share | Close-AzStorageFileHandle -Path dir2 -CloseAll -Recursive 
Close-AzStorageFileHandle -ShareClient $share.ShareClient -CloseAll -Context $ctxoauth

$dir | Close-AzStorageFileHandle -CloseAll -Recursive
$dir | Close-AzStorageFileHandle -Path file1 -CloseAll
Close-AzStorageFileHandle -ShareDirectoryClient $dir.ShareDirectoryClient -CloseAll -Context $ctx

$file | Close-AzStorageFileHandle -CloseAll
Close-AzStorageFileHandle -ShareFileClient $file.ShareFileClient -CloseAll -Context $ctx


# Remove file 
$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareName testshare1 -Path dir2/filetoberemoved -Context $ctx -PassThru

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareName testshare1 -Path dir2/filetoberemoved... -DisAllowTrailingDot -Context $ctx -PassThru

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareName testshare1 -Path dir2/filetoberemoved... -DisAllowTrailingDot -Context $ctxoauth -PassThru

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareName testshare1 -Path dir2/filetoberemoved -Context $ctxsas -PassThru

$share = Get-AzStorageShare -Name testshare1 -Context $ctx 
$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareClient $share.ShareClient -Path dir2/filetoberemoved -Context $ctx 

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareClient $share.ShareClient -Path dir2/filetoberemoved -Context $ctxsas

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareClient $share.ShareClient -Path dir2/filetoberemoved -Context $ctxoauth 

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
$share | Remove-AzStorageFile -Path dir2/filetoberemoved -PassThru

$dir = Get-AzStorageFile -ShareName testshare1 -Path dir2 -Context $ctxoauth
$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareDirectoryClient $dir.ShareDirectoryClient -path filetoberemoved -Context $ctxsas

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
Remove-AzStorageFile -ShareDirectoryClient $dir.ShareDirectoryClient -path filetoberemoved -Context $ctx

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx 
$dir | Remove-AzStorageFile -Path filetoberemoved -PassThru

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctx -Force
$file1 | Remove-AzStorageFile -PassThru

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctxsas -Force
$file1 | Remove-AzStorageFile -PassThru

$file1 = Set-AzStorageFileContent -ShareName testshare1 -Source D:\test512 -Path dir2/filetoberemoved -Context $ctxoauth -Force -PassThru
Remove-AzStorageFile -ShareFileClient $file1.ShareFileClient -PassThru -Context $ctxoauth

# clean up 
Remove-AzStorageShare -Name testshare1 -Context $ctx -Force
$share = Get-AzStorageShare -Name testshare2 -Context $ctx 
$share | Remove-AzStorageShare -Force
$share = Get-AzStorageShare -Name newtestshare1 -Context $ctx 
Remove-AzStorageShare -ShareClient $share.ShareClient -Context $ctx -Force


