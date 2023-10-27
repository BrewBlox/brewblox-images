FROM golang:alpine as base

RUN <<EOF
    set -ex

    apk add git
    git clone https://github.com/jsha/minica.git
    cd minica
    go install
EOF

FROM alpine

WORKDIR /cert

COPY --from=base /go/bin/minica /bin/minica

ENTRYPOINT ["/bin/minica"]
