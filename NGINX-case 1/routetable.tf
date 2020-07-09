
resource "aws_route_table" "rtb_public" {
  vpc_id = aws_vpc.vpc.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.rtb_public_name
    Environment = var.environment_tag 
  }
}

resource "aws_route_table" "rtb_private" {
  vpc_id = aws_vpc.vpc.id


  tags = {
    Name = var.rtb_private_name
    Environment = var.environment_tag 
  }
}


resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.rtb_public.id
}


resource "aws_route_table_association" "rta_subnet_private" {
  subnet_id      = aws_subnet.subnet_private.id
  route_table_id = aws_route_table.rtb_private.id
}
