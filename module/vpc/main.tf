# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = { Name = "igw" }
}

# Public subnets (one per AZ)
resource "aws_subnet" "public" {
  for_each = toset(var.azs)
  vpc_id   = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr, 8, index(var.azs, each.key))
  map_public_ip_on_launch = true
  availability_zone       = each.key
  tags = { Name = "public-${each.key}" }
}

# Private subnets (one per AZ)
resource "aws_subnet" "private" {
  for_each = toset(var.azs)
  vpc_id   = aws_vpc.vpc.id
  cidr_block = cidrsubnet(var.cidr, 8, index(var.azs, each.key)+10)
  map_public_ip_on_launch = false
  availability_zone       = each.key
  tags = { Name = "private-${each.key}" }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = { Name = "public-rt" }
}

# Route to Internet Gateway
resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public_subnets" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

# NAT Gateway for private subnets
resource "aws_eip" "nat" {
  for_each = aws_subnet.public
  
}

resource "aws_nat_gateway" "nat" {
  for_each = aws_subnet.public
  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = each.value.id
}

# Private Route Tables per AZ
resource "aws_route_table" "private" {
  for_each = aws_subnet.private
  vpc_id = aws_vpc.vpc.id
  tags = { Name = "private-rt-${each.key}" }
}

# Route private subnets to NAT Gateway
resource "aws_route" "private_nat" {
  for_each = aws_subnet.private
  route_table_id         = aws_route_table.private[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[each.key].id
}

# Associate private subnets with their route table
resource "aws_route_table_association" "private_assoc" {
  for_each = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}
