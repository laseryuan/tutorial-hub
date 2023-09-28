# Create new branch for a tutorial
1. Set tutorial name
    ```
    export TUTORIAL_NAME=\
    {new-tutorial}

    echo $TUTORIAL_NAME
    ```

1. Create new branch
```
git checkout -b $TUTORIAL_NAME
git push -u origin $TUTORIAL_NAME
```

# Update branch
```
git push --force
```

# Include the branches to master branch as submodules
1. Clone the empty branch as a submodule
    ```
    git submodule add -b empty git@github.com:laseryuan/tutorial-hub tutorials/$TUTORIAL_NAME
    ```

1. Change the endpoint to new branch
    ```
    vim .gitmodules
    branch = $TUTORIAL_NAME
    ```

1. Add the submodule to master branch
    ```
    cd ~/projects/tutorial-hub
    git add tutorials/$TUTORIAL_NAME
    ```
