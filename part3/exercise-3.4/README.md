# Dockerized Builder

This project provides a Dockerized environment to automate the process of building and pushing Docker images from a GitHub repository to Docker Hub.

## Overview

You can use the provided `dockerized-builder` Docker image to clone a GitHub repository, build a Docker image from it, and push the image to Docker Hub. The process is automated through a script (`builder.sh`), which is run inside the container.

### Required Environment Variables:

Before running the container, make sure to set the following environment variables:

1. **DOCKER_USER**: Your Docker Hub username.
2. **DOCKER_PWD**: Your Docker Hub password.

These environment variables will be used to log in to Docker Hub from within the container.

### Required Arguments:

The container expects two arguments when run:

1. **GitHub Repository**: The GitHub repository you want to clone. The repository should be provided in the format `username/repository`.
2. **Docker Hub Repository**: The Docker Hub repository to push the built Docker image. This should be in the format `username/repository_name`.

## Running the Docker Container

Use the following `docker run` command to start the container:

```bash
docker run --rm \
  -e DOCKER_USER="your_docker_username" \
  -e DOCKER_PWD="your_docker_password" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  dockerized-builder <GitHub_Repository> <Docker_Hub_Repository>
```
