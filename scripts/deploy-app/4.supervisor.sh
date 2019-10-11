sudo cp scripts/deploy-app/resources/supervisor.conf /etc/supervisor/conf.d/microblog.conf

sudo mkdir /var/log/microblog
sudo chmod 755 /var/log/microblog

sudo supervisorctl reload