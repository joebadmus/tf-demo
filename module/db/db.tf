resource "aws_instance" "myec2db" {
  ami           = "ami-04122be15033aa7ec"
  instance_type = "t2.micro"

  tags = {
    Name = var.dbname_nmae
  }
}


variable "dbname_nmae" {
  type = string
}
