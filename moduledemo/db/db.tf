resource "aws_instance" "db_server" {
  ami           = "ami-04122be15033aa7ec"
  instance_type = "t2.micro"

  tags = {
    Name = var.vpc_name
  }
}


variable "vpc_name" {
  type = string
}
