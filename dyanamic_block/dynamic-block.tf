variable "sg_ports" {
    type = list(number)
    default = [ 8200, 8201, 8300, 9200, 9500 ]
}

resource "aws_security_group" "dynamicsg" {

    name = "dynamic-sg"

    dynamic "egress" {
        for_each = var.sg_ports
        content {
            from_port = egress.value
            to_port = egress.value
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}