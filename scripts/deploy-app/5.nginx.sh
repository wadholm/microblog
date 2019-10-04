conf_filename="<filename-for-config-in-sites-available>"
domain="<domain>"
well_known_path="<.well-known-path>"
static_path="<static-folder-path>"

cat infrastructure-as-code/scripts/resources/nginx.conf | sed "s/<domain>/$domain/; s|<.well-known-path>|$well_known_path|" > /etc/nginx/sites-available/$conf_filename

$(cd /etc/nginx/sites-enabled && sudo ln -s /etc/nginx/sites-available/$conf_filename)

sudo nginx -t && sudo service nginx restart



# https
echo "deb http://deb.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
echo "deb http://deb.debian.org/debian stretch-backports main contrib non-free" >> /etc/apt/sources.list

sudo apt-get update
sudo apt-get install -y python-certbot-nginx -t stretch-backports

sudo certbot --nginx # need manuell input

cat infrastructure-as-code/scripts/resources/nginx_https.conf | sed "s/<domain>/$domain/; s|<.well-known-path>|$well_known_path|; s|<static-path>|$static_path|" > /etc/nginx/sites-available/$conf_filename

sudo nginx -t && sudo service nginx restart
