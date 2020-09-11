db_user="db_u"
db_password="db_p"
db_name="microblog"

sql_code=$(cat scripts/deploy-app/resources/setup.sql | sed "s/<db-name>/$db_name/; s/<user>/$db_user/; s/<password>/$db_password/")
echo "$sql_code" | sudo mysql -uroot -p"$db_password"

. venv/bin/activate
flask db upgrade
