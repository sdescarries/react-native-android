#!/bin/bash

{

  echo -e "Installing NVM"

  wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh |
  /bin/bash &> /dev/null  ||
  exit 1

  source ~/.nvm/nvm.sh &&
  nvm --version ||
  exit 1

  echo -e "Installing Node.JS"

  nvm install ${NODE_VERSION} &> /dev/null &&
  nvm alias default node ||
  exit 1

  node --version &&
  npm --version ||
  exit 1

  echo -e "Installing Yarn"

  wget -qO- https://yarnpkg.com/install.sh | 
  /bin/bash &> /dev/null ||
  exit 1

  cat >> ~/.bashrc << EOF

export NODE_VERSION=${NODE_VERSION}

export PATH=\${HOME}/.nvm/versions/node/${NODE_VERSION}/bin:\${PATH}

EOF



}

