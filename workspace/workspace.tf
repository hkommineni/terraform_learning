provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_instance" "myec2dev" {
  ami           = "ami-00c39f71452c08778"
  instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod     = "t2.large"
  }
}
