###############################################################################################################
#
# ABOUT THIS PROGRAM
#
#   Win-LocalUser-Check.ps1
#   https://github.com/Headbolt/Win-LocalUser
#
#  This script was designed to Check for the existence of specific local Account
#  and then exit with an appropriate Exit code.
#
#  Intended use is in Microsoft Endpoint Manager, as the "Check" half of a Proactive Remediation Script
#  The "Remediate" half is found here https://github.com/Headbolt/Maconomy_Shortcut_Remediate
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
$ExitCode=0 # Setting ExitCode Variable to an initial 0
$userName = "NewUser"
$userDesc = "New User"
$userPass = "Password"
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
if ($Exist) {
  Write-Host "$userName Exists"
  Exit 0
  } 
Else {
  Write-Host "$userName does not Exist"
  Exit 1
}
