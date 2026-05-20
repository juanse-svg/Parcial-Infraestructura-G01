output "alb_dns_name" {
  description = "URL del Load Balancer"
  value       = aws_lb.main.dns_name
}

output "ec2_a_public_ip" {
  description = "IP pública EC2 instancia A"
  value       = aws_instance.app_a.public_ip
}

output "ec2_b_public_ip" {
  description = "IP pública EC2 instancia B"
  value       = aws_instance.app_b.public_ip
}

output "db_endpoint" {
  description = "Endpoint de la base de datos"
  value       = aws_db_instance.primary.endpoint
}