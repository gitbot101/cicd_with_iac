# Define Security Groups for Jenkins

resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  vpc_id      = aws_vpc.main_vpc.id
  description = "Security group for Jenkins server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define Security Groups for RDS

resource "aws_security_group" "rds_sg" { 
  name = "rds_security_group" 
  vpc_id      = aws_vpc.main_vpc.id
  description = "Security group for RDS instance" 
  egress { 
    from_port = 0
    to_port = 0 
    protocol = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
  } 

  ingress { 
    from_port = 3306 
    to_port = 3306 
    protocol = "tcp" 
    cidr_blocks = ["10.0.2.0/24", "10.0.3.0/24"]
  } 
}

