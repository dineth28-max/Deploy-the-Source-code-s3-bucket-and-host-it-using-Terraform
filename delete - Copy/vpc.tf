resource "aws_vpc" "vpc_tf" {
  cidr_block = "10.0.0.0/16"

  tags={
    Name= "My-VPC-cit-24-01-0396"
  }
}


resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = "10.0.1.0/24"
  availability_zone= "ap-southeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-A-cit-24-01-0396"
  }
}
resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.vpc_tf.id
  cidr_block = "10.0.2.0/24"
  availability_zone= "ap-southeast-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-B-cit-24-01-0396"
  }
}




resource "aws_internet_gateway" "tf_gw" {
  vpc_id = aws_vpc.vpc_tf.id

  tags = {
    Name = "My-IGW-cit-24-01-0396"
  }
}


resource "aws_route_table" "route_table_tf" {
  vpc_id = aws_vpc.vpc_tf.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_gw.id
  }
  
  tags = {
    Name = "Public-RT-cit-24-01-0396"
  }

}

resource "aws_route_table_association" "public_rt" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.route_table_tf.id
}

resource "aws_route_table_association" "public_rt_b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.route_table_tf.id
}