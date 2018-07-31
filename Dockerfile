FROM centos:7

ADD setup /tmp/
RUN /tmp/yum.sh
RUN /tmp/nodejs.sh
RUN /tmp/android.sh
RUN /tmp/bash.sh
