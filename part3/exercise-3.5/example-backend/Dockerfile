# setting base image
FROM golang:1.16-alpine

# setting working dir
WORKDIR /usr/src/app

# exposing port
EXPOSE 8080

# copy source dir
COPY . .

# build project
RUN ["go", "build"]

ENV REQUEST_ORIGIN=*

RUN adduser -D nonroot 
USER nonroot

# running server
CMD ["./server"]

