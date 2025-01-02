
# Dockerfile for Dockerized builder
FROM docker:latest

# Install necessary tools
RUN apk add --no-cache git bash

# Set working directory
WORKDIR /usr/app

# Copy the script into the current working directory
COPY ./builder.sh .

# Make the script executable
RUN chmod +x builder.sh

# Set the entrypoint to the script
ENTRYPOINT ["./builder.sh"]
