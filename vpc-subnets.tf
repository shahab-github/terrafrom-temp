# creatting a New VPC

resource "aws_vpc" "vpc" {
  cidr_block       = "172.30.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

# creating a new subnet

resource "aws_subnet" "sub1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.30.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "sub1"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.30.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "sub2"
  }
}
