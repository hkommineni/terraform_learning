provider "aws" {
  region     = "us-east-1"
<<<<<<< HEAD
  access_key = "XXXX"
  secret_key = "XXXX"
=======
  access_key = "Your-Key"
  secret_key = "Your-Key"
>>>>>>> e0cb40df94aff24ad726e0702975cb27a4cb3f7a
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
}

# earlier: default
# now: custom
