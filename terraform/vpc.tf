resource "aws_vpc" "vpc_core" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.environment}-vpc"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

### Internet Gateways

resource "aws_internet_gateway" "igw_core" {
  vpc_id = "${aws_vpc.vpc_core.id}"

  tags {
    Name        = "${var.environment}-IGW"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_eip" "elastic_ip_nat" {
  vpc = true

  tags {
    Name        = "${var.environment}-nat-eip"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = "${aws_eip.elastic_ip_nat.id}"
  subnet_id     = "${aws_subnet.public-subnet-region-1.id}"

  depends_on = [
    "aws_internet_gateway.igw_core",
    "aws_eip.elastic_ip_nat",
  ]
}

output "VPC ID" {
  value = "${aws_vpc.vpc_core.id} "
}
