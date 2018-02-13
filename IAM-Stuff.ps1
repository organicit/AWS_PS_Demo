$newUsers = "bob","cindy","dave","jean"
$iamGroup = "NoPerms"

Get-IAMGroup -GroupName $iamGroup

#create users and add users to IAM Group
foreach ($user in $newUsers) {
    New-IAMUser -UserName $user
    Add-IAMUserToGroup -UserName $user -GroupName $iamGroup
}

foreach ($user in $newUsers) {
    #remove user from groups before deleting them
    Remove-IAMUserFromGroup -GroupName $iamGroup -UserName $user -Force
    Remove-IAMUser -UserName $user -Force
}