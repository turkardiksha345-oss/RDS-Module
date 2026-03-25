output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.my_rds.endpoint
}

output "rds_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.my_rds.id
}

output "rds_arn" {
  description = "RDS ARN"
  value       = aws_db_instance.my_rds.arn
}
