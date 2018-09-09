#subnets
# Define the public subnet
resource "aws_subnet" "private-subnet-region-1" {
  vpc_id            = "${aws_vpc.vpc_core.id}"
  cidr_block        = "${var.public_subnet_cidr_region_1}"
  availability_zone = "${var.aws_region_1}"

  tags {
    Name        = "${var.environment}-${var.aws_region_1}-subnet-public"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_subnet" "private-subnet-region-2" {
  vpc_id            = "${aws_vpc.vpc_core.id}"
  cidr_block        = "${var.public_subnet_cidr_region_2}"
  availability_zone = "${var.aws_region_2}"

  tags {
    Name        = "${var.environment}-${var.aws_region_2}-subnet-public"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_subnet" "private-subnet-region-3" {
  vpc_id            = "${aws_vpc.vpc_core.id}"
  cidr_block        = "${var.public_subnet_cidr_region_3}"
  availability_zone = "${var.aws_region_3}"

  tags {
    Name        = "${var.environment}-${var.aws_region_3}-subnet-public"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

# Define the private subnet
resource "aws_subnet" "public-subnet-region-1" {
  vpc_id            = "${aws_vpc.vpc_core.id}"
  cidr_block        = "${var.private_subnet_cidr_region_1}"
  availability_zone = "${var.aws_region_1}"

  tags {
    Name        = "${var.environment}-${var.aws_region_1}-subnet-private"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_subnet" "public-subnet-region-2" {
  vpc_id            = "${aws_vpc.vpc_core.id}"
  cidr_block        = "${var.private_subnet_cidr_region_2}"
  availability_zone = "${var.aws_region_2}"

  tags {
    Name        = "${var.environment}-${var.aws_region_2}-subnet-private"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_subnet" "public-subnet-region-3" {
  vpc_id            = "${aws_vpc.vpc_core.id}"
  cidr_block        = "${var.private_subnet_cidr_region_3}"
  availability_zone = "${var.aws_region_3}"

  tags {
    Name        = "${var.environment}-${var.aws_region_3}-subnet-private"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}

resource "aws_subnet" "bastion-subnet" {
  vpc_id            = "${aws_vpc.vpc_core.id}"
  cidr_block        = "${var.bastion_subnet_cidr}"
  availability_zone = "${var.aws_region_3}"

  tags {
    Name        = "${var.environment}-${var.aws_region_3}-bastion-subnet"
    Environment = "${var.environment}"
    Version     = "${var.version}"
  }
}
