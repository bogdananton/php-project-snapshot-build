cd /vagrant

function createFolder {
    if [ ! -d "$1" ]; then
        mkdir $1
    fi
}

# create structure
createFolder repositories
createFolder repositories/origin
createFolder repositories/build

# get files
cp /vagrant/support/demo-app/* /vagrant/repositories/origin -R

# Create origin repository. This should be a clone of a remote origin repository.
cd /vagrant/repositories/origin/
git init
git config user.email "dev@loper.local"
git config user.name "dev local"
git config receive.denyCurrentBranch "ignore"

git add .
git commit -am "Initial commit."

# Create the build repository. This should be a clone of a remote build repository!
cd /vagrant/repositories/build
git init
git config user.email "dev@loper.local"
git config user.name "dev local"
git config receive.denyCurrentBranch "ignore"

echo "Done."
