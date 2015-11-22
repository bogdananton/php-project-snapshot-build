cd /vagrant/repositories/localdev/

git reset --hard
git checkout master

# append something and commit
echo "// " >> src/ProductSKU.php
echo "// Append at $(date)" >> src/ProductSKU.php
git commit -am "First commit at $(date)"

# append another line and a commit
echo "// ----" >> src/ProductSKU.php
git commit -am "Second commit at $(date)"

# show log
git log --oneline

# push
git push origin master

echo "Done."