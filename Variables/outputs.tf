output "hostname" {
    description = "The public DNS name of the EC2 instance"
    value       = aws_instance.app_server.public_dns
}
output "subnet_id" {
    description = "The subnet ID where the instance is deployed"
    value       = aws_instance.app_server.subnet_id
}