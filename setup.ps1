 #Create storage account
 
 cd .\src\platform-automation
 Add-Azaccount
 Select-AzSubscription -SubscriptionId "ccc92f0c-83ac-42a0-ba0f-ee96f8986f94"
 $rg = New-AzResourceGroup -resourcegroupname 'sim-prod-deployment' -location 'west europe'
 $deploy = new-azresourcegroupdeployment -resourcegroup $rg.ResourceGroupName -templateFile .\artifacts\templates\resourcegroup\StorageAccount.json -storageAccountNamePrefix 'simpdevops' -verbose
 # Output names & key     
 $deploy.outputs.storageAccountName.value     
 $deploy.outputs.masterKey.value


 az ad sp create-for-rbac --name "SIM" --role 'Owner' --sdk-auth



 #Test deploy customer:
 Login-AzAccount
 $stgName = "simpdevops5jo6vwexxnnhi"
 $stgKey = "dGnnzvttxqm2iHOVzueZQ7wegrnTixSN1KzNqNqYAe9FUgn65TsJ9mMzM13XGvZA/2Nv8Voo2fYo/F5Nq5FwBw=="
 ./src/platform-automation/platform-scripts/Deploy-Customer.ps1 -customer "cloudpuzzles"  -storageAccountName $stgName -storageAccountKey $stgKey -verbose  