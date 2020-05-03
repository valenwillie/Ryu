FROM --platform=linux/arm64 python:alpine

RUN apk add alpine-sdk libxml2-dev libxslt-dev libffi-dev openssl-dev git

RUN pip install ryu lxml ncclient paramiko

RUN git clone https://github.com/martimy/flowmanager.git /opt/flowmanager

RUN apk del alpine-sdk git

EXPOSE 6653/tcp
EXPOSE 6633/tcp
EXPOSE 8080/tcp

ENTRYPOINT ["ryu-manager","--verbose","--observe-links"]
