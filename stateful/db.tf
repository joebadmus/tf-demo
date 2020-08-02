provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}

# resource "aws_vpc" "myvpc2" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = "TobeDeleted"
#   }
# }

terraform {
  backend "s3" {
    bucket = "joeb-com-dev-s3-backend"
    key    = "state/terraform.tfstate"
    region = "eu-west-2"
  }
}
