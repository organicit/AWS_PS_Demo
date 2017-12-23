$MyCFNStack = "organicit-test1"



New-CFNStack -StackName $MyCFNStack `
             -TemplateURL https://s3.amazonaws.com/PowerShell-Demo/New_S3_Bucket.json `
             -Parameter @{ ParameterKey="BucketName"; ParameterValue=$MyCFNStack }


Update-CFNStack -StackName $MyCFNStack `
             -TemplateURL https://s3.amazonaws.com/PowerShell-Demo/New_S3_Bucket.json `
             -Parameter @( @{ ParameterKey="BucketName"; ParameterValue=$MyCFNStack }, @{ ParameterKey="AccessCTL"; ParameterValue="private" })