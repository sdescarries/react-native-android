FROM centos:7

ENV \
  ANDROID_HOME=/opt/android \
  GRADLE_HOME=/opt/gradle \
  NVM_DIR=/opt/nvm \
  NODE_VERSION=v10.7.0 \
  YARN_VERSION=1.9.2

ENV RPATH=/opt/yarn/bin:/opt/nvm/versions/node/${NODE_VERSION}/bin:/opt/gradle/bin:/opt/android/platform-tools:/opt/android/tools/bin:/opt/android/tools:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

ENV PATH=${RPATH}

ADD setup /tmp/
RUN /tmp/yum.sh
RUN /tmp/nodejs.sh
RUN /tmp/android.sh
RUN /tmp/bash.sh
