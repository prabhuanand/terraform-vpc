# Define the route table
#resource "aws_route_table" "rt-private" {
resource "aws_route_table" "rt-public" {
  vpc_id = "${aws_vpc.vpc_core.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gateway.id}"
  }

  tags {
    Name        = "${var.environment}-rt-public"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

#resource "aws_route_table" "rt-public" {
resource "aws_route_table" "rt-private" {
  vpc_id = "${aws_vpc.vpc_core.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw_core.id}"
  }

  tags {
    Name        = "${var.environment}-rt-private"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_route_table" "rt-bastion" {
  vpc_id = "${aws_vpc.vpc_core.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw_core.id}"
  }

  tags {
    Name        = "${var.environment}-rt-bastion"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

#Set the main route table
resource "aws_main_route_table_association" "vpc_default_route_table" {
  vpc_id         = "${aws_vpc.vpc_core.id}"
#  route_table_id = "${aws_route_table.rt-public.id}"
  route_table_id = "${aws_route_table.rt-private.id}"
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "rt_association_public-1" {
  subnet_id      = "${aws_subnet.public-subnet-region-1.id}"
#  route_table_id = "${aws_route_table.rt-public.id}"
  route_table_id = "${aws_route_table.rt-private.id}"
}

resource "aws_route_table_association" "rt_association_public-2" {
  subnet_id      = "${aws_subnet.public-subnet-region-2.id}"
#  route_table_id = "${aws_route_table.rt-public.id}"
  route_table_id = "${aws_route_table.rt-private.id}"
}

resource "aws_route_table_association" "rt_association_public-3" {
  subnet_id      = "${aws_subnet.public-subnet-region-3.id}"
#  route_table_id = "${aws_route_table.rt-public.id}"
  route_table_id = "${aws_route_table.rt-private.id}"
}

resource "aws_route_table_association" "rt_association_private-1" {
  subnet_id      = "${aws_subnet.private-subnet-region-1.id}"
#  route_table_id = "${aws_route_table.rt-private.id}"
  route_table_id = "${aws_route_table.rt-public.id}"
}

resource "aws_route_table_association" "rt_association_private-2" {
  subnet_id      = "${aws_subnet.private-subnet-region-2.id}"
#  route_table_id = "${aws_route_table.rt-private.id}"
  route_table_id = "${aws_route_table.rt-public.id}"
}

resource "aws_route_table_association" "rt_association_private-3" {
  subnet_id      = "${aws_subnet.private-subnet-region-3.id}"
#  route_table_id = "${aws_route_table.rt-private.id}"
  route_table_id = "${aws_route_table.rt-public.id}"
}

resource "aws_route_table_association" "rt_association_bastion" {
  subnet_id      = "${aws_subnet.bastion-subnet.id}"
  route_table_id = "${aws_route_table.rt-bastion.id}"
}

