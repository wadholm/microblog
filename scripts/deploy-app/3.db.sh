db_name="<db-name>"
db_user="<user>"
db_password="<password>"

sql_code=$(cat infrastructure-as-code/scripts/resources/setup.sql | sed "s/<db-name>/$db_name/; s/<user>/$db_user/; s/<password>/$db_password/")
echo "$sql_code" | sudo mysql -uroot -p

. venv/bin/activate
flask db upgrade