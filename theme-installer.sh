#!/bin/bash

curl -fSsLO https://raw.githubusercontent.com/pydemia/pydemia-theme/master/install_themes.sh && \
  chmod +x install_themes.sh && \
  ./install_themes.sh && \
rm -f ./install_themes.sh
