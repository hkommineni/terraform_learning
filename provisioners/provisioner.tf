provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    key_name = "terraform"

    provisioner "remote-exec" {
        inline = [
          "sudo amazon-linux-extras install -y nginx1.12",
          "sudo systemctl start nginx"
        ]

    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = "${file("./terraform.pem")}"
    }
    }

}