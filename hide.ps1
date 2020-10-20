##############################################################
#      This Scrip will allow you to hide a mailbox in Ad     #
##############################################################

#Add AD functionality.
Import-Module ActiveDirectory

#Request username to use in distribution group search.
Write-Host "Enter username, or 'exit' to close."
$User = Read-Host

#Check for exit request.
if (($User -eq "exit") -or ($User -eq "Exit") -or ($User -eq "EXIT")) {
    exit
}

#If no exit command is entered, search for the requested user.
while (($User -ne "exit") -and ($User -ne "Exit") -and ($User -ne "EXIT")) {

    $UserExists = Get-ADUser -filter {sAMAccountName -eq $User}

    #Check if user exists, and skip search if they do not.
    if (!$UserExists) {
        Write-Host "ERROR: That user does not exist."
    }
    Else {
           #command to complete
            Set-ADUser $User -Replace @{msExchHideFromAddressLists=$true}
    }

    #Request new user or app exit.
    Write-Host "`nEnter username, or 'exit' to close."
    $User = Read-Host
}