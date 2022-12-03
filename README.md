https://paulgoetze.medium.com/uploading-files-to-google-cloud-storage-using-a-flask-api-part-1-7a4e379911d7

Database
```
docker rm -f flask_mysql

docker run \
  --network="${RIDE_NETWORK}" \
  -d \
  --name=flask_mysql \
  -v mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=slimdingo85 \
  -e MYSQL_DATABASE=flask \
  -e MYSQL_USER=flask \
  -e MYSQL_PASSWORD=slimdingo85 \
  mysql:5.7

docker start flask_mysql
```

```
run_image -d python:3.10 bash
docker rename run_image flask-gsheets-gcs

docker exec -u root -it flask-gsheets-gcs bash
pip install pipenv

docker exec -it flask-gsheets-gcs bash
pipenv install

docker start flask-gsheets-gcs
pipenv shell

flask --help

FLASK_APP=my_app flask db upgrade

FLASK_APP=my_app flask run --host=0.0.0.0
curl http://flask-gsheets-gcs:5000/users

pytest
pytest -s -k 'test_get_all_users'
```

