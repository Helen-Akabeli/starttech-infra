terraform {
  required_version = ">= 1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
module "compute" {
  source = "./modules/compute"

  project_name       = var.project_name
  vpc_id             = module.networking.vpc_id
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  aws_region         = var.aws_region
}
module "storage" {
  source = "./modules/storage"

  project_name = var.project_name
}
module "monitoring" {
  source = "./modules/monitoring"

  project_name = var.project_name
}
module "networking" {
  source = "./modules/networking"

  project_name = var.project_name
  vpc_cidr     = "10.0.0.0/16"
}