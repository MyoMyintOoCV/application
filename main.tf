terraform {
  required_providers {
        aws = {
     source = "hashicorp/aws"
    version = "~> 4.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
      region = "AWS_DEFAULT_REGION"
  access_key = "AWS_ACCESS_KEY_ID"
  secret_key = "AWS_SECRET_ACCESS_KEY"
}

# Create a VPC
resource "aws_vpc" "mainProduction-vpc" {
  cidr_block = "10.0.0.0/16"
        tags = {
      "Name" = "Production-vpc"  
  }
}

# Create a subnet
resource "aws_sunnet" "PublicSubnet"{
       vpc_id = aws_vpc.mainProduction-vpc.id
   cidr_block = "10.0.1.0/24"
availability_zone = "us-east-1a"
         tags = {
       "Name" = "PublicSubnet-1"
  }
}