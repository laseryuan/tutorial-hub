1. Create source folder app

1. Install nodemon
    ```
    docker build -t lasery/tutorial-hub:nodejs-mongodb-hapi-graphql-swagger-api .
    ```

1. Install dependencies
    ```
    docker run --rm -it \
      -v $PWD/app:/usr/src/app \
      lasery/tutorial-hub:nodejs-mongodb-hapi-graphql-swagger-api bash

    npm install --save hapi
    ```
