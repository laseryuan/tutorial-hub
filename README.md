https://paulgoetze.medium.com/uploading-files-to-google-cloud-storage-using-a-flask-api-part-1-7a4e379911d7

```
docker_run -d python:3.10 bash
docker rename docker_run flask-gsheets-gcs

docker exec -u root -it flask-gsheets-gcs bash
pip install pipenv

docker exec -it flask-gsheets-gcs bash
pipenv install

pipenv shell

flask --help

FLASK_APP=my_app flask db upgrade

FLASK_APP=my_app flask run --host=0.0.0.0
curl http://flask-gsheets-gcs:5000/users

pytest
pytest -s -k 'test_get_all_users'
```

Build image
```
docker build -t flask-gsheets .
docker tag flask-gsheets lasery/flask-gsheets
docker push lasery/flask-gsheets
```

```
docker run \
  --network=ride_network \
  -v $(get_host_pwd)/my_app/config/secrets/1/app_config.py:/app/my_app/config/secrets/1/app_config.py \
  -v $(get_host_pwd)/my_app/config/secrets/2/service_account.json:/app/my_app/config/secrets/2/service_account.json \
  --name flask --rm flask-gsheets
```

Get default compute engine service account
```
gcloud run services \
  describe \
    --region=$REGION \
      ${CLOUD_RUN_SERVICE} \

SERVICE_ACCOUNT_EMAIL=\
```

Grant permission
```
gcloud projects add-iam-policy-binding \
  ${GCLOUD_PROJECT} \
    --member serviceAccount:${SERVICE_ACCOUNT_EMAIL} \
    --role="roles/secretmanager.secretAccessor" \
```

Create secret
```
gcloud secrets create flask-gsheets
gcloud secrets versions add --data-file=my_app/config/secrets/1/app_config.py flask-gsheets

gcloud secrets create flask-gsheets-service_account
gcloud secrets versions add --data-file=my_app/config/secrets/2/service_account.json flask-gsheets-service_account
```

deploy
```
gcloud run deploy \
  ${CLOUD_RUN_SERVICE} \
    --region=$REGION \
    --allow-unauthenticated \
    --set-secrets=/app/my_app/config/secrets/1/app_config.py=flask-gsheets:latest,/app/my_app/config/secrets/2/service_account.json=flask-gsheets-service_account:latest \
    --port=8000 \
    --source=. \
```

Update service
```
gcloud run services \
  update \
    --region=$REGION \
      ${CLOUD_RUN_SERVICE} \
      --port=8000 \
```
