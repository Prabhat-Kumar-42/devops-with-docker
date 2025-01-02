#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <GitHub_Repository> <Docker_Hub_Repository>"
  exit 1
fi

# Parse arguments
GITHUB_REPO=$1
DOCKER_REPO=$2

# Extract the repository name from the GitHub repository
REPO_NAME=$(basename "$GITHUB_REPO")
GITHUB_URL="https://github.com/$GITHUB_REPO.git"

# Clone the GitHub repository
echo "Cloning repository $GITHUB_URL"
git clone "$GITHUB_URL"

# Navigate to the repository directory
cd "$REPO_NAME"

# Build the Docker image
echo "Building Docker image $DOCKER_REPO"
docker build -t "$DOCKER_REPO" .

# Check if the user is already logged into Docker Hub
echo "Checking Docker login status"
if ! docker info >/dev/null 2>&1; then
  echo "Logging into Docker Hub"
  docker login
else
  echo "Already logged into Docker Hub"
fi

# Push the Docker image to Docker Hub
echo "Pushing Docker image to $DOCKER_REPO"
docker push "$DOCKER_REPO"

# Clean up
cd ..
echo "Cleaning up cloned repository"
rm -rf "$REPO_NAME"

echo "Done!"

