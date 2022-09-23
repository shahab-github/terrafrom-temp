resource "aws_vpc" "vpc" {
  cidr_block       = "172.22.0.0/16"
  instance_tenancy = "default"

  tags = {
    "Name" = "MyVpc-terraform"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "MyIG"
  }
}

# By default Terraform attche Internet Gateway to VPC
# In case if it does not attache you can use "aws_internet_gateway_attachment"
resource "aws_internet_gateway_attachment" "iga" {
  internet_gateway_id = aws_internet_gateway.ig.id
  vpc_id              = aws_vpc.vpc.id
}

resource "aws_subnet" "sub1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.22.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "subnet-pub1"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.22.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "subnet-pub2"
  }
}

resource "aws_subnet" "sub3" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.22.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "Name" = "subnet-pri1"
  }
}

resource "aws_subnet" "sub4" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.22.4.0/24"
  availability_zone = "us-east-1b"

  tags = {
    "Name" = "subnet-pri2"
  }
}


resource "aws_route_table" "priRT" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    "Name" = "pub-RT"
  }
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.priRT.id
}

resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.priRT.id
}
