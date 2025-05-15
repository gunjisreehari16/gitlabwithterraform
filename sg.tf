# Security Group for GitLab (updated to allow all SSH connections)
resource "aws_security_group" "gitlab_sg" {
  name        = "gitlab-sg"
  vpc_id      = aws_vpc.RSP_IOT_vpc.id
  description = "Allow GitLab web and SSH access"

  # Allow SSH access from anywhere (0.0.0.0/0 means all IP addresses)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Open to all IP addresses
  }

  # HTTP access (GitLab web UI)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS access (GitLab secure web UI)
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Internal VPC communication (optional)
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  # Outbound access (all traffic allowed)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "gitlab-sg"
  }
}

