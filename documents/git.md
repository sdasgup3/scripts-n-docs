## Git


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

#### Delete a branch
```
git push origin --delete branch_name
git branch -d <name>
```

#### Deleting Master Branch
[link](http://matthew-brett.github.io/pydagogue/gh_delete_master.html)

### Undo git add
#### Before commiting
- You can undo git add before commit with ```git reset <file>```
- This will remove it from the current index (the "about to be committed" list)
without changing anything else. Note that ```git reset <file>``` is short for
```git reset HEAD <file>```
- You can use git reset without any file name to undo all due changes. This can come in handy when there are too many files to be listed one by one in a reasonable amount of time.

####After commiting
```git reset (--hard) HEAD~1```

###Undo git rm
#### Before commiting
```
git reset
git checkout -- $(git ls-files -d)
```
####After commiting
```git reset (--hard) HEAD~1```

###git mv (rename)
```
git mv oldname newname
git commit -m "message"
git push
```

###git diff “old mode 100755 new mode 100644”
- Default
```git config core.filemode false```
- Only for this project edit .git/config
```
[Core]
filemode = false
```

###Undo the local delete or change

```git checkout -- <file>```

###Stashing the changes
```
git stash
git stash list
git stash apply
```

###Git Ignore
- [source 1](https://help.github.com/articles/ignoring-files)
- [source 2](http://git-scm.com/docs/gitignore)
```
touch .gitignore
add ignore rules
check-in the file
```

###Patching
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

###Git diff directed to gvimdiff
```
git config --global diff.tool gvimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
```
- Typing git d yields the expected behavior, type :wq in vim cycles to the next file in the change-set.


###Adding a project to github
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
###Working with others repositories in Github
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

###Generating ssh keys
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
