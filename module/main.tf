provider "aws" {
  region = "eu-west-2"
}


module "dbmodule" {
  source      = "./db"
  dbname = "mydbserver"

}
