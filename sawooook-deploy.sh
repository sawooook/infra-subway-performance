#!/bin/bash

txtrst='\033[1;37m' # White
txtred='\033[1;31m' # Red
txtylw='\033[1;33m' # Yellow
txtpur='\033[1;35m' # Purple
txtgrn='\033[1;32m' # Green
txtgra='\033[1;30m' # Gray

echo -e "${txtylw}=======================================${txtrst}"
echo -e "${txtgrn}  << 스크립트 🧐 >>${txtrst}"
echo -e "${txtylw}=======================================${txtrst}"

REPOSITORY=/home/ubuntu/
PROJECT_NAME=infra-subway-performance

function build() {
  echo -e "${txtylw}=======================================${txtrst}"
  echo -e "${txtgrn}  << PROJECT BUILD 💘 >>${txtrst}"
./gradlew clean build -x test
}

function cloneAndPull() {
    echo -e "${txtylw}=======================================${txtrst}"
    echo -e "${txtgrn}  << GIT CLONE AND PULL 😎 >>${txtrst}"

  git clone https://github.com/sawooook/infra-subway-performance.git
  cd $REPOSITORY/$PROJECT_NAME/
  git checkout step-2
  git pull
}


function moveAndCopyBuild() {
  echo -e "${txtylw}=======================================${txtrst}"
  echo -e "${txtgrn}  << MOVE AND COPY BUILD FILE 🔥 >>${txtrst}"
  cd $REPOSITORY
  cp $REPOSITORY/$PROJECT_NAME/build/libs/*.jar $REPOSITORY/
  JAR_NAME=$(ls -tr $REPOSITORY/ | grep jar | tail -n 1)
}

function checkPid() {
  echo -e "${txtylw}=======================================${txtrst}"
  echo -e "${txtgrn}  << Check Running pid 👀 >>${txtrst}"
  CURRENT_PID=$(pgrep -f  *.jar)
  echo -e "${txtgrn}  << pid: $CURRENT_PID 👀 >>${txtrst}"
  if [ -z "$CURRENT_PID" ]; then
        echo "> Nothing to kill ."
  else
        echo "> kill -15 $CURRENT_PID"
        kill -15 $CURRENT_PID
  fi
}

function deploy() {
  echo -e "${txtylw}=======================================${txtrst}"
  echo -e "${txtgrn}  << DEPLOY NEW 🏃‍♂️ >>${txtrst}"
  nohup java -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=prod -jar $REPOSITORY/$JAR_NAME
 echo -e "${txtylw}----------START APPLICATION ------------${txtrst}"
}

## START FUNCTION

## pull;
cloneAndPull;
build;
moveAndCopyBuild;
checkPid;
deploy;
