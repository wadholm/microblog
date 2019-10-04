# Install ufw and setup firewall for HTTP and HTTPS
apt-get install -y ufw
ufw allow ssh # 22
ufw allow http # 80
ufw allow 443/tcp # https
ufw --force enable
ufw status