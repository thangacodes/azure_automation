#######################################################
# Script: Azure account login via PowerShell          #
# Author: Thangadurai, Murugan                        #
# CreationDate: 11/02/2024                            #
# Environment: Sandbox                                #
# Contact: thangadurai.murugan@example.com            #
#######################################################

Write-Host "Script to login Azure account using PowerShell"  -BackgroundColor Black -ForegroundColor Red
$tenant_id = ""
$login=az login --tenant $tenant_id
Write-Output $login
Start-Sleep 2
Write-Host "Azure login is succeed" -BackgroundColor Black -ForegroundColor Red
