provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "my-instance"

  ami                    = "ami-00c39f71452c08778"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-1e71e379"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}