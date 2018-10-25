http://www.dappuniversity.com/articles/the-ultimate-ethereum-dapp-tutorial
https://medium.com/@aas2015001/create-a-dapp-decentralized-application-with-docker-567b00e770fc

1. Prepare work space
- Initiate npm
    ```
    mkdir app && cd app
    npm init
    ```

- Docker Build
    ```
    docker build -t lasery/tutorial-hub:truffle-ganache .
    ```

- Docker Run
    ```
    docker run --rm -it \
      -v $PWD/app:/usr/src/app \
      --env-file ../../admin/env.list \
      --net=host --pid=host \
      --name=tutorial-hub \
      lasery/tutorial-hub:truffle-ganache \
      bash
    ```

1. Boilerplate with Truffle box
    ```
    rm *
    truffle unbox pet-shop
    ```

1. Deploy contract
    ```
    truffle develop # It starts a ganache-cli in background
    migrate
    ```
