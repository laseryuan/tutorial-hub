# Create new branch for a tutorial
1. Set tutorial name
    ```
    export TUTORIAL_NAME=\
    {new-tutorial}

    echo $TUTORIAL_NAME
    ```

1. Create new branch from the empty branch
    ```
    git checkout empty
    git checkout -b $TUTORIAL_NAME
    git push -u origin $TUTORIAL_NAME
    ```

# Update branch
```
git push --force
```

# Work on a tutorial:
```
git checkout \
$TUTORIAL_NAME
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

1. Rename the "empty" branch to the new branch
    ```
    cd tutorials/$TUTORIAL_NAME
    git branch -m empty $TUTORIAL_NAME
    git push -u origin $TUTORIAL_NAME
    ```

1. Add the submodule to master branch
    ```
    cd ~/projects/tutorial-hub
    git add tutorials/$TUTORIAL_NAME
    ```

# Fix a commit
1. Identify the {commit} when the changes happen
    ```
    Gblame
    ```

1. (optional) Backup
    ```
    git branch -D bak
    git checkout -b bak
    git checkout $TUTORIAL_NAME
    ```

1. Checkout the target commit
    ```
    git rebase -i \
    {commit}^

    ```
    mark the target commit as "edit"

1. Make modification
    ```
    git add -u
    git commit --amend # no need when resolving conflict. just continue to the next step
    git rebase --continue
    ```

1. Verify the changes
    ```
    git log
    git diff origin/$TUTORIAL_NAME
    git push --force
    ```
