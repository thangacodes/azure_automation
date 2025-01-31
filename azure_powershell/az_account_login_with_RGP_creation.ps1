###############################################################################################
# Script: Azure ResourceGroup creation via PowerShell                                         #
# Purpose: We use Application via connect Azure                                               #
# Author: Thangadurai, Murugan                                                                #
# CreationDate: 12/02/2024                                                                    #
# Environment: Sandbox                                                                        #
# Contact: thangadurai.murugan@example.com                                                    #
###############################################################################################

# Required module is installed
if (-not (Get-Module -ListAvailable -Name Az)) {
    Write-Host "Az module not found. Please install it with: Install-Module -Name Az -AllowClobber -Force"
    exit
}
$RGP_NAME = Read-Host "Please enter the resourcegroup name:"
Write-Host "The entered ResourceGroup name is:" -BackgroundColor Black -ForegroundColor Red $RGP_NAME
$LOCATION = Read-Host "Please enter the location where you want to create a service:"
Write-Host "The entered location is:" $LOCATION -ForegroundColor Red -BackgroundColor Black
$APPID = Read-Host "Please enter the App registered Id:"
Write-Host "The entered appid is:" $APPID -ForegroundColor Red -BackgroundColor Black
$APPSECRET = Read-Host "Please enter the appsecret (it won't be displayed):" -AsSecureString
$TENANTID = Read-Host "Please enter the Tenant_id:"
Write-Host "The entered Tenant_id is:" $TENANTID -ForegroundColor Red -BackgroundColor Black

# Convert AppSecret to a SecureString
$CREDENTIAL = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $APPID,$APPSECRET

# Attempt to connect to Azure
try {
    Connect-AzAccount -ServicePrincipal -Credential $CREDENTIAL -Tenant $TENANTID
    Write-Host "Successfully authenticated to Azure!" -ForegroundColor Green
} 
catch {
    Write-Host "Failed to authenticate: $_" -ForegroundColor Red
    exit
}

# Create the Resource Group
try {
    New-AzResourceGroup -Name $RGP_NAME -Location $LOCATION
    Write-Host "Resource Group '$RGP_NAME' created successfully in '$LOCATION'!" -ForegroundColor Green
} 
catch {
    Write-Host "Failed to create Resource Group: $_" -ForegroundColor Red
    exit
}


## Note: In this script, we've already created a dedicated appId in Azure account and then given proper permission to the subscription.
## This is like create a dedicated app object using which you can interact with Azure cloud, not the root account. This method called Service Principal via connecting azure cloud
