provider "aws" {
  region = var.aws_region
}

# Security group for Strapi EC2 instance
resource "aws_security_group" "strapi_sg" {
  name        = "strapi-security-group"
  description = "Security group for Strapi application"
  vpc_id      = var.vpc_id

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Strapi default port
  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "strapi-sg"
  }
}

# Get latest Ubuntu 20.04 AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# EC2 instance for Strapi
resource "aws_instance" "vishal_strapi_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.strapi_sg.id]
  subnet_id              = var.subnet_id

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }

  # Render user-data.sh with aws_region variable
  user_data = templatefile("${path.module}/user-data.sh", {
    aws_region = var.aws_region
  })

  tags = {
    Name = "vishal_strapi_server"
  }

  depends_on = [aws_security_group.strapi_sg]
}
