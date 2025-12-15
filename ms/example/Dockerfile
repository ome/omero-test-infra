FROM alpine:latest

EXPOSE 8080
WORKDIR /serve

RUN mkdir /serve
RUN echo "hello world" >> /serve/file.txt

RUN apk --no-cache -U add python3 && \
    apk upgrade --no-cache -U -a  
# Patch OpenSSL vulnerability^

ENTRYPOINT [ "python3", "-m", "http.server", "8080" ]
