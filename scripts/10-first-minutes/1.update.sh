password="<root-password>"
# Set root password and update
echo "root:$password" | chpasswd
apt-get -y update
apt-get -y upgrade
