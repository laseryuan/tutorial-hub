[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/laseryuan/tutorial-hub/tree/travis-gcloud-firebase-functions-test-realtime-database-message) 
[![Build Status](https://travis-ci.com/laseryuan/tutorial-hub.svg?branch=travis-gcloud-firebase-functions-test-realtime-database-message)](https://travis-ci.com/laseryuan/tutorial-hub)

[Cloud Functions CI/CD with Travis CI](https://medium.com/@diogopires_55864/cloud-functions-ci-cd-with-travis-ci-107415f692fb)

[Firebase SDK for Cloud Functions Quickstart - Realtime Database](https://github.com/firebase/functions-samples/tree/master/quickstarts/uppercase)

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
TODO: [Use firebase provider](https://github.com/travis-ci/dpl/issues/1212)

Activate repository on https://travis-ci.com/
```
travis login --com
travis encrypt FIREBASE_TOKEN="${FIREBASE_TOKEN}" --add
```

[Embedding status images](https://docs.travis-ci.com/user/status-images/)

## Test
Offline test
```
npm test
```

TODO: Online test
```
```

## Manual deploy
```
cd functions
npm install
cd ..

firebase deploy --token ${FIREBASE_TOKEN} --only functions:addMessage,functions:makeUppercase
```
