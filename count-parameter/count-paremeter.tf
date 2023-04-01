provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

variable "elb_names" {
    type = list
    default = ["dev-loadbalance", "stage-loadbalancer", "prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
    name = var.elb_names[count.index]
    count = 3
    path = "/system/"

}