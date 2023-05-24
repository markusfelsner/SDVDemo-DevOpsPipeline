Connect-AZAccount -UseDeviceAuthentication -TenantId 8bf33bc5-0726-4e0c-ad93-d1d2bcb576a2


Get-AzSubscription
Pause

$context = Get-AzSubscription -SubscriptionId f447a473-5fa0-4945-b2f6-996b3254ce5b
Set-AzContext $context 

Set-AzDefault -ResourceGroupName SDVDemo

#In den Ordner des Templates wechseln
cd /home/markusfelsner/sdvdemo/git-repo/SDVDemo-ZweiterStandort

$templateFile="SDVDemo-Georedundanz-Template.json"
$parameterFile="SDVDemo-Georedundanz-Parameter.json"
$today=Get-Date -Format "MM-dd-yyyy"
$deploymentName="SDVDemo-StandortEU"+"$today"
New-AzResourceGroupDeployment -Name $deploymentName -TemplateFile $templateFile -TemplateParameterFile $parameterFile
