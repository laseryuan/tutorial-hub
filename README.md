https://medium.freecodecamp.org/how-to-setup-a-powerful-api-with-nodejs-graphql-mongodb-hapi-and-swagger-e251ac189649

1. Start hapi server
    ```
    docker run --rm -it \
      -v $PWD/app:/usr/src/app \
      --env-file ../../admin/env.list \
      --net=host --pid=host \
      --name=tutorial-hub \
      lasery/tutorial-hub:nodejs-mongodb-hapi-graphql-swagger-api \
      npm start
    ```

1. Open browser
http://localhost:4000

1. Access api
http://localhost:4000/api/v1/paintings
    ```
    {
      "name": "Mona Lisa",
      "url": "https://en.wikipedia.org/wiki/Mona_Lisa#/media/File:Mona_Lisa,_by_Leonardo_da_Vinci,_from_C2RMF_retouched.jpg",
      "techniques": ["Portrait"]
    }
    ```

1. Open Graphiql
http://localhost:4000/graphiql
    ```
    {
      painting(id:"5bcbd77c72e28648f9b28d61") {
        name
        url
        technique
      }
    }
    ```
