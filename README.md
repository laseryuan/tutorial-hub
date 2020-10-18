[Cloud Functions CI/CD with Travis CI](https://medium.com/@diogopires_55864/cloud-functions-ci-cd-with-travis-ci-107415f692fb)

[Firebase SDK for Cloud Functions Quickstart - HTTPS trigger](https://github.com/firebase/functions-samples/tree/master/quickstarts/time-server)

[Firebase Cloud Functions development environment in Gitpod](https://somegeeky.website/2020/05/12/firebase-cloud-functions-environment-in-gitpod/)
[Easy CD with Travis CI and Firebase hosting](https://dev.to/toureh/easy-cd-with-travis-ci-and-firebase-hosting-4p62)

## Get firebase auth token for CI (for the first time)
```
firebase login:ci --no-localhost
gp env -e FIREBASE_TOKEN=\
firebase init
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
travis encrypt FIREBASE_TOKEN="${FIREBASE_TOKEN}" --add
```

## Manual deploy
```
cd functions
npm install
npm run lint
cd ..

firebase deploy --token ${FIREBASE_TOKEN}
```
