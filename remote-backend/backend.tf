terraform {
  backend "s3" {
    bucket = "hkommineni-terraform-backend"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}
