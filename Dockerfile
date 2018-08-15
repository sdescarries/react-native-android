FROM centos:7

ENV \
  ANDROID_HOME=/opt/android \
  GRADLE_HOME=/opt/gradle \
  NVM_DIR=/opt/nvm \
  NODE_VERSION=v10.7.0 \
  YARN_VERSION=1.9.2

ENV PATH=/opt/yarn/bin:/opt/nvm/versions/node/${NODE_VERSION}/bin:/opt/gradle/bin:/opt/android/platform-tools:/opt/android/tools/bin:/opt/android/tools:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

RUN \
  echo -e "Installing Base" && \
  yum -y install git unzip wget which bzip2 xz gzip

RUN \
  echo -e "Installing NVM" && \
  rm -rf ${NVM_DIR} && \
  mkdir -p ${NVM_DIR} && \
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | \
  /bin/bash >> ${HOME}/setup.log 2>&1

RUN \
  echo -e "Installing Node.JS" && \
  source ${NVM_DIR}/nvm.sh && \
  nvm --version && \
  nvm install ${NODE_VERSION} >> ${HOME}/setup.log 2>&1 && \
  nvm alias default node && \
  node --version && \
  npm --version

RUN \
  echo -e "Installing Yarn" && \
  wget -qO- https://yarnpkg.com/install.sh | \
  /bin/bash -s -- --version ${YARN_VERSION} >> ${HOME}/setup.log 2>&1 && \
  rm -rf /opt/yarn && \
  mv ${HOME}/.yarn /opt/yarn && \
  yarn --version

RUN \
  echo -e "Installing Java" && \
  yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
  java -version

RUN \
  echo -e "Installing Android Tools" && \
  mkdir -p ${ANDROID_HOME} && \
  wget -qO sdk-tools-linux.zip "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" && \
  unzip -q sdk-tools-linux.zip && \
  rm -f sdk-tools-linux.zip && \
  mv -f ./tools ${ANDROID_HOME}/ && \
  sdkmanager --version

RUN \
  echo -e "Installing Gradle" && \
  rm -rf ${GRADLE_HOME} && \
  mkdir -p $(dirname ${GRADLE_HOME}) && \
  wget -qO gradle.zip "https://downloads.gradle.org/distributions/gradle-4.9-bin.zip" && \
  unzip -q gradle.zip && \
  rm -f gradle.zip && \
  mv -f ./gradle-4.9 ${GRADLE_HOME} && \
  ln -sf ${GRADLE_HOME}/bin/gradle /usr/bin/ && \
  gradle --version

RUN \
  echo -e "Installing Android SDK" && \
  echo -e 'y' | \
  sdkmanager --install \
    "tools" \
    "platform-tools" \
    "platforms;android-23" \
    "build-tools;27.0.3" \
    "extras;android;m2repository" \
    "extras;google;google_play_services" \
    "extras;google;m2repository" >> ${HOME}/setup.log 2>&1 && \
  adb --version
