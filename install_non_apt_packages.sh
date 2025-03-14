#!/usr/bin/env bash
# -----------------------------------------------------
# Script Name:    install_non_apt_packages.sh
# Version:        1.1.0
# Author:         Yaniv Mendiuk
# Date:           2025-02-24
# Description:    This script installs kubectl and AWS CLI by:  
#                 1. Adding the Kubernetes package repository and installing kubectl.  
#                 2. Downloading, extracting, and installing AWS CLI.  
#                 3. Ensuring proper configuration and verification of installations. 
set -o errexit 
set -o pipefail 
set -x 
# -----------------------------------------------------

# Installing packages that are not included in the default APT repositories

#kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# If the folder `/etc/apt/keyrings` does not exist, it should be created before the curl command, read the note below.
# sudo mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring

# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly

sudo apt-get update
sudo apt-get install -y kubectl

#aws-cli

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

sudo apt update && sudo apt install unzip -y

unzip awscliv2.zip

sudo ./aws/install

aws --version
