#!/bin/bash

{

  # Update repository cache
  yum clean all
  yum makecache

  # Base
  yum -y install git unzip wget which

  # JDK
  yum -y install java-1.8.0-openjdk
  java -version

}
