provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_iam_user" "iam" {
    for_each = toset(["user-0","user-01","user-02","user-03"])
    name = each.key
}

# resource "aws_instance" "myec2" {
#     ami = "ami-00c39f71452c08778"
#     for_each = {
#       key1 = "t2.micro"
#       key2 = "t2.small"
#     }
#     instance_type = each.value
#     key_name = each.key

#     tags = {
#       Name = each.value
#     }
# }