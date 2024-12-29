resource "aws_autoscaling_group" "jenkins_asg" {
  launch_template {
    id      = aws_launch_template.jenkins_lt.id
    version = "$Latest"
  }

  min_size           = var.min_size
  max_size           = var.max_size
  desired_capacity   = var.desired_capacity
  vpc_zone_identifier = [aws_subnet.public_subnet.id]
  tag {
      key                 = "Name"
      value               = "Jenkins Server"
      propagate_at_launch = true
    }
}

