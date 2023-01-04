/*
output "vpc-id" {
  value = {
      for vpc_name, vpc_id in aws_vpc.vnext_vpc : vpc_name => vpc_id.id
  }
}

output "subnet-id-prod" {
  value = {
      for subnet_name, subnet_id in aws_subnet.prod-cluster-subnets : subnet_name => subnet_id.id
  }
}

output "subnet-id-dev" {
  value = {
      for subnet_name, subnet_id in aws_subnet.dev-cluster-subnets : subnet_name => subnet_id.id
  }
}

*/