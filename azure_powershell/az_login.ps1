#######################################################################################
# Script: Azure account login via PowerShell                                          #
# Author: Thangadurai, Murugan                                                        #
# CreationDate: 11/02/2024                                                            #
# Environment: Sandbox                                                                #
# Contact: thangadurai.murugan@example.com                                            #
#######################################################################################

Write-Host "Script to login Azure account using PowerShell"  -BackgroundColor Black -ForegroundColor Red
$tenant_id = Read-Host "Please enter the Tenant_Id:"
Write-Host "The entered Tenant_Id is:" -BackgroundColor Yellow -ForegroundColor Red $tenant_id
$login= az login --tenant $tenant_id
Write-Output $login
Write-Host "Azure login is succeed" -BackgroundColor Black -ForegroundColor Red 
' Successfully logged in ' + 'Azure Account'

Please note, Azure Tenant Id is nothing but it is Azure Active Directory Id.
