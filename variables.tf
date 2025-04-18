variable "aws_region" {
description = "AWS region to deploy resources"
default = "us-east-1"
}

variable "instance_type" {
description = "EC2 instance type"
default = "t2.medium"
}

variable "ssh_key_name" {
description = "Name of SSH key pair for EC2 instance"
type = string
}

variable "vpc_id" {
description = "VPC ID where resources will be created"
type = string
}

variable "subnet_id" {
description = "Subnet ID where EC2 will be deployed"
type = string
}

variable "strapi_database_name" {
description = "Name for Strapi database"
default = "strapi"
}

variable "strapi_database_username" {
description = "Username for Strapi database"
default = "strapiuser"
}

variable "strapi_database_password" {
description = "Password for Strapi database"
sensitive = true
type = string
}