provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

variable "iam_names" {
    type = list
    default = ["user-0", "user-01", "user-02", "user-03", "user-04"]
}

resource "aws_iam_user" "iam" {
    name = var.iam_names[count.index]
    count = 5
    path = "/system/"
}

