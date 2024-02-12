###############################################################################################
# Script: Azure ResourceGroup creation via PowerShell                                         #
# Purpose: We use Application via connect Azure                                               #
# Author: Thangadurai, Murugan                                                                #
# CreationDate: 12/02/2024                                                                    #
# Environment: Sandbox                                                                        #
# Contact: thangadurai.murugan@example.com                                                    #
###############################################################################################

$RGP_NAME = Read-Host "Please enter the resourcegroup name:"
Write-Host "The entered ResourceGroup name is:" -BackgroundColor Black -ForegroundColor Red $RGP_NAME
$LOCATION = Read-Host "Please enter the location, where you wanted to create a service:"
Write-Host "The entered location is:" $LOCATION -ForegroundColor Red -BackgroundColor Black
$APPID = Read-Host "Please enter the App registered Id:"
Write-Host "The entered appid is:" $APPID -ForegroundColor Red -BackgroundColor Black
$APPSECRET = Read-Host "Please enter the appsecret is: "
Write-Host "The entered appsecret is:" $APPSECRET -ForegroundColor Red -BackgroundColor Black
$TENANTID = Read-Host "Please enter the Tenant_id:"
Write-Host "The entered Tenant_id is:" $TENANTID -ForegroundColor Red -BackgroundColor Black
$SECURESECRET = $APPSECRET | ConvertTo-SecureString -AsPlainText -Force
$CREDENTIAL = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $APPID,$SECURESECRET

Connect-AzAccount -ServicePrincipal -Credential $CREDENTIAL -Tenant $TENANTID
New-AzResourceGroup -Name $RGP_NAME -Location $LOCATION

## Note: In this script, we've already created a dedicated appId in Azure account and then given proper permission to the subscription.
## This is like create a dedicated app object using which you can interact with Azure cloud, not the root account. This method called Service Principal via connecting azure cloud
