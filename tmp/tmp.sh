git clone https://github.com/paulgoetze/flask-gcs-upload-example-app.git
run_image -d python:3.10 bash
docker rename run_image flask-gcs

# docker exec -u root -it python bash
docker exec -u root -it flask-gcs bash
pip install pipenv
pip install mysqlclient

docker exec -it flask-gcs bash
pipenv install
pipenv shell

flask --help

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

FLASK_APP=my_app flask db upgrade

FLASK_APP=my_app flask run --host=0.0.0.0
curl http://flask-gcs:5000

pytest
