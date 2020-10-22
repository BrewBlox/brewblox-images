FROM alpine
WORKDIR /certs
VOLUME /certs

COPY ./app /app
RUN apk --update add bash openssl

CMD /app/brewblox-certs
