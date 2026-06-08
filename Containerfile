FROM docker.io/debian:stable-slim AS builder

RUN apt-get update && \
  apt-get -y install curl unzip

RUN curl -sfL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install

FROM docker.io/debian:stable-slim

RUN apt-get update && \
  apt-get -y install sqlite3 zstd && \
  apt-get clean

COPY --from=builder /usr/local/aws-cli /usr/local/aws-cli
COPY --from=builder /usr/local/bin /usr/local/bin
COPY backup.sh /usr/local/bin/backup

CMD [ "backup" ]
