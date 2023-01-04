provider "aws" {
  alias  = "west"
  region = "us-west-1"
}

resource "aws_vpc" "net_fw_poc_vpc" {
    for_each = var.cidr_block
    cidr_block = each.value.cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
      "name" = each.value.tag
    }
}


resource "aws_ec2_transit_gateway" "net_fw_poc_tgw" {
  description = "Transit Gateway"
  default_route_table_association = "disable"
  tags = {
    Name = "net_fw_poc_tgw"
  }
}

resource "aws_internet_gateway" "egress-igw" {
  vpc_id     = aws_vpc.net_fw_poc_vpc["egress-vpc"].id
  tags = {
    Name     = "egress-igw-AWSNF"
  }
}

resource "aws_eip" "natgw-a-eip" {
  vpc = true
}

resource "aws_eip" "natgw-b-eip" {
  vpc = true
}

resource "aws_nat_gateway" "egress-natgw-a" {
  allocation_id = aws_eip.natgw-a-eip.id
  subnet_id      = aws_subnet.egress-subnets["egress-public-az-a-ep"].id

  tags = {
    Name = "egress-natgw-a"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.egress-igw]
}

resource "aws_nat_gateway" "egress-natgw-b" {
  allocation_id = aws_eip.natgw-b-eip.id
  subnet_id      = aws_subnet.egress-subnets["egress-public-az-b-ep"].id

  tags = {
    Name = "egress-natgw-b"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.egress-igw]
}
