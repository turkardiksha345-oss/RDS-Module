
data "aws_vpc" "default" {
  default = true
}


data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}


resource "aws_db_subnet_group" "my_db_subnet" {
  name       = "my-rds-subnet-group"
  subnet_ids = data.aws_subnets.default.ids   # ✅ using default subnets

  tags = {
    Name = "my-rds-subnet-group"
  }
}

resource "aws_db_instance" "my_rds" {
  identifier              = "my-rds-instance"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = 10

  db_name                 = var.db_name
  username                = var.username
  password                = var.password

  db_subnet_group_name    = aws_db_subnet_group.my_db_subnet.name
  vpc_security_group_ids  = [data.aws_security_group.default.id]   

  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = {
    Name = "my-db"
  }
}
