# RDS - Define the RDS DB instance in AWS for cicd microservices

resource "aws_db_instance" "db_instance" {
    allocated_storage    = 20
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t3.micro"
    db_name              = "microservicesdb"
    username             = "admin"
    password             = "password"
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot  = true
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  }

# RDS - Assign the private_subnet to host the RDS DB

  resource "aws_db_subnet_group" "rds_subnet_group" {
    name       = "rds-subnet-group"
    subnet_ids = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
    tags = {
      Name = "RDS Subnet Group"
    }
  }

