FILE="/vagrant/repositories/origin/.git/hooks/post-receive"

touch $FILE

echo 'while read oldrev newrev ref' > $FILE
echo 'do' >> $FILE
echo 'timestamp=$(date +%s.%3N)' >> $FILE
echo '    echo "$timestamp:" >> /vagrant/push.log' >> $FILE
echo '    echo "    date: $(date)" >> /vagrant/push.log' >> $FILE
echo '    echo "    oldrev: $oldrev" >> /vagrant/push.log' >> $FILE
echo '    echo "    newrev: $newrev" >> /vagrant/push.log' >> $FILE
echo '    echo "    ref: $ref" >> /vagrant/push.log' >> $FILE
echo '    echo "" >> /vagrant/push.log' >> $FILE
echo '    /vagrant/callbackbuilder.sh $timestamp $date $oldrev $newrev $ref' >> $FILE
echo 'done' >> $FILE

chmod +x $FILE

# reset log files
function resetLogFile {
    if [ -f $1 ]; then
        rm $1
    fi
    touch $1
}

resetLogFile /vagrant/push.log
resetLogFile /vagrant/build.log


echo "Done."