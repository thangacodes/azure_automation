#################################################################################################
# Script: Azure ResourceGroup creation via PowerShell                                           #
# Author: Thangadurai, Murugan                                                                  #
# CreationDate: 11/02/2024                                                                      #
# Environment: Sandbox                                                                          #
# Contact: thangadurai.murugan@example.com                                                      #
#################################################################################################
Write-Host -ForegroundColor red -BackgroundColor Yellow "Script to create resource group in Azure Cloud"
$rgp_name = Read-Host "Please enter the resource group that you wanted to create:"
Write-Host "The entered ResoruceGroup name is:" -BackgroundColor Black -ForegroundColor Red $rgp_name
$place = Read-Host "Please enter the location where you need to avail this resource:"
Write-Host "The entered location name is:" -BackgroundColor Black -ForegroundColor Red $place
$rgp = New-AzResourceGroup -Name $rgp_name -Location $place
write-output $rgp
write-host "ResourceGroup has been created successfully" -BackgroundColor Black -ForegroundColor Red
