###############################################################################################################
#
# ABOUT THIS PROGRAM
#
#   Win-LocalUser-Remediate.ps1
#   https://github.com/Headbolt/Win-LocalUser
#
#  This script was designed to Check for the existence of specific local Account
#  and then exit with an appropriate Exit code.
#
#  Intended use is in Microsoft Endpoint Manager, as the "Remediate" half of a Proactive Remediation Script
#  The "Remediate" half is found here https://github.com/Headbolt/Win-LocalUser
#
###############################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 25/06/2023
#
#   - 25/06/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################
#
$userName = "NewUser"
$userDisplayName = "NewUser"
$userDesc = "Description"
$userPass = ConvertTo-SecureString "Password" -AsPlainText -Force
#
###############################################################################################################
#
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################
#
# Begin Processing
#
###############################################################################################################
#
Write-Host
Write-Host '###############################################################################################################'
Write-Host
#
$Exist = (Get-LocalUser).Name -Contains $userName
if($Exist -eq $false) {
  Write-Host "$userName does not Exist"
  New-LocalUser -Name $userName -FullName $userDisplayName -Description $userDesc -Password $userPass
  Exit 0
}
Else {
  Exit 1
}
