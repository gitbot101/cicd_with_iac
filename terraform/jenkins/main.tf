# declare AWS as provider
# using us-east-1 as region

# VPC: Define main_vpc as the VPC to host the devops infra 

resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
      Name = "devops-cicd-vpc"
    }
  }

# VPC: Subnets - 1 public-subnet and 1 private-subnet

  resource "aws_subnet" "public_subnet" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-1a"
    tags = {
      Name = "public-subnet"
    }
  }

  resource "aws_subnet" "private_subnet_1" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
      Name = "private-subnet-1"
    }
  }

  resource "aws_subnet" "private_subnet_2" {
    vpc_id            = aws_vpc.main_vpc.id
    cidr_block        = "10.0.3.0/24"
    availability_zone = "us-east-1c"
    tags = {
      Name = "private-subnet-2"
    }
  }

# VPC: IGW - define the internet-gateway to provide Internet access to the public-subnet

  resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
      Name = "main-igw"
    }
  }

# VPC: Route Table - define the route-table to provide the route to the IGW

  resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main_vpc.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name = "public-route-table"
    }
  }

# VPC: Associate the public-subnet to the public-route-table
 
  resource "aws_route_table_association" "public_subnet_association" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
  }

