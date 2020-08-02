provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.mytuple[2]
  }
}

variable "vpcname" {
  type    = string
  default = "test_vpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "isenabled" {
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["value1", "value2"]
}

# variable "inputvariable" {
#   type        = string
#   description = "Set the name of the vpc"
# }


variable "mytuple" {
  type    = tuple([string, number, string])
  default = ["name", 1, "cat"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "map1"
    key2 = "map2"
    key3 = "map3"
  }
}


output "vpcid" {
  value = aws_vpc.myvpc.id
}
