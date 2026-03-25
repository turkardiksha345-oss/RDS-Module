resource "aws_db_subnet_group" "my_db_subnet" {
  name = "my-rds-subnet-group"

  subnet_ids = var.subnet_ids

  tags = {
    Name = "my-rds-subnet-group"
  }
}

resource "aws_db_instance" "my_rds" {
  identifier             = "my-rds-instance"   
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = 10

  db_name                = var.db_name
  username               = var.username
  password               = var.password

  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet.name
  vpc_security_group_ids = [var.security_group_id]   

  publicly_accessible    = false
  skip_final_snapshot    = true

  tags = {
    Name = "my-db"
  }
}
