FROM node:16-alpine

WORKDIR /usr/src/app

EXPOSE 5000

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    adduser -D nonroot && \
    rm -rf /var/lib/apt/lists/* && \
    mv build ../ && \
    rm -rf * && \
    mv ../build .

USER nonroot

CMD ["serve", "-s", "-l", "5000", "build"]


