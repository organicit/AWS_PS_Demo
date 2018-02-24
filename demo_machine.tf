provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "OsloDemo" {
  ami                         = "ami-33fefd53"
  instance_type               = "t2.medium"
  subnet_id                   = "subnet-a2f23bc5"
  associate_public_ip_address = true
  security_groups             = ["sg-7bb83102"]
  key_name                    = "aws_centos"
  iam_instance_profile                 = "EC2Role"
  tags {
        Name = "OsloDemo"
  }
}