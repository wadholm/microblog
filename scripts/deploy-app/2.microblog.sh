# PS: No / in the values
db_user="<db_user>"
db_password="<db_password>"
db_name="<db_name>"

secret_key=$(python3 -c "import uuid; print(uuid.uuid4().hex)")

# cd ~ && git clone https://github.com/dbwebb-se/microblog.git
# git fetch --tags # Comment this line to use latest commit
# latestTag=$(git describe --tags `git rev-list --tags --max-count=1`) # Comment this line to use latest commit
# git checkout $latestTag # Comment this line to use latest commit

python3 -m venv venv
. venv/bin/activate
pip install -r requirements.txt

echo "export FLASK_APP=microblog.py" >> ~/.profile
cat scripts/deploy-app/resources/.env_local | sed "s/<secret-key/$secret_key/; s/<user>/$db_user/; s/<password>/$db_password/; s/<db-name>/$db_name/" > .env
. ~/.profile
flask --help
