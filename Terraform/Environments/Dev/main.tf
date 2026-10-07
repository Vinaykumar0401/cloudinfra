module "vpc" {
  source = "../../Modules/VPC"

  vpc_cidr                  = var.vpc_cidr
  public_subnet_cidr_1      = var.public_subnet_cidr_1
  public_subnet_cidr_2      = var.public_subnet_cidr_2
  private_subnet_app_cidr_1 = var.private_subnet_app_cidr_1
  private_subnet_app_cidr_2 = var.private_subnet_app_cidr_2
  private_subnet_db_cidr_1  = var.private_subnet_db_cidr_1
  private_subnet_db_cidr_2  = var.private_subnet_db_cidr_2
  availability_zone_1       = var.availability_zone_1
  availability_zone_2       = var.availability_zone_2
}