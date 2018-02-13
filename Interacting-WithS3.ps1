<#
    - We'll create a bucket
    - configure the bucket with IAM, and ad hoc users
    - Add some files
 #>
Import-Module AWSPowershell

<#
 # update the role before and after to show this fail when it doesn't have the
    appropriate IAM Role permissions
 #>
New-S3Bucket -BucketName PowerShell-Demo

# Push php website up to S3
Write-S3Object -File C:\Users\Administrator\Documents\AWS_PS_DEMO\www\index.php -BucketName PowerShell-Demo

#list all of the files in the bucket
Get-S3Object -BucketName PowerShell-Demo

# sync local files with bucket 
aws s3 sync . s3://PowerShell-Demo

aws s3 cp ./New_S3_Bucket.json s3://PowerShell-Demo
#
Remove-S3Bucket -BucketName PowerShell-Demo