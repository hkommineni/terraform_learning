provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

data "aws_ami" "app_ami"{
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }

}

resource "aws_instance" "myec2" {
   ami = data.aws_ami.app_ami.id
   instance_type = "t2.micro"
}