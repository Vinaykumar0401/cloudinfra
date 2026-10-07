resource "aws_vpc" "prod-e-cart" {
  cidr_block           = var.vpc_cidr
  tags = {
    Name = "prod-e-cart-vpc"
  }
}
resource "aws_internet_gateway" "prod-e-cart" {
  vpc_id = aws_vpc.prod-e-cart.id
  tags = {
    Name = "prod-e-cart-igw"
  }
}
resource "aws_subnet" "prod-e-cart-public-1" {
  vpc_id                  = aws_vpc.prod-e-cart.id
  cidr_block              = var.public_subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_1
  tags = {
    Name = "prod-e-cart-public-subnet-1"
  }
}

resource "aws_subnet" "prod-e-cart-public-2" {
  vpc_id                  = aws_vpc.prod-e-cart.id
  cidr_block              = var.public_subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_2
  tags = {
    Name = "prod-e-cart-public-subnet-2"
  }
}
resource "aws_subnet" "prod-e-cart-private-subnet-app-1" {
  vpc_id            = aws_vpc.prod-e-cart.id
  cidr_block        = var.private_subnet_app_cidr_1
  availability_zone = var.availability_zone_1
  tags = {
    Name = "prod-e-cart-private-subnet-app-1"
  }
}
resource "aws_subnet" "prod-e-cart-private-subnet-app-2" {
  vpc_id            = aws_vpc.prod-e-cart.id
  cidr_block        = var.private_subnet_app_cidr_2
  availability_zone = var.availability_zone_2
  tags = {
    Name = "prod-e-cart-private-subnet-app-2"
  }
}

resource "aws_subnet" "prod-e-cart-private-subnet-db-1" {
  vpc_id            = aws_vpc.prod-e-cart.id
  cidr_block        = var.private_subnet_db_cidr_1
  availability_zone = var.availability_zone_1 
  tags = {
    Name = "prod-e-cart-private-subnet-db-1"
  }
}
resource "aws_subnet" "prod-e-cart-private-subnet-db-2" {
  vpc_id            = aws_vpc.prod-e-cart.id
  cidr_block        = var.private_subnet_db_cidr_2
  availability_zone = var.availability_zone_2
  tags = {
    Name = "prod-e-cart-private-subnet-db-2"
  }
}
resource "aws_route_table" "prod-e-cart-public" {
  vpc_id = aws_vpc.prod-e-cart.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod-e-cart.id
  }
}
resource "aws_route_table_association" "prod-e-cart-public" {
  subnet_id      = aws_subnet.prod-e-cart-public-1.id
  route_table_id = aws_route_table.prod-e-cart-public.id
}

resource "aws_route_table_association" "prod-e-cart-public-2" {
  subnet_id      = aws_subnet.prod-e-cart-public-2.id
  route_table_id = aws_route_table.prod-e-cart-public.id
}
resource "aws_security_group" "prod-e-cart" {
  name        = "prod-e-cart-sg"
  description = "Security group for prod-e-cart VPC"
  vpc_id      = aws_vpc.prod-e-cart.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}