# No / in the values
db_user="<user>"
db_password="<password>"
db_name="<db_name>"

secret_key=$(python3 -c "import uuid; print(uuid.uuid4().hex)")
# cd ~ && git clone https://github.com/AndreasArne/redovisnings-sida.git
# cd redovisnings-sida 
git fetch --tags
latestTag=$(git describe --tags `git rev-list --tags --max-count=1`)
git checkout $latestTag

python3 -m venv venv
. venv/bin/activate
pip install -r requirements.txt

echo "export FLASK_APP=me_page.py" >> ~/.profile 
cat infrastructure-as-code/scripts/resources/.env_local | sed "s/<secret-key/$secret_key/; s/<user>/$db_user/; s/<password>/$db_password/; s/<db-name>/$db_name/" > .env
source ~/.profile
flask --help
