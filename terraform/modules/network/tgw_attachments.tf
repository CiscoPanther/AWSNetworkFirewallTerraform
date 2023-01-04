
resource "aws_ec2_transit_gateway_vpc_attachment" "spoke-vpc-01-tgw_attachment" {
  subnet_ids         = [aws_subnet.spoke-vpc-01-subnets["spoke-vpc-01-tgw-az-a-ep"].id]
  transit_gateway_id = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  vpc_id             = aws_vpc.net_fw_poc_vpc["spoke-vpc-01"].id
  transit_gateway_default_route_table_association = false
}

resource "aws_ec2_transit_gateway_vpc_attachment" "spoke-vpc-02-tgw_attachment" {
  subnet_ids         = [aws_subnet.spoke-vpc-02-subnets["spoke-vpc-02-tgw-az-a-ep"].id]
  transit_gateway_id = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  vpc_id             = aws_vpc.net_fw_poc_vpc["spoke-vpc-02"].id
  transit_gateway_default_route_table_association = false
}

resource "aws_ec2_transit_gateway_vpc_attachment" "inspection_vpc_tgw_attachment" {
  subnet_ids         = [aws_subnet.inspection-subnets["inspection-tgw-az-a-ep"].id,aws_subnet.inspection-subnets["inspection-tgw-az-b-ep"].id]
  transit_gateway_id = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  vpc_id             = aws_vpc.net_fw_poc_vpc["inspection-vpc"].id
  transit_gateway_default_route_table_association = false
}

resource "aws_ec2_transit_gateway_vpc_attachment" "egress_vpc_tgw_attachment" {
  subnet_ids         = [aws_subnet.egress-subnets["egress-tgw-az-a-ep"].id,aws_subnet.egress-subnets["egress-tgw-az-b-ep"].id]
  transit_gateway_id = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  vpc_id             = aws_vpc.net_fw_poc_vpc["egress-vpc"].id
  transit_gateway_default_route_table_association = false
}

