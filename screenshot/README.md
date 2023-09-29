# Screenshot Job

Create a Cloud Run job to take screenshots of web pages.

See the full [codelab](https://codelabs.developers.google.com/codelabs/cloud-starting-cloudrun-jobs#0).

* Setup gcloud
```
PROJECT_ID=[YOUR-PROJECT-ID]
REGION=us-central1
gcloud config set core/project $PROJECT_ID
gcloud config set run/region $REGION
```

* Enable APIs
```
gcloud services enable \
  artifactregistry.googleapis.com \
  cloudbuild.googleapis.com \
  run.googleapis.com
```

* Create a Artifact Registry repository
```
gcloud artifacts repositories create containers --repository-format=docker --location=$REGION
```

* Build the container image
```
gcloud builds submit -t $REGION-docker.pkg.dev/$PROJECT_ID/containers/screenshot:v1
```

* Create a service account for the job's identity
```
gcloud iam service-accounts create screenshot-sa --display-name="Screenshot app service account"
```

* Grant the service account permissions to access Cloud Storage 
```
gcloud projects add-iam-policy-binding $PROJECT_ID \
  --role roles/storage.admin \
  --member serviceAccount:screenshot-sa@$PROJECT_ID.iam.gserviceaccount.com
```

* Create the Cloud Run job
```
gcloud beta run jobs create screenshot \
  --image=$REGION-docker.pkg.dev/$PROJECT_ID/containers/screenshot:v1 \
  --args="screenshot.js" \
  --args="https://example.com" \
  --args="https://cloud.google.com" \
  --tasks=2 \
  --task-timeout=5m \
  --set-env-vars=BUCKET_NAME=screenshot-$PROJECT_ID \
  --service-account=screenshot-sa@$PROJECT_ID.iam.gserviceaccount.com
```

* Run the job
```
gcloud beta run jobs execute screenshot
```

* Describe the execution
```
gcloud beta run executions describe <EXECUTION_NAME>
```

# Run locally
* build image
```
docker build -t screenshot .
```

* prepare auth file
```
gcloud auth application-default login
cp application_default_credentials.json ./tmp/
sudo chown 999:999 ./tmp/application_default_credentials.json
```

* run locally
```
-it --entrypoint= \
docker run \
    -v $(get_host_pwd)/tmp/application_default_credentials.json:/tmp/application_default_credentials.json:ro \
    -e GOOGLE_APPLICATION_CREDENTIALS=/tmp/application_default_credentials.json \
    -e BUCKET_NAME=screenshot-$PROJECT_ID \
    --cap-add=SYS_ADMIN `#puppeteer requirement` \
    -e GCLOUD_PROJECT=${PROJECT_ID} \
    screenshot \
    "https://cloud.google.com"
```
