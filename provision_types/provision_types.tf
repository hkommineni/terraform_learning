provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Outbound Allowed"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    key_name = "terraform-key"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]

    connection {
        type     = "ssh"
        user     = "ec2-user"
        private_key = file("./terraform-key.pem")
        host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
          "sudo yum -y install nano"
        ]
    }

    provisioner "remote-exec" {
      when = destroy
      inline = [
        "sudo yum -y remove nano"
      ]
    }
}

