provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXXX"
}

# resource "aws_instance" "myec2" {
#     ami = "ami-00c39f71452c08778"
#     instance_type = "t2.micro"
# }

resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
    value = aws_eip.lb
}

# resource "aws_s3_bucket" "mys3" {
#     bucket = "harish-attribute-demo"
# }

# output "mys3bucket" {
#     value = aws_s3_bucket.mys3.bucket_domain_name
# }