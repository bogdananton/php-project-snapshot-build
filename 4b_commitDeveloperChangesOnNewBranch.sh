cd /vagrant/repositories/localdev/
git reset --hard

# generate random branch name
BRANCH="$(( ( RANDOM * 10 ) ))_$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)"

# create branch
git checkout master -b $BRANCH

# commit random stuff
echo "// ---- a $(date) " >> src/ProductSKU.php
git commit -am "Branch commit at $(date), original branch: $BRANCH"

echo "// ---- b $(date) " >> src/ProductSKU.php
git commit -am "Amend 1 branch commit at $(date), original branch: $BRANCH"

echo "// ---- c $(date) " >> src/ProductSKU.php
git commit -am "Amend 2 branch commit at $(date), original branch: $BRANCH"

# show log
git log --oneline

# push
git push origin $BRANCH

echo "Done."