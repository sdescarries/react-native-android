#!/bin/bash

{

  [ -z "${ANDROID_HOME}" ] &&
  exit 1

  [ -z "${GRADLE_HOME}" ] &&
  exit 1

  mkdir -p ${ANDROID_HOME} &&
  wget -qO sdk-tools-linux.zip "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" &&
  unzip -q sdk-tools-linux.zip &&
  rm -f sdk-tools-linux.zip &&
  mv -f ./tools ${ANDROID_HOME}/ ||
  exit 1

  rm -rf ${GRADLE_HOME} &&
  mkdir -p $(dirname ${GRADLE_HOME}) &&
  wget -qO gradle.zip "https://downloads.gradle.org/distributions/gradle-4.9-bin.zip" &&
  unzip -q gradle.zip &&
  rm -f gradle.zip &&
  mv -f ./gradle-4.9 ${GRADLE_HOME} &&
  ln -sf ${GRADLE_HOME}/bin/gradle /usr/bin/  ||
  exit 1

  echo -e 'y' |
  ${ANDROID_HOME}/tools/bin/sdkmanager --install \
    "tools" \
    "platform-tools" \
    "platforms;android-23" \
    "build-tools;27.0.3" \
    "extras;android;m2repository" \
    "extras;google;google_play_services" \
    "extras;google;m2repository" >> ${HOME}/setup.log 2>&1 ||
  exit 1

}
