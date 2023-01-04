resource "aws_ec2_transit_gateway_route_table" "egress_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  tags = {
    Name = "egress_tgw_rt"
  }
}

resource "aws_ec2_transit_gateway_route_table" "inspection_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  tags = {
    Name = "inspection_tgw_rt"
  }
}

resource "aws_ec2_transit_gateway_route_table" "spoke_tgw_rt" {
  transit_gateway_id = aws_ec2_transit_gateway.net_fw_poc_tgw.id
  tags = {
    Name = "spoke_tgw_rt"
  }
}

resource "aws_ec2_transit_gateway_route_table_association" "egress-subnets_tgw_rt_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.egress_vpc_tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.egress_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route_table_association" "inspection-subnets_tgw_rt_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.inspection_vpc_tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.inspection_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route_table_association" "spoke01_tgw_rt_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke-vpc-01-tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spoke_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route_table_association" "spoke02_tgw_rt_association" {
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke-vpc-02-tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spoke_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "spoke_vpc_default_route" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.inspection_vpc_tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.spoke_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "inspection_vpc_default_route" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.egress_vpc_tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.inspection_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "spoke_vpc01_route" {
  destination_cidr_block         = var.spoke-vpc-01-cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke-vpc-01-tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.inspection_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "spoke_vpc02_route" {
  destination_cidr_block         = var.spoke-vpc-02-cidr
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.spoke-vpc-02-tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.inspection_tgw_rt.id
}

resource "aws_ec2_transit_gateway_route" "egress_default_route" {
  destination_cidr_block         = "0.0.0.0/0"
  transit_gateway_attachment_id  = aws_ec2_transit_gateway_vpc_attachment.inspection_vpc_tgw_attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.egress_tgw_rt.id
}