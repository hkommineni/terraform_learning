provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    key_name = "terraform-key"

    connection {
        type     = "ssh"
        user     = "ec2-user"
        private_key = file("./terraform-key.pem")
        host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
        "sudo yum install -y nginx",
        "sudo systemctl start nginx"
        ]
    }
}