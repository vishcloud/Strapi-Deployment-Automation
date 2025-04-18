output "strapi_instance_id" {
  value = aws_instance.vishal_strapi_server.id
}

output "strapi_public_ip" {
  value = aws_instance.vishal_strapi_server.public_ip
}

output "strapi_public_dns" {
  value = aws_instance.vishal_strapi_server.public_dns
}