# https://docs.sqlalchemy.org/en/14/orm/tutorial.html
run_image -d python:3.10 bash
docker rename run_image flask-gcs-test

docker exec -it flask-gcs-test bash
docker exec -u root -it flask-gcs-test bash

pip install 'shillelagh' 'shillelagh[all]' sqlalchemy
pipenv install 'shillelagh' 'shillelagh[all]'

python
python tmp/gsheet.py

