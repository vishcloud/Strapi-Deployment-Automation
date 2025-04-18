#!/bin/bash
set -ex

LOG_FILE=/var/log/strapi-docker-deploy.log
exec > >(tee -a $LOG_FILE) 2>&1

# Update and upgrade system packages
apt update -y && apt upgrade -y

# Install Docker and AWS CLI
apt install -y docker.io awscli

# Start and enable Docker service
systemctl start docker
systemctl enable docker

# Add ubuntu user to docker group
usermod -aG docker ubuntu

# Generate secrets
APP_KEYS="myKeyA,myKeyB"
ADMIN_JWT_SECRET=$(openssl rand -base64 32)
API_TOKEN_SALT=$(openssl rand -base64 16)
TRANSFER_TOKEN_SALT=$(openssl rand -base64 16)

# Login to AWS ECR
aws ecr get-login-password --region ${aws_region} | docker login --username AWS --password-stdin 118273046134.dkr.ecr.${aws_region}.amazonaws.com

# Pull the Strapi Docker image
docker pull 118273046134.dkr.ecr.${aws_region}.amazonaws.com/strapi-vishal:latest

# Stop and remove existing container if any
docker rm -f strapi || true

# Run the Strapi container
docker run -d --name strapi -p 1337:1337 \
  -e APP_KEYS="$APP_KEYS" \
  -e ADMIN_JWT_SECRET="$ADMIN_JWT_SECRET" \
  -e API_TOKEN_SALT="$API_TOKEN_SALT" \
  -e TRANSFER_TOKEN_SALT="$TRANSFER_TOKEN_SALT" \
  118273046134.dkr.ecr.${aws_region}.amazonaws.com/strapi-vishal:latest

echo "Strapi Docker container deployed at $(date)" >> $LOG_FILE
