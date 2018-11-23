https://hackernoon.com/api-testing-with-jest-d1ab74005c0a

1. Prepare work space
- Create source directory
    ```
    mkdir app && cd app
    ln -s ../node_modules ./
    ```

- Docker Build
    ```
    docker build -t lasery/tutorial-hub:jest-api-mock .
    ```

- Docker Run
    ```
    docker run -it --rm \
      -v $PWD/app:/usr/src/app \
      --net=host --pid=host \
      --name=tutorial-hub \
      lasery/tutorial-hub:jest-api-mock \
      bash
    ```

