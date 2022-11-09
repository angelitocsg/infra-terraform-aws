resource "aws_vpc" "aws-vpc" {
  enable_dns_hostnames = true
  enable_dns_support   = true
  cidr_block           = "10.11.0.0/16"

  tags = {
    Name = "${var.microservice}-vpc"
  }
}

resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.aws-vpc.id
  availability_zone = var.region_az_a
  cidr_block        = cidrsubnet(aws_vpc.aws-vpc.cidr_block, 4, 1)

  tags = {
    Name = "${var.microservice}-subnet-a"
  }
}

resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.aws-vpc.id
  availability_zone = var.region_az_b
  cidr_block        = cidrsubnet(aws_vpc.aws-vpc.cidr_block, 4, 2)

  tags = {
    Name = "${var.microservice}-subnet-b"
  }
}

resource "aws_subnet" "subnet_c" {
  vpc_id            = aws_vpc.aws-vpc.id
  availability_zone = var.region_az_c
  cidr_block        = cidrsubnet(aws_vpc.aws-vpc.cidr_block, 4, 3)

  tags = {
    Name = "${var.microservice}-subnet-c"
  }
}
