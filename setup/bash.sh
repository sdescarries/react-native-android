#!/bin/bash

{
export ANDROID_HOME=/opt/android
export GRADLE_HOME=/opt/gradle
export NVM_DIR=/opt/nvm
export NODE_VERSION=v10.7.0
export YARN_VERSION=1.9.2


cat > ${HOME}/.bashrc << EOF
# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

source /etc/bashrc

export ANDROID_HOME=${ANDROID_HOME}
export GRADLE_HOME=${GRADLE_HOME}
export NVM_DIR=${NVM_DIR}
export NODE_VERSION=${NODE_VERSION}
export YARN_VERSION=${YARN_VERSION}

PATH=\${ANDROID_HOME}/tools:\${PATH}
PATH=\${ANDROID_HOME}/platform-tools:\${PATH}
PATH=\${GRADLE_HOME}/bin:\${PATH}
PATH=\${NVM_DIR}/versions/node/${NODE_VERSION}/bin:\${PATH}
PATH=/opt/yarn/bin:\${PATH}

export PATH

EOF

}
