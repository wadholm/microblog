sudo cp scripts/deploy-app/resources/supervisor.conf /etc/supervisor/conf.d/microblog.conf

sudo mkdir /var/log/microblog
sudo chmod 777 /var/log/microblog

sudo supervisorctl reload
