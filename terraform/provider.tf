terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  /*
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "net-fw-poc-2827673217823912"
    key    = "global/s3/terraform.tfstate"
    region = "us-west-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "net-fw-poc-locks12543543"
    encrypt        = true
  }*/
}