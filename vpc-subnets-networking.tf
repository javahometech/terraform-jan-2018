# Define VPC
resource "aws_vpc" "myvpc" {
  cidr_block = "${var.vpc_cidr}"

  tags {
    Name = "myvpc"
  }
}

# Define subnet

resource "aws_subnet" "subnets" {
  count             = "${length(var.subnets_cidr)}"
  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"
  cidr_block        = "${element(var.subnets_cidr,count.index)}"
  vpc_id            = "${aws_vpc.myvpc.id}"

  tags {
    Name = "Subnet-${count.index + 1}"
  }
}

# Create and attach Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.myvpc.id}"

  tags {
    Name = "myvpc-igw"
  }
}

# Custom route table for public subnets
resource "aws_route_table" "public_rt" {
  vpc_id = "${aws_vpc.myvpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "main"
  }
}

# associate public route table for all public subnets

resource "aws_route_table_association" "a" {
  # We have to fixit later
  count          = "${length(aws_subnet.subnets.*.id)}"
  subnet_id      = "${element(aws_subnet.subnets.*.id,count.index)}"
  route_table_id = "${aws_route_table.public_rt.id}"
}
