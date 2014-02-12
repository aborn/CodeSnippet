echo "begin posinstall.sh"         >> pos.log
echo "`date`"                      >> pos.log
echo "---------------------------" >> pos.log
/bin/bash /vagrant_data/postinstall.sh  >> pos.log 2>&1
#/bin/bash /vagrant_data/postconfig.sh  >> pos.log 2>&1
echo "---------------------------" >> pos.log
echo "finish posinstall.sh"        >> pos.log
echo "`date`"                      >> pos.log
