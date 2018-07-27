#!/bin/bash

{

  wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh |
  /bin/bash ||
  exit 1

  source ~/.nvm/nvm.sh ||
  exit 1

  nvm --version &&
  nvm install v10 &&
  nvm alias default v10 ||
  exit 1

  node --version &&
  npm --version ||
  exit 1

  wget -qO- https://yarnpkg.com/install.sh | 
  bash ||
  exit 1

}

