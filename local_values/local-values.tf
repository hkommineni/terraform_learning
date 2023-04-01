provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

locals {
    common_tags = {
        owner = "DevOps Team"
        service = "backend"
    }
}

resource "aws_instance" "app-dev" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    tags = local.common_tags

}

resource "aws_instance" "db-dev" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.large"
    tags = local.common_tags
}

resource "aws_ebs_volume" "db_ebs"{
    availability_zone = "us-west-21"
    size = 8
    tags = local.common_tags
}
