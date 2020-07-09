# VPC
# Subnet inside VPC
# Internet gateway associated with VPC
# Route Table inside VPC with a route that directs internet-bound traffic to the internet gateway
# Route table association with our subnet to make it a public subnet


#resources

# https://www.terraform.io/docs/providers/aws/r/vpc.html
# Provides a VPC resource.

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Environment = var.environment_tag
  }
}

# Provides a resource to create a VPC Internet Gateway.
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Environment = var.environment_tag
  }
}


resource "aws_subnet" "subnet_public" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
  tags = {
    Environment = var.environment_tag
  }
}

resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Environment = var.environment_tag 
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rtb_public.id
}
