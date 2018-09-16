## Git

## Commit without a new log
```
git add toplev.h toplev.c ; git commit --amend --no-edit
```

## Chnage latest commit
```
git commit --amend
```

## Chnage previous commit
```
git rebase -i
change pick to reword
```

## Commit a change to previous reveion
```
git add file
git commit -m "ABout to merge"
git rebase -i

pick R1
pick R2
pick ABout to merg

Say we want to squash "About to merge" with R1

then change it to

pick R1
s ABout to merg
pick R2

s squashes with previous commit
```

## Change author of previous commit
```
git rebase -i
pick R1
pick R2

Say we want to edit the author of R1

then change it to

edit R1
pick R2

git commit --amend --author="Author Name <email@address.com>"
git rebase --continue
```


## Sqash consequitive commits (i.e merge them)
```
git -i rebase HEAD~n
choose sqaush
```

### Diff two branches
```
git checkout a
git pull origin a
git checkout b
git pull origin b
git diff a..b
```

### Making a local folder a git repo
```
cd localFolder
git .init
git remote add origin <url>
git add .
git commit -m "init"
git push -u origin master
```

### Commit portion of changes
```
git add --patch <filename> (or -p for short)

Stage this hunk [y,n,q,a,d,/,j,J,g,s,e,?]?
Here is a description of each option:

y stage this hunk for the next commit
n do not stage this hunk for the next commit
q quit; do not stage this hunk or any of the remaining hunks
a stage this hunk and all later hunks in the file
d do not stage this hunk or any of the later hunks in the file
g select a hunk to go to
/ search for a hunk matching the given regex
j leave this hunk undecided, see next undecided hunk
J leave this hunk undecided, see next hunk
k leave this hunk undecided, see previous undecided hunk
K leave this hunk undecided, see previous hunk
s split the current hunk into smaller hunks
e manually edit the current hunk
? print hunk help
If the file is not in the repository yet, you can first do git add -N <filename>. Afterwards you can go on with git add -p <filename>.

Afterwards, you can use:
git diff --staged to check that you staged correct changes
git reset -p to unstage mistakenly added hunks
git commit -v to view your commit while you edit the commit message.
```
[Source](https://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)


###  Large files detected: Error
```
git filter-branch -f --index-filter 'git rm -r -f --ignore-unmatch <FILE_TO_REMOVE>' HEAD
```

### Splitting a subfolder out into a new repository
https://help.github.com/articles/splitting-a-subfolder-out-into-a-new-repository/

### Configure meld as git diff
```
# Add the following to your .gitconfig file.
[diff]
    tool = meld or gvimdiff
[difftool]
    prompt = false
[difftool "meld"]
    cmd = meld "$LOCAL" "$REMOTE"

```


### Merging Vs Rebase

- Merge Master changes to feature branch . ```
  git checkout feature
  git merge master
  or
  git merge master feature
  ``` Does a three way merge between feature, master
  and the common ancestor of both .

  - Pros - Cons
    - __The feature branch will have an extraneous merge__ commit every time you need to incorporate upstream changes. If master is very active, this can pollute your feature branch’s history quite a bit.


- Rebase feature branch onto master
  ```
  git checkout feature
  git rebase master
  ```
  This moves the entire feature branch to begin on the tip of the master branch, effectively `incorporating all of the new commits in feature on tip of master.`

  - Pros
    - Cleaner project history.
  - Cons
      - Loses the context provided by a merge commit—you can’t see when upstream changes were incorporated into the feature.
      - **Not** To be used on public branches.

- Interactive rebase
  ```
  git checkout feature
  git rebase -i master
  ```
  Then changing the pick command (to fixup )and/or re-ordering the entries.

- In case of conflict, git rebase will stop at the first problematic commit and leave conflict markers in the tree. You can use git diff to locate the markers (<<<<<<) and make edits to resolve the conflict. For each file you edit, you need to tell Git that the conflict has been resolved, typically this would be done with
```
           git add <filename>
```
- After resolving the conflict manually and updating the index with the desired resolution, you can continue the rebasing process with
```
           git rebase --continue
```
- Alternatively, you can undo the git rebase with
```
           git rebase --abort
```

### Why `git push` throws error after rebase

The problem is that git push assumes that remote branch can be fast-forwarded to your local branch, that is,  all the difference between local and remote branches is in local only :
```
Z--X--R         <- origin/some-branch (can be fast-forwarded to Y commit)
       \
        T--Y    <- some-branch
```
When you perform git rebase commits D and E are applied to new base and new commits are created. That means after rebase you have something like that:
```
A--B--C------F--G--D'--E'   <- feature-branch
       \
        D--E                <- origin/feature-branch
```
In that situation remote branch cannot  be fast-forwarded to local. Though, theoretically local branch can be merged into remote , but as git push performs only fast-forward merges it throws and error.

And what --force option does is just ignoring state of remote branch and setting it to the commit you are pushing into it. So `git push --force origin feature-branch` simply overrides origin/feature-branch with local feature-branch.


### Show commited files for a hash

```
git show --stat <commit-hash>
```

### Switch branch without detaching head

#### First time: make remote/branchname locally available as localname

git checkout -b localname remote/branchname

or

git checkout --track remote/branchname

or

git checkout branchname

// If the branch name you’re trying to checkout
// (a) doesn’t exist and
// (b) exactly matches a name on only one remote, Git // will create a tracking branch for you:



#### othertimes
git checkout localname




### Sync Fork
```
git fetch upstream
git checkout master
git merge upstream/master

```

### submodule
```
cd module
git submodule add https://github.com/<user>/submodule submodule
git pull origin master // update the submodule to the tip of the main module.
git add/commit/push

// Update
cd submodule_name
git checkout master && git pull
cd ..
git add submodule_name
git commit -m "updating submodule to latest"

// First time
git submodule update --init --recursive
git clone --recursive <project url> // will clone the parent module and all its submodule

// Remove
git submodule deinit -f -- submodule
rm -rf .git/modules/submodule
git rm -f submodule
git commit -m ""
git push
```

#### Update a submodule to the latest commit

```
cd projB/projA
git pull origin master
cd ..
git status
git add projB/projA
git commit -m "projA submodule updated"
```


### Keys
  ```
  ssh-keygen -t rsa -C "sdasgup3@illinois.edu"
  eval "$(ssh-agent -s)"
  chmod 600 /home/sdasgup3/.ssh/gitlab_rsa
  ssh-add ~/.ssh/id_rsa
  gvim ~/.ssh/id_rsa.pub
  (copy the code and paste it to git hub add keys)
  ssh -T git@github.com
  ```
### Caching your password
```
git config --global credential.helper 'cache --timeout=3600'
```

### Tracking remote
```
git checkout // a nop
or
git branch -vv
```

### Graphical commit history
```
git log --graph --decorate --oneline
```

### Branching
```
git checkout -b branch_name //create and checkout that branch
git branch   // to see all the available branches
git checkout branch_name   // checking out a branch
git branch -m <oldname> <newname>
```

#### Rename a branch locally and remotely
```
git branch -m old_branch new_branch         # Rename branch locally
git push origin :old_branch                 # Delete the old branch
git push --set-upstream origin new_branch   # Push the new branch, set local branch to track the new remote
```

#### Delete a branch locally and remotely
```
git push origin --delete branch_name
git branch -d <name>
```

#### Delete master branch
[link](http://matthew-brett.github.io/pydagogue/gh_delete_master.html)

### Undo git add
#### Before commiting
- You can undo git add before commit with ```git reset <file>```
- This will remove it from the current index (the "about to be committed" list)
without changing anything else. Note that ```git reset <file>``` is short for
```git reset HEAD <file>```
- You can use git reset without any file name to undo all due changes. This can come in handy when there are too many files to be listed one by one in a reasonable amount of time.

#### After commiting
```git reset (--hard) HEAD~1```

### Undo git rm
#### Before commiting
```
git reset
git checkout -- $(git ls-files -d)
```
#### After commiting
```
git reset (--hard) HEAD~1
```

### git mv (rename)

```
git mv oldname newname
git commit -m "message"
git push
```

### git diff “old mode 100755 new mode 100644”
- Default
```git config core.filemode false```
- Only for this project edit .git/config
```
[Core]
filemode = false
```

### Undo the local delete or change

```git checkout -- <file>```

### Stashing the changes
```
git stash
git stash list
git stash apply
```

### Git Ignore

- [source 1](https://help.github.com/articles/ignoring-files)
- [source 2](http://git-scm.com/docs/gitignore)

```
touch .gitignore
add ignore rules
check-in the file
```

#### Negate rule of parent directory
```
Say parent gitignore has a rule r
Use !r in subdir gitignore to bypass this.
```

### Patching
- Patch mode allows you to stage parts of a changed file, instead of the entire file. This allows you to make concise, well-crafted commits that make for an easier to read history.
```git add -p```
- [source 1](http://johnkary.net/blog/git-add-p-the-most-powerful-git-feature-youre-not-using-yet/)


###Creating and applying patch
- [source 1](https://ariejan.net/2009/10/26/how-to-create-and-apply-a-patch-with-git/)
```
git format-patch master --stdout > file.pathc
git apply --stat  file.patch
git apply file.patch
```

### Git diff directed to gvimdiff
```
git config --global diff.tool gvimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
```
- Typing git d yields the expected behavior, type :wq in vim cycles to the next file in the change-set.


### Adding a project to github
- Create a new repo in github without gitignore or readme.
- Change the current working directory to your local project.
```
git init
git add .
git commit -m "FIRST COMMIT"
Copy the repo URL from  github repository page
git remote add origin <URL>
git remote -v
git push origin master
```
### Working with others repositories in Github
- In github, fork the project.
```
git clone git@github.com:sdasgup3/mcsema.git
git remote -v            // Displays the tag origin which points to your github url
git remote add upstream https://github.com/trailofbits/mcsema
git pull origin master  // Pull from From github.com:sdasgup3/mcsema
git pull upstream master // Pull from From https://github.com/trailofbits/mcsema
  [ This is equivalent to
    git fetch upstream // a new brach upstream/master is created
    git branch master  // switch to place where to want to do the merge
    git merge upstream/master
    git commit -m ""Commit the merge"
  ]
git push origin master // Push to local branch
git remote add gitlab <url after creating a project>
git push gitlab master
```

### Generating ssh keys
- This is to generate ssh keys and adding them to got hub so as to get rid of https cloning errors.
- [source 1](https://help.github.com/articles/generating-ssh-keys)
- [source 2](https://help.github.com/articles/https-cloning-errors)
```
ssh-keygen -t rsa -C "sdasgup3@illinois.edu"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
gvim ~/.ssh/id_rsa.pub
(copy the code and paste it to git hub add keys)
ssh -T git@github.com
```

### Git config
git config user.email
git config user.name
