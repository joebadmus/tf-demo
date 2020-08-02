provider "aws" {
  region = "eu-west-2"
}


resource "aws_instance" "webserver" {
  ami           = "ami-04122be15033aa7ec"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.appserver, aws_instance.myec2db]

  tags = {
    Name = "web server"
  }
}


resource "aws_instance" "appserver" {
  ami           = "ami-04122be15033aa7ec"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.myec2db]

  tags = {
    Name = "app server"
  }
}



resource "aws_instance" "myec2db" {
  ami           = "ami-04122be15033aa7ec"
  instance_type = "t2.micro"

  tags = {
    Name = "DB server"
  }
}


# data "aws_instance" "serversearch" {
#   filter {
#     name   = "tag:Name"
#     values = ["server"]
#   }
# }

# output "server" {
#   value = data.aws_instance.serversearch.availability_zone
# }
