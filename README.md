> When pushing into a repo, a hook will trigger a process to clone/include dependencies using composer and then commit all files and push to a "build" repo.

----

## Usage

```bash
vagrant up
vagrant ssh

# run the commands (see below)
cd /vagrant
./1_makeBaseRepository.sh
./2_makePushHook.sh
./3_makeCloneRepository.sh
./4b_commitDeveloperChangesOnNewBranch.sh

```

----


## Demo

#### 1. Make a base repository

Creates a base repository and a build repo. The base repo is based on the dummy project files in support/demo-app.
These two should have been remote repositories, cloned here.


#### 2. Make a push hook (post-receive)

Creates a post-receive hook in the base repo.
When triggered, will log into push.log and call the callbackbuilder.sh, passing details about the branch that was received.


#### 3. Make the clone repository

Simple clone for dev / commit.


#### 4. Commit local changes

a - master
b - new branch

This will generate come commits and push them. Example 4b will generate a random branch name (pattern ID_STRING).
The push will trigger the post-receive hook and a build event will be triggered.

The build will:
 - checkout the pushed branch,
 - remove previous repo history and reinitialize the repo
 - run composer update,
 - remove the tests (sample action, other actions could be added - like removing doc and tests folders in /vendor dependencies).
 - add and commit the vendor folder
 - push the new commit to the build repository, keeping the original dev branch's name. The commit message contains details about the original commit ID.

----

#### @todo

- check difference / add a git differ between branches (original dev vs build)
- remove doc,tests and other folders from dependencies
- add a git-ls to the build repo
- expose history and build triggers (launching the callback) via an API / web frontend
