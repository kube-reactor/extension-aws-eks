#!/usr/bin/env bash
#
#=========================================================================================
#
# Install any platform OS dependencies
#
if ! which aws 1>/dev/null 2>&1; then
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

  unzip -o awscliv2.zip
  sudo ./aws/install --update

  rm -f awscliv2.zip
  rm -Rf ./aws/install
fi
