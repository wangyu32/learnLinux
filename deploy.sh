BRANCH=develop
PROJECT=garage
WAR_NAME=$PROJECT".war"
GIT_DIR=/opt/garage
TOMCAT_HOME=/opt/apache-tomcat-8.5.35

WAR_DIR=$TOMCAT_HOME/webapps
WAR_PATH=$WAR_DIR/$WAR_NAME
BACKUP_DIR=$GIT_DIR/backup
WAR_TARGET=$GIT_DIR/$PROJECT/target

TIME=`date +"%Y%m%d%k%M%S"`


# stop tomcat
sh $TOMCAT_HOME/bin/shutdown.sh

# backup war using timestamp 
cd $BACKUP_DIR
mkdir $TIME
test -e $WAR_PATH && cp $WAR_PATH $BACKUP_DIR/$TIME/$WAR_NAME

# remove old project dir and war
echo remove old project dir and war 
echo cd $WAR_DIR
cd $WAR_DIR

echo rm -rf $PROJECT"*"
rm -rf $PROJECT $WAR_NAME

#echo `test -e $TOMCATE_HOME/work/Catalina/localhost`
#test -e $TOMCATE_HOME/work/Catalina/localhost && rm -rf $TOMCATE_HOME/work/Catalina/localhost/$PROJECT

echo pull code from git
echo cd $GIT_DIR/$PROJECT
cd $GIT_DIR/$PROJECT
git checkout $BRANCH && git pull

echo huild code
#sh build.sh

mvn clean install -Dmaven.test.skip=true >> $GIT_DIR/build.log

echo copy war file to tomcat webapps dir
echo cd $WAR_TARGET
cd $WAR_TARGET
echo cp $WAR_NAME $WAR_DIR/$WAR_NAME 
cp $WAR_NAME $WAR_DIR/

echo start tomcat
cd $TOMCAT_HOME/bin
nohup sh $TOMCAT_HOME/bin/startup.sh &

~                                                                  
