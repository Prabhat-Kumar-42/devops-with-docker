# Stage 1: Build the application
FROM golang:1.16-alpine as builder

# Set environment variables
ENV CGO_ENABLED=0 GOOS=linux GOARCH=amd64

# Set the working directory
WORKDIR /app

# Copy source files
COPY . .

# Download dependencies and build the binary
RUN go mod tidy && \
    go build -o server .

# Stage 2: Create a minimal image
FROM scratch

# Set the working directory in the final image
WORKDIR /app

# Copy the compiled binary from the builder stage
COPY --from=builder /app/server /app/

# Set environment variable
ENV REQUEST_ORIGIN=*

# Expose the application's port
EXPOSE 8080

# Run the binary
CMD ["/app/server"]

