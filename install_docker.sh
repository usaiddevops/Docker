#!/bin/bash

# Step 1: Update Package List & Install Dependencies
sudo apt update && sudo apt install -y ca-certificates curl gnupg

# Step 2: Add Docker’s Official GPG Key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Step 3: Add Docker Repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Step 4: Install Docker & Docker Compose
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Step 5: Verify Installation
docker --version
docker compose version

# Step 6: Enable & Start Docker
sudo systemctl enable --now docker

# Step 7: Allow Running Docker Without sudo (Optional)
sudo usermod -aG docker $USER
newgrp docker

echo "Docker and Docker Compose installation is complete!"
