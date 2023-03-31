provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAWP4HRDJ6YI55LUFZ"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
}

# earlier: default
# now: custom