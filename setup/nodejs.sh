#!/bin/bash

{

  export NODE_VERSION=v10.7.0
  export YARN_VERSION=1.9.2
  export NVM_DIR=/opt/nvm

  echo -e "Installing NVM"

  rm -rf ${NVM_DIR}
  mkdir -p ${NVM_DIR}
  wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh |
  /bin/bash >> ${HOME}/setup.log 2>&1 ||
  exit 1

  source ${NVM_DIR}/nvm.sh &&
  nvm --version ||
  exit 1

  echo -e "Installing Node.JS"

  nvm install ${NODE_VERSION} >> ${HOME}/setup.log 2>&1 &&
  nvm alias default node ||
  exit 1

  node --version &&
  npm --version ||
  exit 1

  echo -e "Installing Yarn"

  wget -qO- https://yarnpkg.com/install.sh | 
  /bin/bash -s -- --version ${YARN_VERSION} >> ${HOME}/setup.log 2>&1 ||
  exit 1

  rm -rf /opt/yarn
  mv ${HOME}/.yarn /opt/yarn

}
