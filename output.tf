output "rds_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.my_rds.endpoint
}

output "rds_id" {
  value = aws_db_instance.my_rds.id
}

output "rds_arn" {
  value = aws_db_instance.my_rds.arn
}
