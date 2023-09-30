https://cloud.google.com/run/docs/tutorials/network-filesystems-fuse#run-clone-sample-repository-python
1. Config
```
cd filesystem/
REGION=\
BUCKET_NAME=\
PROJECT_ID=\ 

```

1. Create a Cloud Storage bucket or reuse an existing bucket:
    ```
    gsutil mb -l ${REGION} gs://${BUCKET_NAME}
    ```

1. Create a service account to serve as the service identity:
    ```
    gcloud iam service-accounts create fs-identity
    ```

1. Grant the service account access to the Cloud Storage bucket:
    ```
    gcloud projects add-iam-policy-binding ${PROJECT_ID} \
         --member "serviceAccount:fs-identity@${PROJECT_ID}.iam.gserviceaccount.com" \
         --role "roles/storage.objectAdmin"
    ```

1. To deploy from source, delete extra Dockerfile and rename tutorial Dockerfile:
    ```
    gcloud run deploy filesystem-app --source . \
        --region=$REGION \
        --execution-environment gen2 \
        --allow-unauthenticated \
        --service-account fs-identity \
        --update-env-vars BUCKET=${BUCKET_NAME}

    ```

## Debugging
If the deployment does not succeed, check Cloud logging for further details.

If you would like all the logs from the mount process use the --foreground flag in combination with the mount command in the startup script, gcsfuse_run.sh:

    ```
    gcsfuse --foreground --debug_gcs --debug_fuse GCSFUSE_BUCKET MNT_DIRECTORY &
    ```
Add --debug_http for HTTP request/response debug output.
Add --debug_fuse to enable fuse-related debugging output.
Add --debug_gcs to print GCS request and timing information.
