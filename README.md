https://cloud.google.com/artifact-registry/docs/docker

* Config
```
PROJECT_ID=\
REPOSITORY=\
LOCATION=\
SOURCE-IMAG=\
```

* Create standard repositories for Docker
```
gcloud artifacts repositories create ${REPOSITORY} \
    --repository-format=docker \
    --location=${LOCATION} \
    --async

gcloud artifacts repositories describe ${REPOSITORY} \
    --location=${LOCATION}

gcloud artifacts repositories list
```

* Authentication (gcloud credential helper)
```
gcloud artifacts locations list

gcloud auth configure-docker ${LOCATION}-docker.pkg.dev
```

* tag local image
```
docker tag ${SOURCE_IMAGE} ${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}/test:latest
```

* push local image
```
docker push ${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}/test
```

* Manage artifacts registry
```
gcloud artifacts docker images list ${LOCATION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}
gcloud artifacts docker images --help
```
