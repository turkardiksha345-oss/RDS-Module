variable "env" {
  description = " Pass Environment "
  type        = string
}

variable "engine" {
  description = "Database engine"
  type        = string
}

variable "engine_version" {
  description = "Engine version"
  type        = string
}

variable "instance_class" {
  description = "RDS instance type"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "username" {
  description = "DB username"
  type        = string
}

variable "password" {
  description = "DB password"
  type        = string
  sensitive   = true
}
