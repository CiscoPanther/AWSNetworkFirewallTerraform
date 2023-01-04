resource "aws_route_table" "spoke-vpc01-workload-rt" {
  vpc_id = aws_vpc.net_fw_poc_vpc["spoke-vpc-01"].id
  tags = {
    Name = "spoke-vpc01-workload-rt"
  }
}

resource "aws_route_table" "spoke-vpc02-workload-rt" {
  vpc_id = aws_vpc.net_fw_poc_vpc["spoke-vpc-02"].id
  tags = {
    Name = "spoke-vpc02-workload-rt"
  }
}

resource "aws_route_table" "inspection-fw-rt-a" {
  vpc_id = aws_vpc.net_fw_poc_vpc["inspection-vpc"].id
  tags = {
    Name = "inspection-fw-rt-a"
  }
}

resource "aws_route_table" "inspection-fw-rt-b" {
  vpc_id = aws_vpc.net_fw_poc_vpc["inspection-vpc"].id
  tags = {
    Name = "inspection-fw-rt-b"
  }
}

resource "aws_route_table" "inspection-tgw-rt-a" {
  vpc_id = aws_vpc.net_fw_poc_vpc["inspection-vpc"].id
  tags = {
    Name = "inspection-tgw-rt-a"
  }
}

resource "aws_route_table" "inspection-tgw-rt-b" {
  vpc_id = aws_vpc.net_fw_poc_vpc["inspection-vpc"].id
  tags = {
    Name = "inspection-tgw-rt-b"
  }
}

resource "aws_route_table" "egress-public-rt-a" {
  vpc_id = aws_vpc.net_fw_poc_vpc["egress-vpc"].id
  tags = {
    Name = "egress-public-rt-a"
  }
}

resource "aws_route_table" "egress-public-rt-b" {
  vpc_id = aws_vpc.net_fw_poc_vpc["egress-vpc"].id
  tags = {
    Name = "egress-public-rt-b"
  }
}

resource "aws_route_table" "egress-tgw-rt-a" {
  vpc_id = aws_vpc.net_fw_poc_vpc["egress-vpc"].id
  tags = {
    Name = "egress-tgw-rt-a"
  }
}

resource "aws_route_table" "egress-tgw-rt-b" {
  vpc_id = aws_vpc.net_fw_poc_vpc["egress-vpc"].id
  tags = {
    Name = "egress-tgw-rt-b"
  }
}


resource "aws_route_table_association" "spoke-vpc-01-workload-subnet-association" {
  subnet_id      = aws_subnet.spoke-vpc-01-subnets["spoke-vpc-01-workload-subnet"].id
  route_table_id = aws_route_table.spoke-vpc01-workload-rt.id
}

resource "aws_route_table_association" "spoke-vpc-02-workload-subnet-association" {
  subnet_id      = aws_subnet.spoke-vpc-02-subnets["spoke-vpc-02-workload-subnet"].id
  route_table_id = aws_route_table.spoke-vpc02-workload-rt.id
}

resource "aws_route_table_association" "inspection-subnets-fw-a-association" {
  subnet_id      = aws_subnet.inspection-subnets["inspection-fw-az-a-ep"].id
  route_table_id = aws_route_table.inspection-fw-rt-a.id
}

resource "aws_route_table_association" "inspection-subnets-fw-b-association" {
  subnet_id      = aws_subnet.inspection-subnets["inspection-fw-az-b-ep"].id
  route_table_id = aws_route_table.inspection-fw-rt-b.id
}

resource "aws_route_table_association" "inspection-subnets-tgw-a-association" {
  subnet_id      = aws_subnet.inspection-subnets["inspection-tgw-az-a-ep"].id
  route_table_id = aws_route_table.inspection-tgw-rt-a.id
}

resource "aws_route_table_association" "inspection-subnets-tgw-b-association" {
  subnet_id      = aws_subnet.inspection-subnets["inspection-tgw-az-b-ep"].id
  route_table_id = aws_route_table.inspection-tgw-rt-b.id
}

resource "aws_route_table_association" "egress-public-subnet-a-association" {
  subnet_id      = aws_subnet.egress-subnets["egress-public-az-a-ep"].id
  route_table_id = aws_route_table.egress-public-rt-a.id
}

resource "aws_route_table_association" "egress-public-subnet-b-association" {
  subnet_id      = aws_subnet.egress-subnets["egress-public-az-b-ep"].id
  route_table_id = aws_route_table.egress-public-rt-b.id
}

resource "aws_route_table_association" "egress-tgw-subnet-a-association" {
  subnet_id      = aws_subnet.egress-subnets["egress-tgw-az-a-ep"].id
  route_table_id = aws_route_table.egress-tgw-rt-a.id
}

resource "aws_route_table_association" "egress-tgw-subnet-b-association" {
  subnet_id      = aws_subnet.egress-subnets["egress-tgw-az-b-ep"].id
  route_table_id = aws_route_table.egress-tgw-rt-b.id
}

resource "aws_route" "spoke01_def_route" {
  route_table_id            = aws_route_table.spoke-vpc01-workload-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  transit_gateway_id        = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  depends_on                = [aws_route_table.spoke-vpc01-workload-rt]
}

resource "aws_route" "spoke02_def_route" {
  route_table_id            = aws_route_table.spoke-vpc02-workload-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  transit_gateway_id        = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  depends_on                = [aws_route_table.spoke-vpc02-workload-rt]
}

resource "aws_route" "inspection_fw_a_def_route" {
  route_table_id            = aws_route_table.inspection-fw-rt-a.id
  destination_cidr_block    = "0.0.0.0/0"
  transit_gateway_id        = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  depends_on                = [aws_route_table.inspection-fw-rt-a]
}

resource "aws_route" "inspection_fw_b_def_route" {
  route_table_id            = aws_route_table.inspection-fw-rt-b.id
  destination_cidr_block    = "0.0.0.0/0"
  transit_gateway_id        = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  depends_on                = [aws_route_table.inspection-fw-rt-b]
}

resource "aws_route" "egress_vpc_puba_def_route" {
  route_table_id            = aws_route_table.egress-public-rt-a.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.egress-igw.id
  depends_on                = [aws_route_table.egress-public-rt-a]
}

resource "aws_route" "egress_vpc_pubb_def_route" {
  route_table_id            = aws_route_table.egress-public-rt-b.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.egress-igw.id
  depends_on                = [aws_route_table.egress-public-rt-b]
}

resource "aws_route" "egress_vpc_puba_spoke_route" {
  route_table_id            = aws_route_table.egress-public-rt-a.id
  destination_cidr_block    = "10.0.0.0/8"
  gateway_id                = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  depends_on                = [aws_route_table.egress-public-rt-a]
}

resource "aws_route" "egress_vpc_pubb_spoke_route" {
  route_table_id            = aws_route_table.egress-public-rt-b.id
  destination_cidr_block    = "10.0.0.0/8"
  gateway_id                = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  depends_on                = [aws_route_table.egress-public-rt-b]
}

resource "aws_route" "egress_vpc_tgwa_def_route" {
  route_table_id            = aws_route_table.egress-public-rt-a.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.egress-natgw-a.id
  depends_on                = [aws_route_table.egress-public-rt-a]
}

resource "aws_route" "egress_vpc_tgwb_def_route" {
  route_table_id            = aws_route_table.egress-public-rt-b.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.egress-natgw-b.id
  depends_on                = [aws_route_table.egress-public-rt-b]
}
