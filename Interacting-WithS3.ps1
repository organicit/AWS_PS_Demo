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
New-S3Bucket -BucketName pdxugdemo

# Push php website up to S3
Write-S3Object -File /Users/eric/Documents/Development/powershell/AWS_PS_Demo/New_S3_Bucket.json -BucketName pdxugdemo

#list all of the files in the bucket
Get-S3Object -BucketName pdxugdemo

# sync local files with bucket 
aws s3 sync . s3://pdxugdemo

aws s3 cp ./New_S3_Bucket.json s3://pdxugdemo
#
Remove-S3Bucket -BucketName pdxugdemo -DeleteBucketContent -Force