#!/usr/bin/bash

# Download and install the public signing key:
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg

# Install the apt-transport-https packages
sudo apt-get install apt-transport-https -y

# Save the repository definition
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/9.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-9.x.list

sudo apt update -y && sudo apt upgrade -y

# Install the Elasticsearch Debian package
sudo apt-get install elasticsearch -y