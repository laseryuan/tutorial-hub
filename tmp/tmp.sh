SQLALCHEMY_DATABASE_URI="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@flask_mysql/${MYSQL_DATABASE}"
echo $SQLALCHEMY_DATABASE_URI

run_image -d python:3.10 bash
docker rename run_image flask-shillelagh

docker exec -u root -it flask-shillelagh bash
pip install pipenv ipdb
docker exec -it flask-shillelagh bash
pipenv install
pipenv install ipdb

pipenv update --dry-run
pipenv graph
pipenv install Flask-SQLAlchemy==
pipenv install Flask-SQLAlchemy==3.0.2
pipenv install SQLAlchemy==
pipenv install Flask-SQLAlchemy==2.5.1
pipenv install SQLAlchemy==1.4.44
pipenv install filedepot==
pipenv graph | grep depot
pipenv install flask==
pipenv graph | grep Flask

client
pipenv install
pipenv shell

FLASK_APP=my_app flask db upgrade
FLASK_APP=my_app flask run --host=0.0.0.0
FLASK_APP=my_app flask run --host=0.0.0.0 --no-reload

cd tmp
git clone git@github.com:laseryuan/shillelagh
ls -l $(pipenv --venv)/lib/python3.10/site-packages/
cd $(pipenv --venv)/lib/python3.10/site-packages/
mv shillelagh shillelagh.bak
ls -l /tmp/data/tmp/shillelagh/src/shillelagh
ln -s /tmp/data/tmp/shillelagh/src/shillelagh/
ls -l shillelagh
ls -l shillelagh/
ls -l shillelagh.bak/

cd ~/data



