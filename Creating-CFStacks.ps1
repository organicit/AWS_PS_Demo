$MyCFNStack = "organicit-test1"

New-CFNStack -StackName $MyCFNStack `
             -TemplateURL https://s3.amazonaws.com/pdxugdemo/New_S3_Bucket.json `
             -Parameter @( @{ ParameterKey="BucketName"; ParameterValue=$MyCFNStack }, `
                        @{ ParameterKey="AccessCTL"; ParameterValue="PublicRead" })


Update-CFNStack -StackName $MyCFNStack `
             -TemplateURL https://s3.amazonaws.com/pdxugdemo/New_S3_Bucket.json `
             -Parameter @( @{ ParameterKey="BucketName"; ParameterValue=$MyCFNStack }, `
                        @{ ParameterKey="AccessCTL"; ParameterValue="Private" })

Remove-CFNStack -StackName $MyCFNStack -Force