 #Create storage account
 
 cd .\src\platform-automation
 Add-Azaccount
 Select-AzSubscription -SubscriptionId "ccc92f0c-83ac-42a0-ba0f-ee96f8986f94"
 $rg = New-AzResourceGroup -resourcegroupname 'sim-test-deployment' -location 'west europe'
 $deploy = new-azresourcegroupdeployment -resourcegroup $rg.ResourceGroupName -templateFile .\artifacts\templates\resourcegroup\StorageAccount.json -storageAccountNamePrefix 'simdevops' -verbose
 # Output names & key     
 $deploy.outputs.storageAccountName.value     
 $deploy.outputs.masterKey.value


 az ad sp create-for-rbac --name "SIM" --role 'Owner' --sdk-auth