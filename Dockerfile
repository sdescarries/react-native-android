FROM centos:7
LABEL maintainer "simon.descarries@gmail.com"
ENV ANDROID_HOME /opt/android

# Config
RUN usermod -s /bin/bash root

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
