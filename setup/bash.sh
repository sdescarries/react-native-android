#!/bin/bash

{

cat > ${HOME}/.bashrc << EOF
# .bashrc

export ANDROID_HOME=${ANDROID_HOME}
export GRADLE_HOME=${GRADLE_HOME}
export NVM_DIR=${NVM_DIR}
export NODE_VERSION=${NODE_VERSION}
export YARN_VERSION=${YARN_VERSION}
export PATH=${RPATH}

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

source /etc/bashrc

EOF

}
