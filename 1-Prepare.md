1. Install MongoDB
https://www.thachmai.info/2015/04/30/running-mongodb-container/
```
docker volume create mongodb-tutorial-hub
docker run -d -p 27017:27017 -v mongodb-tutorial-hub:/data/db mongo
```
