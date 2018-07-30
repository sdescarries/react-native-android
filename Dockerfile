FROM centos:7
LABEL maintainer "simon.descarries@gmail.com"
ENV ANDROID_HOME /opt/android
ENV GRADLE_HOME  /opt/gradle
ENV NODE_VERSION v10.7.0
ENV PATH ${HOME}/.nvm/versions/node/${NODE_VERSION}/bin:${GRADLE_HOME}/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${HOME}/.yarn/bin:${HOME}/.config/yarn/global/node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Update repository cache
RUN yum makecache

# Base
RUN yum -y install git unzip wget which

# JDK
RUN yum -y install java-1.8.0-openjdk
RUN java -version

# Node.JS
COPY setup-nodejs.sh  /tmp/
RUN /tmp/setup-nodejs.sh

# Android
COPY setup-android.sh /tmp/
RUN /tmp/setup-android.sh
