resource "aws_subnet" "inspection-subnets" {
  for_each = var.inspection-subnets
  vpc_id     = aws_vpc.net_fw_poc_vpc["inspection-vpc"].id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.tag
  }
}

resource "aws_subnet" "egress-subnets" {
  for_each = var.egress-subnets
  vpc_id     = aws_vpc.net_fw_poc_vpc["egress-vpc"].id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.tag
  }
}

resource "aws_subnet" "spoke-vpc-01-subnets" {
  for_each = var.spoke-vpc-01-subnets
  vpc_id     = aws_vpc.net_fw_poc_vpc["spoke-vpc-01"].id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.tag
  }
}

resource "aws_subnet" "spoke-vpc-02-subnets" {
  for_each = var.spoke-vpc-02-subnets
  vpc_id     = aws_vpc.net_fw_poc_vpc["spoke-vpc-02"].id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.tag
  }
}
