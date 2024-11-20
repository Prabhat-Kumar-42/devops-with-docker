FROM ubuntu:22.04

RUN apt -y update && apt install -y curl

WORKDIR /usr/src/app

COPY script.sh .

CMD ["./script.sh"]
