# Create new branch for a tutorial
1. Create new empty branch
    ```
    export TUTORIAL_NAME=\
    {new-tutorial}

    git checkout --orphan \
    $TUTORIAL_NAME

    echo $TUTORIAL_NAME
    ```

1. Clear workspace
    ```
    git reset --hard
    git clean -df
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
```
git submodule add -b $TUTORIAL_NAME git@github.com:laseryuan/tutorial-hub tutorials/$TUTORIAL_NAME
```

# Fix a commit
1. Identify the commit needs to be fixed
    ```
    Gblame
    ```

1. Checkout the target commit
    ```
    git branch
    git branch -D fix
    git log

    git checkout -b bak
    git checkout -b fix :/\
    {commit}

    git log
    ```

1. Make modification
    ```
    git commit --amend
    ```

1. Rebase to the target branch
    ```
    git checkout -f \
    $TUTORIAL_NAME

    git rebase -i fix
    drop duplicated commit if needed: drop {commit}
    ```

1. Compare with remote and push
    ```
    git diff origin/$TUTORIAL_NAME
    git push --force
    ```
