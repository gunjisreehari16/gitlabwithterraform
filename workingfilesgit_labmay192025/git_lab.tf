# GitLab Server (public subnet)
resource "aws_instance" "gitlab_server" {
  ami                         = var.gitlab_ami                      # GitLab-specific Amazon Linux 2 AMI
  instance_type               = var.gitlab_instance_type            # e.g. t3.medium or t3.large
  subnet_id                   = aws_subnet.RSP_IOT_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.gitlab_sg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  user_data                   = file("scripts/gitlab_install.sh")   # startup script

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  tags = {
    Name = "GitLab Server"
  }
}

