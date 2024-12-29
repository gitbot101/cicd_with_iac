resource "aws_launch_template" "jenkins_lt" {
  name          = "jenkins_lt"
  image_id      = var.ami_id
  instance_type = var.instance_type
#  key_name      = var.key_name

#  network_interfaces {
#    associate_public_ip_address = true
#    security_groups             = [aws_security_group.jenkins_sg.id]
#  }

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  user_data = filebase64(var.userdata_file)
}

