FROM alpine
WORKDIR /certs
VOLUME /certs

RUN apk --update add bash openssl

COPY generate-certs /usr/local/bin/generate-certs
COPY brewblox-certs /usr/local/bin/brewblox-certs

CMD /usr/local/bin/brewblox-certs
