buildFile="/vagrant/build.log"
temporaryFolder="/vagrant/repositories/tmp"
composerFile="/vagrant/composer.phar"

# prepare composer file
if [ ! -f $composerFile ]; then
    wget https://getcomposer.org/composer.phar -O $composerFile
    chmod +x $composerFile
fi

# create the temporary folder. will deploy branch here
if [ -d $temporaryFolder ]; then
    rm -rf $temporaryFolder
fi

reference=$4

branchName=${reference##*/}
echo $branchName

# deploy new commit ID
git clone -b $branchName /vagrant/repositories/origin/.git $temporaryFolder
sleep 1

cd $temporaryFolder

# reinitialize git repo
rm -rf .git
mkdir .git

## build - step 1 - get dependencies
$composerFile install --no-dev
sleep 1

## build - step 2 - remove unused files
rm -rf tests/
rm -rf phpunit.xml

temporaryFolder=/vagrant/repositories/tmp

echo $PWD
git --git-dir $temporaryFolder/.git --work-tree=. init
sleep 2

git --git-dir $temporaryFolder/.git status

## build - step 3 - commit snapshot
git --git-dir $temporaryFolder/.git add .

git --git-dir $temporaryFolder/.git commit -am "original commit: $branchName, original branch $5, date: $2"
git --git-dir $temporaryFolder/.git remote add build /vagrant/repositories/build/.git
git --git-dir $temporaryFolder/.git push -u build master:$branchName

# cleanup
cd /vagrant/
rm -rf $temporaryFolder

# copy same values from push.log to build.log
echo "$1:" >> $buildFile
echo "    date: $2" >> $buildFile
echo "    oldrev: $3" >> $buildFile
echo "    newrev: $4" >> $buildFile
echo "    ref: $5" >> $buildFile
echo "    branch: $branchName" >> $buildFile
# set other values here
echo "" >> $buildFile

# get folder size: du . -s --exclude=.git
