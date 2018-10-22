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
1. Identify the commit BEFORE the changes happen
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
    git rebase -i :/\
    {commit}

    ```
    mark the target commit as "edit"

1. Make modification
    ```
    git add -u
    git commit --amend
    git rebase --continue
    ```

1. Verify the changes
    ```
    git diff origin/$TUTORIAL_NAME
    git push --force
    ```
