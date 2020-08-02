provider "aws" {
  region = "eu-west-2"
}

module "db_module" {
  source   = "./db"
  vpc_name = "dev-my_module_db"

}


output "db_privateip" {
  value = module.db_module.private_ip
}

output "db_publicip" {
  value = module.db_module.public_ip
}
