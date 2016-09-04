home_dir=$(pwd)
mongodb_connect=$(env | grep DB.*PORT_27017_TCP= | sed -e 's|.*tcp://||' | paste -sd , | cut -d',' -f1)

echo $mongodb_connect > /usr/src/temp

#sed -r -i "s/localhost:27017/$mongodb_connect/g" /usr/src/bms/bms-master/src/main/webapp/WEB-INF/web.xml

sed -i -e "s/localhost:27017/${mongodb_connect}/g" $home_dir/usr/src/bms/bms-master/src/main/webapp/WEB-INF/web.xml

#sed -i -e "s/localhost:27017/${mongodb_connect}/g" $home_dir/var/lib/tomcat7/webapps/watch/WEB-INF

#echo "hello" > /usr/src/temp
