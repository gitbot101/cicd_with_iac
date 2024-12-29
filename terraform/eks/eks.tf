# EKS - Define the EKS cluster in AWS with auto-scaling node groups with desired(3), min(2), max(5) nodes

module "eks" {
    source          = "terraform-aws-modules/eks/aws"
    version         = "17.24.0"
    cluster_name    = "cicd-eks-cluster"
    cluster_version = "1.24"
    vpc_id          = aws_vpc.main_vpc.id
    subnets         = [aws_subnet.public_subnet.id, aws_subnet.private_subnet_1.id]
    node_groups = {
      eks_nodes = {
        desired_capacity = 3
        max_capacity     = 5
        min_capacity     = 2
        instance_type = "t3.medium"
        key_name      = "./jenkins_aws_kp.pem"
        tags = {
          Name = "cicd-eks-node"
        }
      }
    }
  }
