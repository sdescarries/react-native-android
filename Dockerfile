FROM centos:7

ENV \
  ANDROID_HOME=/opt/android \
  YARN_VERSION=1.12.3

ENV PATH=/opt/yarn/bin:/opt/android/platform-tools:/opt/android/tools/bin:/opt/android/tools:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

RUN \
  echo -e "Installing Base" && \
  yum makecache && \
  yum -y install \
    git \
    unzip \
    wget \
    which \
    bzip2 \
    xz \
    gzip \
    epel-release \
  && \
  yum clean all

RUN \
  echo -e "Installing Node.Js and Java" && \
  yum makecache && \
  yum -y install \
    nodejs \
    java-1.8.0-openjdk \
    java-1.8.0-openjdk-devel \
    && \
  yum clean all && \
  node --version && \
  npm --version && \
  java -version

RUN \
  echo -e "Installing Yarn" && \
  wget -qO- https://yarnpkg.com/install.sh | \
  /bin/bash -s -- --version ${YARN_VERSION} >> ${HOME}/setup.log 2>&1 && \
  rm -rf /opt/yarn && \
  mv ${HOME}/.yarn /opt/yarn && \
  yarn --version

RUN \
  echo -e "Installing Android Tools" && \
  mkdir -p ${ANDROID_HOME} && \
  wget -qO sdk-tools-linux.zip "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" && \
  unzip -q sdk-tools-linux.zip && \
  rm -f sdk-tools-linux.zip && \
  mv -f ./tools ${ANDROID_HOME}/ && \
  sdkmanager --version

RUN \
  echo -e "Installing Android SDK" && \
  echo -e 'y' | \
  sdkmanager --install \
    "tools" \
    "platform-tools" \
     >> ${HOME}/setup.log 2>&1 && \
  adb --version
