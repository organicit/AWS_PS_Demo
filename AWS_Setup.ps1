# Configure the AWS CLI

# Option 1 Access Keys/Secret Keys
# Example pinched from 
# http://docs.aws.amazon.com/powershell/latest/userguide/specifying-your-aws-credentials.html
Set-AWSCredential -AccessKey AKIAIOSFODNN7EXAMPLE `
                  -SecretKey wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY `
                  -StoreAs MyProfileName

# Option 2 SAML Authentication
#start-process  https://aws.amazon.com/blogs/security/enabling-federation-to-aws-using-windows-active-directory-adfs-and-saml-2-0/

# Option 3 Role applied to EC2 Instances