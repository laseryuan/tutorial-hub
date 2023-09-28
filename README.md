https://codelabs.developers.google.com/codelabs/cloud-starting-cloudrun-jobs

## Deploy a job
1. Create a service account
```
gcloud iam service-accounts create screenshot-sa --display-name="Screenshot app service account"

```

1. Grant storage.admin role to the service account
```
PROJECT_ID=\
REGION=\

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --role roles/storage.admin \
  --member serviceAccount:screenshot-sa@$PROJECT_ID.iam.gserviceaccount.com
```

1. Deploy a Cloud Run job
```
cd screenshot

gcloud beta run jobs deploy screenshot \
  --source=. \
  --args="https://yahoo.com" \
  --args="https://cloud.google.com" \
  --tasks=2 \
  --task-timeout=5m \
  --region=$REGION \
  --set-env-vars=BUCKET_NAME=screenshot-$PROJECT_ID \
  --service-account=screenshot-sa@$PROJECT_ID.iam.gserviceaccount.com
```

## Run a job
```
gcloud run jobs list
gcloud run jobs execute screenshot --region=$REGION
gcloud run jobs executions list --job screenshot --region=$REGION

EXEC_ID=\
gcloud run jobs executions describe screenshot-$EXEC_ID --region=$REGION
```

## Update a job
```
gcloud run jobs update screenshot \
  --args="https://www.pinterest.com" \
  --args="https://www.apartmenttherapy.com" \
  --args="https://www.google.com" \
  --region=$REGION \
  --tasks=3
```
