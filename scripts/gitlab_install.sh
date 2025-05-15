#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt install -y curl openssh-server ca-certificates tzdata perl

# Install Postfix (for email notifications)
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

# Add GitLab repository
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

# Get public IP and configure external_url
PUBLIC_IP=$(curl -s http://checkip.amazonaws.com)
echo "Setting external_url to http://${PUBLIC_IP}"
sudo sed -i "s|^# external_url 'http://localhost'|external_url 'http://${PUBLIC_IP}'|" /etc/gitlab/gitlab.rb

# Install GitLab CE
sudo EXTERNAL_URL="http://${PUBLIC_IP}" apt-get install -y gitlab-ce

# Reconfigure GitLab
sudo gitlab-ctl reconfigure

# Enable GitLab at boot
sudo systemctl enable gitlab-runsvdir

echo "🎉 GitLab CE installation complete!"
echo "🌐 Access it at: http://${PUBLIC_IP}"
echo "🔐 Initial root password is stored in: /etc/gitlab/initial_root_password"
