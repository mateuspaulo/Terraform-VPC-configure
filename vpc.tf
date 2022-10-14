# Create VPC
resource "aws_vpc" "vpc-main" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "vpc-main"
  }
}

# Create subnets and join vpc
resource "aws_subnet" "subnet-a-private" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.cidr_subnet_block_a

  tags = {
    Name = "subnet-a-private"
  }
}

resource "aws_subnet" "subnet-b-private" {
  vpc_id     = aws_vpc.vpc-main.id
  cidr_block = var.cidr_subnet_block_b

  tags = {
    Name = "subnet-b-private"
  }
}

# Create  Security Group
resource "aws_security_group" "Security-Group-main" {
  name        = "Security-Group-main"
  description = "Security-Group-main"
  vpc_id      = aws_vpc.vpc-main.id

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.ip-ssh]
  }

  ingress {
    description      = "All traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Security-Group-main"
  }
}