SQLALCHEMY_DATABASE_URI="mysql://${MYSQL_USER}:${MYSQL_PASSWORD}@flask_mysql/${MYSQL_DATABASE}"
echo $SQLALCHEMY_DATABASE_URI

docker exec -it flask-gcs bash

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

pytest
pytest -s -k 'test_get_all_users'
pytest -s -k 'test_create_a_user'
client
pipenv install
pipenv shell

FLASK_APP=my_app flask db upgrade
