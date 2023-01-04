resource "aws_security_group" "allow_https-vpc-a" {
  name        = "allow_https-spoke-vpc-a-ep"
  description = "Allow HTTPS inbound traffic"
  vpc_id     = aws_vpc.net_fw_poc_vpc["spoke-vpc-01"].id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.spoke-vpc-01-cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_https"
  }
}

resource "aws_security_group" "allow_https-vpc-b" {
  name        = "allow_https-spoke-vpc-b-ep"
  description = "Allow HTTPS inbound traffic"
  vpc_id     = aws_vpc.net_fw_poc_vpc["spoke-vpc-02"].id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.spoke-vpc-01-cidr]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_https"
  }
}

resource "aws_security_group" "allow_icmp-vpc-a" {
  name        = "allow_icmp-spoke-vpc-a"
  description = "Allow ICMP inbound traffic"
  vpc_id     = aws_vpc.net_fw_poc_vpc["spoke-vpc-01"].id

  ingress {
    description      = "ICMP from VPC"
    from_port        = -1
    to_port          = -1
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_icmp"
  }
}

resource "aws_security_group" "allow_icmp-vpc-b" {
  name        = "allow_icmp-spoke-vpc-b"
  description = "Allow ICMP inbound traffic"
  vpc_id     = aws_vpc.net_fw_poc_vpc["spoke-vpc-02"].id

  ingress {
    description      = "ICMP from VPC"
    from_port        = -1
    to_port          = -1
    protocol         = "tcp"
    cidr_blocks      = ["10.0.0.0/8"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_icmp"
  }
}