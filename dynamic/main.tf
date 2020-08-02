provider "aws" {
  region = "eu-west-2"
}

variable "ingress_rules" {
  type    = list(number)
  default = [22, 443, 80, 8080, 8443]
}

variable "egress_rules" {
  type    = list(number)
  default = [443, 8443]
}


resource "aws_security_group" "web_traffic" {
  name = "secure server"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egress_rules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}


resource "aws_instance" "myec2db" {
  ami             = "ami-04122be15033aa7ec"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.web_traffic.name]

  tags = {
    Name = "DB server"
  }
}

