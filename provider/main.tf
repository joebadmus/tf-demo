provider "aws" {
  region = "eu-west-2"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "irl"
}


resource "aws_vpc" "lonvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my_lon_vpc"
  }
}

resource "aws_vpc" "irlvpc" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.irl

  tags = {
    Name = "my_irl_vpc"
  }
}

