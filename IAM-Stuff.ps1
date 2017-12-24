$newUsers = "bob","cindy","dave","jean"
$iamGroup = "NoPerms"

#create users and add users to IAM Group
foreach ($user in $newUsers) {
    New-IAMUser -UserName $user
    Add-IAMUserToGroup -UserName $user -GroupName $iamGroup
}

foreach ($user in $newUsers) {
    Remove-IAMUser -UserName $user
}