provider "aws" {
  alias  = "west"
  region = "us-west-1"
}


module "net_fw_poc_infra" {
  source = "./modules/network"
  providers = {
    aws = aws.west
  }
  cidr_block           = var.cidr_block
  inspection-vpc-cidr  = var.inspection-vpc-cidr
  spoke-vpc-01-cidr    = var.spoke-vpc-01-cidr
  spoke-vpc-02-cidr    = var.spoke-vpc-02-cidr
  egress-vpc-cidr      = var.egress-vpc-cidr
  inspection-subnets   = var.inspection-subnets
  egress-subnets       = var.egress-subnets
  spoke-vpc-01-subnets = var.spoke-vpc-01-subnets
  spoke-vpc-02-subnets = var.spoke-vpc-02-subnets
  firewall_subnets     = var.firewall_subnets
}

