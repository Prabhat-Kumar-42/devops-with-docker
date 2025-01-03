# Stage 1: Build Stage
FROM node:16-alpine AS build

WORKDIR /usr/src/app

# Set environment variable for the build
ENV REACT_APP_BACKEND_URL=http://localhost:8080

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code and build it
COPY . .
RUN npm run build

# Stage 2: Runtime Stage
FROM nginx:alpine

# Copy built assets from the build stage to the Nginx folder
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose the port for Nginx
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

