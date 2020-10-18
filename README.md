[Cloud Functions CI/CD with Travis CI](https://medium.com/@diogopires_55864/cloud-functions-ci-cd-with-travis-ci-107415f692fb)

[Firebase SDK for Cloud Functions Quickstart - HTTPS trigger](https://github.com/firebase/functions-samples/tree/master/quickstarts/time-server)

[Firebase Cloud Functions development environment in Gitpod](https://somegeeky.website/2020/05/12/firebase-cloud-functions-environment-in-gitpod/)

## Get firebase auth token for CI (for the first time)
In google cloud shell
```
firebase login:ci --no-localhost
gp env -e FIREBASE_TOKEN=\
```

Load environment variables
```
eval $(gp env -e)
echo $FIREBASE_TOKEN
```

## Config Travis (for the first time)
Activate repository on https://travis-ci.com/
```
travis login --com
travis encrypt $FIREBASE_TOKEN --add
```
