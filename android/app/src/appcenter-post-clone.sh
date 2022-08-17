#!/usr/bin/env bash
 #Coloque este script em project/android/app/ 

cd .. 

# fail se algum comando falhar 
set -e 
# debug log 
set -x 

cd .. 
git clone -b beta https:// github.com/flutter/flutter.git 
export PATH=`pwd`/flutter/bin:$PATH 

flutter channel stable 
flutter doctor 

echo "Installed flutter to `pwd`/flutter" 

# build APK 
# se você receber "Execution failed for task ':app:lintVitalRelease'." error, descomente as próximas duas linhas 
# flutter build apk --debug 
# flutter build apk 
--profile flutter build apk --release 

# se você precisar de build bundle (AAB) além do seu APK, descomente a linha abaixo e a última linha deste script .
#flutter build appbundle --release --build-number $APPCENTER_BUILD_ID 

# copie o APK onde o AppCenter o encontrará 
mkdir -p android/app/build/outputs/apk/; mv build/app/outputs/apk/release/app-release.apk $_ 

# copie o AAB onde o AppCenter o encontrará 
#mkdir -p android/app/build/outputs/bundle/; mv build/app/outputs/bundle/release/app-release.aab $_