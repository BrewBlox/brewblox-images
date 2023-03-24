FROM alpine
WORKDIR /certs
VOLUME /certs

RUN apk --update add bash openssl

COPY generate-certs /usr/local/bin/generate-certs
COPY brewblox-certs /usr/local/bin/brewblox-certs
COPY brewblox-certs.cnf /usr/local/etc/brewblox-certs.cnf

CMD /usr/local/bin/brewblox-certs
