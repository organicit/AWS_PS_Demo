<#
 Create a new Linux VM with userdata to install HTTPD, and PHP
 Add EBS volume to host the website which we'll pull from S3
 We'll Tag the instance and the EBS Volume.
 We will create and configure the Security Groups
 #>

#Create Instance Security Group
$myVPC = Get-EC2Vpc
$groupid = New-EC2SecurityGroup -VpcId $myVPC.VpcId -GroupName "LinuxWebServerSG" `
    -GroupDescription "Apache Webserver base security group"
    $ip1 = new-object Amazon.EC2.Model.IpPermission 
    $ip1.IpProtocol = "tcp" 
    $ip1.FromPort = 22 
    $ip1.ToPort = 22
    $ip1.IpRanges.Add("0.0.0.0/0") 

    $ip2 = new-object Amazon.EC2.Model.IpPermission 
    $ip2.IpProtocol = "tcp"
    $ip2.FromPort = 80
    $ip2.ToPort = 80
    $ip2.IpRanges.Add("0.0.0.0/0")

Grant-EC2SecurityGroupIngress -GroupId $groupid -IpPermissions @( $ip1, $ip2 )
$updatedSG = $groupid | Get-EC2SecurityGroup
$updatedSG

# Create EBS Volume for WWW
$volume = New-Object Amazon.EC2.Model.EbsBlockDevice
$volume.VolumeSize = 20
$volume.VolumeType = 'standard'
$volume.DeleteOnTermination = $true

$deviceMapping = New-Object Amazon.EC2.Model.BlockDeviceMapping
$deviceMapping.DeviceName = '/dev/sda1'
$deviceMapping.Ebs = $volume

# Create a Tag object to apply to the reservation
$myTags = @(
    @{key="Name";value="PHP_Webserver"}, `
    @{key="Environment";value="Development"}, `
    @{key="Purpose";value="Webserver"}
)

<#
$userData = @"
!#/bin/bash
echo "this is test" > /tmp/myTestOutput.txt
"@

 #>

$encodedUserData = [System.Text.Encoding]::UTF8.GetBytes($userData)
$encodedData = [System.Convert]::ToBase64String($encodedUserData)
# Create EC2 Instance
$awsLinuxAmi = 'ami-aa2ea6d0'
$myNewReservation = New-EC2Instance -ImageId $awsLinuxAmi -KeyName 'svcc2017' `
                    -InstanceType 't2.micro' -MinCount 1 -MaxCount 1 `
                    -SecurityGroupId $updatedSG.GroupId `
                    -BlockDeviceMapping $deviceMapping `
                    #-UserData $encodedData `
                    -InstanceProfile_Name 'EC2Role'

# Apply tags to new instance
$myNewReservation.Instances.InstanceId|New-EC2Tag -Tag $myTags