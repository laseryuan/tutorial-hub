https://itnext.io/step-by-step-building-and-publishing-an-npm-typescript-package-44fe7164964c

1. Prepare work space
- Create source directory
    ```
    mkdir app && cd app
    ln -s ../node_modules ./
    npm init -y
    ```

- Docker Build
    ```
    docker build -t lasery/tutorial-hub:npm-typescript-tslint-prettier-jest .
    ```

- Docker Run
    ```
    docker run -it --rm \
      -v $PWD/app:/usr/src/app \
      --name=tutorial-hub \
      lasery/tutorial-hub:npm-typescript-tslint-prettier-jest \
      bash
    ```

1. Add Typescript
    ```
    npm install --save-dev typescript
    ```

1. Build Typescript
    ```
    npm run build
    ```
