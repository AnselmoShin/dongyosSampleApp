data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_vpc" "dev" {
    cidr_block = "10.1.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    instance_tenancy = "default"

    tags = {
        "Name" = "dev"
    }
}

resource "aws_subnet" "dev_public_a" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.1.0.0/20"
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.id[0]
    tags = {
      "Name" = "dev_public_a"
    }
}
resource "aws_subnet" "dev_public_b" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.1.16.0/20"
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.id[1]
    tags = {
      "Name" = "dev_public_b"
    }
}
resource "aws_subnet" "dev_public_c" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.1.32.0/20"
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.id[2]
    tags = {
      "Name" = "dev_public_c"
    }
}
resource "aws_subnet" "dev_private_a" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.1.48.0/20"
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available.id[0]
    tags = {
      "Name" = "dev_private_a"
    }
}
resource "aws_subnet" "dev_private_b" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.1.64.0/20"
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available.id[1]
    tags = {
      "Name" = "dev_private_b"
    }
}
resource "aws_subnet" "dev_private_c" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.1.80.0/20"
    map_public_ip_on_launch = false
    availability_zone = data.aws_availability_zones.available.id[2]
    tags = {
      "Name" = "dev_private_c"
    }
}

resource "aws_internet_gateway" "dev_igw" {
    vpc_id = aws_vpc.dev.id
    tags = {
      "Name" = "dev-igw"
    }
}
resource "aws_route_table_association" "dev_public_rtb" {
    vpc_id = aws_vpc.dev.id

    route {
        
    }
}