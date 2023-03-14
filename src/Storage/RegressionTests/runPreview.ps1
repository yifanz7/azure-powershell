
# Import-Module C:\code\PSH_Dev\artifacts\Debug\Az.Accounts\Az.Accounts.psd1
# Import-Module C:\code\PSH_Dev\artifacts\Debug\Az.Storage\Az.Storage.psd1


$preview = $true
cd $PSScriptRoot
Import-Module $PSScriptRoot\utils.ps1

# GA feature
Invoke-Pester $PSScriptRoot\dataplane.ps1 -Show All -Strict # -TagFilter blobversion # -TagFilter ToTest 
Invoke-Pester $PSScriptRoot\adls.ps1 -Show All -Strict
Invoke-Pester $PSScriptRoot\adls_setaclresusive.ps1 -Show All -Strict
Invoke-Pester $PSScriptRoot\srp.ps1  -Show All -Strict -ExcludeTagFilter "longrunning"  # -TagFilter "fail"


#preview feature
Invoke-Pester $PSScriptRoot\dataplane_preview.ps1 -Show All -Strict  #-TagFilter "Totest"
Invoke-Pester $PSScriptRoot\srp_preview.ps1 -Show All -Strict -ExcludeTagFilter "longrunning" # -TagFilter "VLW"

# long running
Invoke-Pester $PSScriptRoot\srp_preview.ps1 -Show All -Strict -TagFilter "longrunning" 
Invoke-Pester $PSScriptRoot\srp.ps1  -Show All -Strict -TagFilter "longrunning"