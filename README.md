[Cloud Functions CI/CD with Travis CI](https://medium.com/@diogopires_55864/cloud-functions-ci-cd-with-travis-ci-107415f692fb)

[Firebase SDK for Cloud Functions Quickstart - HTTPS trigger](https://github.com/firebase/functions-samples/tree/master/quickstarts/time-server)

[Firebase Cloud Functions development environment in Gitpod](https://somegeeky.website/2020/05/12/firebase-cloud-functions-environment-in-gitpod/)

## Get firebase auth token for CI
In google cloud shell:
```
firebase login:ci --no-localhost
```

## Install Travis
```
export GEM_HOME=/usr/local/bundle
export PATH="$PATH:$GEM_HOME/bin"
```
