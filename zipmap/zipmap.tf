provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_iam_user" "lb" {
    name = "iamuser.${count.index}"
    count = 3
    path = "/system/"
}

output "arns" {
    value = aws_iam_user.lb[*].arn
}

output "names" {
    value = aws_iam_user.lb[*].name
}

output "combined" {
    value = zipmap(aws_iam_user.lb[*].name, aws_iam_user.lb[*].arn)
}