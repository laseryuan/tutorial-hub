https://medium.freecodecamp.org/how-to-setup-a-powerful-api-with-nodejs-graphql-mongodb-hapi-and-swagger-e251ac189649

1. Start hapi server
    ```
    docker run --rm -it \
      -v $PWD/app:/usr/src/app \
      --net=host --pid=host \
      --name=tutorial-hub \
      lasery/tutorial-hub:nodejs-mongodb-hapi-graphql-swagger-api \
      node index.js
    ```
1. Open browser
http://localhost:4000
