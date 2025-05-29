#!/bin/bash
# Install Ansible on Ubuntu/Debian
set -e

# Set noninteractive frontend to suppress tzdata and other prompts
echo "Setting DEBIAN_FRONTEND=noninteractive to suppress prompts..."
export DEBIAN_FRONTEND=noninteractive


# Update and install prerequisites
apt-get update
apt-get install -y --no-install-recommends software-properties-common
add-apt-repository --yes --update ppa:ansible/ansible
apt-get install -y --no-install-recommends ansible
