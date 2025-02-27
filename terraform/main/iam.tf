# IAM: Define the eks_role to allow actions in AWS EKS service

resource "aws_iam_role" "eks_role" {
    name = "eks_role"
    assume_role_policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [{
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "eks.amazonaws.com"
        }
      }]
    })
  }

# IAM: Attach the AmazonEKSClusterPolicy that enables Kubernetes actions

resource "aws_iam_role_policy_attachment" "eks_policy_attachment" {
    role       = aws_iam_role.eks_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  }
  

# IAM: Define the rds_role to allow actions in the AWS RDS service

resource "aws_iam_role" "rds_role" {
    name = "rds_role"
    assume_role_policy = jsonencode({
      "Version": "2012-10-17",
      "Statement": [{
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
          "Service": "rds.amazonaws.com"
        }
      }]
    })
  }


#IAM: Attach the AmazonRDSFullAccess policy to the rds_role for performing all actions in AWS RDS

resource "aws_iam_role_policy_attachment" "rds_policy_attachment" {
    role       = aws_iam_role.rds_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  }

