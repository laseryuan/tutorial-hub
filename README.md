https://medium.com/@anas.mammeri/vue-2-firebase-how-to-build-a-vue-app-with-firebase-authentication-system-in-15-minutes-fdce6f289c3c

1. Prepare work space
- Initiate npm
    ```
    mkdir app && cd app
    npm init
    ```

- Docker Build
    ```
    docker build -t lasery/tutorial-hub:vuejs-firebase-auth .
    ```

- Docker Run
    ```
    docker run --rm -it \
      -v $PWD/app:/usr/src/app \
      --env-file ../../admin/env.list \
      --net=host --pid=host \
      --name=tutorial-hub \
      lasery/tutorial-hub:vuejs-firebase-auth \
      npm run serve
    ```

1. Install Vuejs
    ```
    vue create . # Select router feature
    rm -rf .git # Use .git in dockerfile directory
    ```
    http://localhost:8080

# Login and Sign Up
http://localhost:8080/login  
http://localhost:8080/hello  
http://localhost:8080/sign-up  

1. Install Firebase
    ```
    npm install --save firebase
    ```
    https://console.firebase.google.com

1. SignUp with email
Enalbe "Email/Password" in Firbase console
