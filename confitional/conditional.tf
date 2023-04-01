provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

variable "istest" {

}

resource "aws_instance" "dev" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    count = var.istest == true ? 3 : 0

}

resource "aws_instance" "prod" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.large"
    count = var.istest == false ? 1 : 0
}
