provider "aws" {
  region     = "us-east-1"
  access_key = "XXXX"
  secret_key = "XXXX"
}

resource "aws_instance" "myec2" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
}

resource "aws_eip" "lb" {
    instance = aws_instance.myec2.id
    vpc = true
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"

    ingress {
        description = "TLS from VPC"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "${aws_eip.lb.private_ip}/32" ]
    }


}